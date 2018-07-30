import java.io.*;
import java.util.*;

public class Main {
    static {
        System.loadLibrary("one");
    }
    public static native void Hello();
    public static native int GetNum();
    public static native int Increment(int a);
    public static native int Add(int a, int b);

    public static void main(String[] args) {
        Main m = new Main();
        m.Hello();
        System.out.println(m.GetNum());
        System.out.println(m.Increment(10));
        System.out.println(m.Add(10, 20));
    }
}