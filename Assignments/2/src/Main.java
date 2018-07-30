import java.util.*;
import java.io.*;

public class Main {
    static {
        System.loadLibrary("native");
    }

    public static int s;
    public int i;
    public double d;

    public native void Handler();

    public void Call() {
        System.out.println("Hello From Java in Java!!");
    }

    public void Call(String s) {
        System.out.println(s);
    }

    public int sum(int a, int b) {
        return a + b;
    }

    public double avg(int a, int b) {
        return (a+b)/2.0;
    }

    public static String input() {
        System.out.print("Enter a String : ");
        Scanner s = new Scanner(System.in);
        return s.nextLine();
    }

    public static void main(String[] args) {
        Main main = new Main();
        Main.s = 10;
        main.i = 20;
        main.d = 45.53;
        main.Handler();
    }
}