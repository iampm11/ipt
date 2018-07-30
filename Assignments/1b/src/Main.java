import java.io.*;
import java.util.*;

public class Main {
    static {
        System.loadLibrary("str");
    }

    public static native String concat(String a, String b);
    public static native int strlen(String a);
    public static native String strrev(String a);

    public static void main(String[] args) {
        System.out.println(concat("Hello", "World"));
        System.out.println(strlen("Hello World"));
        System.out.println(strrev("HelloWorld"));
    }
}