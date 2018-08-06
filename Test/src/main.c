#include <stdio.h>
#include <jni.h>

#include "Main.h"

JNIEXPORT void JNICALL Java_Main_print(JNIEnv * env, jclass jcls) {
    printf("Hello World");
}

JNIEXPORT void JNICALL Java_Main_hello (JNIEnv * env, jclass jcls, jint ji) {
    ji = ji + 5;
    printf("%d", ji);
}
