import java.util.*;
import java.io.*;

public class Main {
    static {
        System.loadLibrary("name");
    }

    public native static void print();
    public native static void hello(int n);

    public static void main(String[] args) {
        print();
        hello(10);
    }
}