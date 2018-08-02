import java.io.*;
import java.util.*;

public class MainA {
    static {
        System.loadLibrary("one");
    }
    public static native void Hello();
    public static native int GetNum();
    public static native int Increment(int a);
    public static native int Add(int a, int b);

    public static void main(String[] args) {
        MainA m = new MainA();
        m.Hello();
        System.out.println(m.GetNum());
        System.out.println(m.Increment(10));
        System.out.println(m.Add(10, 20));
        MainB b = new MainB();
        b.init();
    }
}