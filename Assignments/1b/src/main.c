#include <stdio.h>
#include <string.h>
#include <jni.h>

#inlcude "./../lib/Main.h"

JNIEXPORT jstring JNICALL Java_Main_concat (JNIEnv * env, jclass jcls, jstring jstra, jstring jstrb) {
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

JNIEXPORT jint JNICALL Java_Main_strlen (JNIEnv * env, jclass jcls, jstring jstr) {
    const char* str = (*env)->GetStringUTFChars(env, jstr, NULL);
    int len = 0;
    int index = 0;
    while(str[index++] != '\0') {
        len++;
    }

    return len;
}

JNIEXPORT jstring JNICALL Java_Main_strrev (JNIEnv * env, jclass jcls, jstring jstr) {
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