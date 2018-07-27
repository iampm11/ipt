#include <stdio.h>
#include <jni.h>
#include "./../lib/PassingObject.h"

// JNIEXPORT void JNICALL Java_exp1_PassingObject_changeCountValue(JNIEnv *env, jclass jcls, jobject obj) {
//     printf("C++ Rocks . Java Sucks");
//     // jclass cls = (*env)->GetObjectClass(env, obj);
//     // jmethodID mid = (*env)->GetMethodID(env, cls, "Increment", "(V)V");
//     // if(mid == 0) {
//     //     printf("No Method with Name of Increment is Found");
//     //     return;
//     // }
//     // (*env)->CallVoidMethod(env, obj, mid);
// }

JNIEXPORT void JNICALL Java_PassingObject_changeCountValue(JNIEnv * env, jobject jobj, jobject obj) {
    jclass cls = (*env)->GetObjectClass(env, obj);
    jmethodID mid = (*env)->GetMethodID(env, cls, "Increment", "()V");
    if(mid == 0) {
        printf("No Method with Name of Increment is Found");
        return;
    }
    (*env)->CallVoidMethod(env, obj, mid);

}
