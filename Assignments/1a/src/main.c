#include <stdio.h>
#include <jni.h>

#include "./../lib/Main.h"

JNIEXPORT void JNICALL Java_Main_Hello (JNIEnv * env, jclass cls) {
    printf("Hello From C \n");
}

JNIEXPORT jint JNICALL Java_Main_GetNum (JNIEnv * env, jclass cls) {
    jint n = 99;
    return n;
}

JNIEXPORT jint JNICALL Java_Main_Increment (JNIEnv * env, jclass cls, jint num) {
    return num + 1;
}

JNIEXPORT jint JNICALL Java_Main_Add (JNIEnv * env, jclass cls, jint a, jint b) {
    return a+b;
}