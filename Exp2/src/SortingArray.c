#include <stdio.h>
#include <jni.h>

#include "./../lib/SortingArray.h"

JNIEXPORT jintArray JNICALL Java_SortingArray_ArraySorting (JNIEnv * env, jclass cls, jintArray jarr) {
    jint *arr = (*env)->GetIntArrayElements(env, jarr, NULL);
    jsize len = (*env)->GetArrayLength(env, jarr);

    for(int i = 0; i < len; i++) {
        for(int j = i+1; j < len; j++) {
            if(arr[i] > arr[j]) {
                int temp = arr[i];
                arr[i] = arr[j];
                arr[j] = temp;
            }
        }
    }

    jintArray jniarr = (*env)->NewIntArray(env, len);
    (*env)->SetIntArrayRegion(env, jniarr, 0, len, arr);
    return jniarr;
}