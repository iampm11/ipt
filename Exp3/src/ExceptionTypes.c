#include <stdio.h>
#include <jni.h>

#include "./../lib/ExceptionTypes.h"

JNIEXPORT jint JNICALL Java_ExceptionTypes_intMethod (JNIEnv * env, jobject jobj, jint n) {
    return n+1;
}


JNIEXPORT jboolean JNICALL Java_ExceptionTypes_booleanMethod (JNIEnv * env, jobject jobj, jboolean jbool) {
    return !jbool;
}


JNIEXPORT jstring JNICALL Java_ExceptionTypes_stringMethod (JNIEnv * env, jobject jobj, jstring jstr) {
    const char* str = (*env)->GetStringUTFChars(env, jstr, NULL);
    int i = 0,len = (*env)->GetStringUTFLength(env, jstr);

    char stra[100];
    for(i=0; i<len; i++) {
        stra[i] = str[len-1-i];
    }
    stra[i] = '\0';

    jstring strb = (*env)->NewStringUTF(env, stra);
    return strb;
}


JNIEXPORT void JNICALL Java_ExceptionTypes_doIt (JNIEnv * env, jobject jobj) {
    jclass jcls = (*env)->GetObjectClass(env, jobj);
    jmethodID mid = (*env)->GetMethodID(env, jcls, "callback", "()V");
    (*env)->CallVoidMethod(env, jobj, mid);

    jthrowable exc = (*env)->ExceptionOccurred(env);
    if (exc) {
        (*env)->ExceptionDescribe(env);
        (*env)->ExceptionClear(env);
    }

    jclass Exception1 = (*env)->FindClass(env, "java/lang/IllegalArgumentException");
    (*env)->ThrowNew(env, Exception1, "Exception From C");
}

