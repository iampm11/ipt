#include <stdio.h>
#include <jni.h>

#include "./../lib/Main.h"

JNIEXPORT void JNICALL Java_Main_Handler (JNIEnv * env, jobject jobj) {
    jclass jcls = (*env)->GetObjectClass(env, jobj);

    jfieldID sintid = (*env)->GetStaticFieldID(env, jcls, "s", "I");
    jfieldID intid = (*env)->GetFieldID(env, jcls, "i", "I");
    jfieldID doubleid = (*env)->GetFieldID(env, jcls, "d", "D");

    jint s = (*env)->GetStaticIntField(env, jcls, sintid);
    jint i = (*env)->GetIntField(env, jobj, intid);
    jdouble d = (*env)->GetDoubleField(env, jobj, doubleid);

    printf("Value of Static Int S : %d \n", s);
    printf("Value of Int S : %d \n", i);
    printf("Value of Double D : %.2f \n", d);

    jmethodID vCallID = (*env)->GetMethodID(env, jcls, "Call", "()V");
    jmethodID vCallsID = (*env)->GetMethodID(env, jcls, "Call", "(Ljava/lang/String;)V");
    jmethodID sumID = (*env)->GetMethodID(env, jcls, "sum", "(II)I");
    jmethodID avgID = (*env)->GetMethodID(env, jcls, "avg", "(II)D");
    jmethodID inputID = (*env)->GetStaticMethodID(env, jcls, "input", "()Ljava/lang/String;");


    (*env)->CallVoidMethod(env, jobj,vCallID);

    char str[100] = "Hello from C, using JAVA !!";
    jstring jstr = (*env)->NewStringUTF(env, str);
    (*env)->CallVoidMethod(env, jobj, vCallsID, jstr);

    jint sum = (*env)->CallIntMethod(env, jobj, sumID, 5, 6);
    printf("5 + 6 => %d \n", sum);

    jdouble avg = (*env)->CallDoubleMethod(env, jobj, avgID, 5, 8);
    printf("Avg of 5, 8 => %.2f \n", avg);

    jstring jinput = (*env)->CallStaticObjectMethod(env, jcls, inputID);
    const char* inputstr = (*env)->GetStringUTFChars(env, jinput, NULL);
    printf("You Typed : %s \n", inputstr);

    return;
}