#include <stdio.h>
#include <jni.h>

#include "./../lib/MainA.h"
#include "./../lib/MainB.h"

JNIEXPORT void JNICALL Java_MainA_Hello (JNIEnv * env, jclass cls) {
    printf("Hello From C \n");
}

JNIEXPORT jint JNICALL Java_MainA_GetNum (JNIEnv * env, jclass cls) {
    jint n = 99;
    return n;
}

JNIEXPORT jint JNICALL Java_MainA_Increment (JNIEnv * env, jclass cls, jint num) {
    return num + 1;
}

JNIEXPORT jint JNICALL Java_MainA_Add (JNIEnv * env, jclass cls, jint a, jint b) {
    return a+b;
}


JNIEXPORT jstring JNICALL Java_MainB_concat (JNIEnv * env, jclass jcls, jstring jstra, jstring jstrb) {
    const char* stra = (*env)->GetStringUTFChars(env, jstra, NULL);
    const char* strb = (*env)->GetStringUTFChars(env, jstrb, NULL);


    int lena = (*env)->GetStringUTFLength(env, jstra);
    int lenb = (*env)->GetStringUTFLength(env, jstrb);

    char str[1000];
    int j = 0;
    for(int i = 0; i < lena; i++, j++) {
        str[j] = stra[i];
    }
    for(int i = 0; i < lenb; i++, j++) {
        str[j] = strb[i];
    }
    str[j] = '\0';

    return (*env)->NewStringUTF(env, str);
}

JNIEXPORT jint JNICALL Java_MainB_strlen (JNIEnv * env, jclass jcls, jstring jstr) {
    const char* str = (*env)->GetStringUTFChars(env, jstr, NULL);
    int len = 0;
    int index = 0;
    while(str[index++] != '\0') {
        len++;
    }

    return len;
}

JNIEXPORT jstring JNICALL Java_MainB_strrev (JNIEnv * env, jclass jcls, jstring jstr) {
    const char* stra = (*env)->GetStringUTFChars(env, jstr, NULL);
    int len = 0;
    int index = 0;
    while(stra[index++] != '\0') {
        len++;
    }
    char str[len];
    for(int i = 0; i < len; i++) {
        str[i] = stra[len-1-i];
    }
    str[len] = '\0';
    return (*env)->NewStringUTF(env, str);
}