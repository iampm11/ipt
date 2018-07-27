import java.io.*;
import java.util.*;


public class PassingObject {
    static {
        System.loadLibrary("pass");
    }
    PassingObject() { }

    private native void changeCountValue(SimpleClass s);


    public static void main(String[] args) {
        SimpleClass s = new SimpleClass();
        s.setCount(10);
        new PassingObject().changeCountValue(s);
    }
}

class SimpleClass {
    private int count;

    SimpleClass() {
        count = 1;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void Increment() {
        count = count * 10;
        System.out.println(count);
    }
}