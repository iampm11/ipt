# IPT Lab Experiments

```diff
- You are born an Original, so don't Copy Code.
- That said, Use the code at your own risk.
+ Please don't Ctrl+C, Create something Ctrl+N
- Exp 6, 7, 8 are not ready... YET.
```

## Folder Structure
---
1. `dist` -> Contains Final Java-Class to run, to get result
2. `lib` -> Contains Header File for C and Library file for Java
3. `src` -> Contains Source Code for project


## Steps to run JNI
---
1. `USE LINUX`
2. Install `java (jre, jdk)`, `gcc`
3. Add `java` to system path (environment variable)
4. Write Java Code
5. Gereate Java class files and C Header File -> `javac -h . app.java`
6. Include the header file in c -> `#include "<name>.h"`
7. Write the function definition in C. NOTE : No Need for main function
8. Generate .so (.dll) library file -> `gcc -fPIC -I"$JAVA_HOME/include" -I"$JAVA_HOME/include/linux" --shared -o <lib_name>.so <c_file>.c`
9. Run Java Program, including .so file `java -Djava.library.path=. <java_class_file>`



> In Case of a Problem, feel free to open a new issue.

# JNI

> JNI Primitive types : `jint, jlong, jshort, jfloat, jdouble, jbyte, jchar, jboolean`
> JNI Referance types : `jObject, jClass, jobjectArray, jthrowable`

## JNI VM Types

1. `int - I`
2. `boolean - Z`
3. `float - F`
4. `double - D`
5. `Void - V`
6. `String - Ljava/lang/String;`

## JNI ENV Functions
----

### Class
1. `jclass : (*env)->GetObjectClass(JNIEnv, jobject);`

### Methods
1. `jmethodID : (*env)->GetMethodID(JNIEnv, jclass, name, signature);`
2. `jmethodID : (*env)->GetStaticMethodID(env, jclass, name, signature);`
3. `(*env)->CallVoidMethod(JNIEnv, jobject, methodID);`
4. `jint : (*env)->CallIntMethod(JNIEnv, jobject, vars...);`
5. `jobject : (*env)->CallStaticObjectMethod(JNIEnv, jclass, vars..);`

### Variables
1. `jfieldID : (*env)->GetStaticFieldID(JNIEnv, jclass, name, signature);`
2. `jfieldID : (*env)->GetFieldID(JNIEnv, jclass, name, signature);`
3. `jfieldID : (*env)->GetStaticIntField(JNIEnv, jclass, fieldID);`
4. `jfieldID : (*env)->GetIntField(JNIEnv, jobject, fieldID)`

### Arrays
1. `const jint* : (*env)->GetIntArrayElements(JNIEnv, jintArray, NULL);`
2. `jsize : (*env)->GetArrayLength(JNInv, jintArray);`
3. `(*env)->NewIntArray(JNIEnv, jint*);`
4. `(*env)->SetIntArrayRegion(JNIEnv, jintArray, start, end, jint*);`
5. `(*env)->ReleaseIntArrayElements(JNIEnv, jintArray, const int*, 0);`

### String
1. `jstring : (*env)->GetStringUTFChars(JNIENv, jstring, NULL);`
2. `jsize : (*env)->GetStringUTFLength(JNIEnv, jstring);`
3. `jstring : (*env)->NewStringUTF(JNIEnv, char* );`
4. `(*env)->ReleaseStringUTFChars(JNIEnv, jstring, const char *);`

### Exceptions
1. `jthrowable : (*env)->ExceptionOccurred(JNIEnv);`
2. `(*env)->ExceptionDescribe(JNIEnv);`
3. `(*env)->ExceptionClear(JNIEnv);`
4. `(*env)->ThrowNew(JNIEnv, jclass, message);`

> To Get Java Exception Classes : `(*env)->FindClass(JNIEnv, "java/lang/NullPointerException");`

## Threading
1. `(*env)->MonitorEnter(JNIEnv, jobject);`
2. `(*env)->MonitorExit(JNIEnv, jobject);`