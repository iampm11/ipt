# IPT Lab Experiments

```diff
- You are born an Original, so don't Copy Code.
- That said, Use the code at your own risk.
+ Please don't Ctrl+C, Create something Ctrl+N
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