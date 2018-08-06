import java.util.*;
import java.io.*;

class ExceptionTypes {
    {
        System.loadLibrary("exception");
    }

    public native int intMethod(int n);
    public native boolean booleanMethod(boolean b);
    public native String stringMethod(String str);
    public native void doIt() throws IllegalArgumentException;
    public void callback() throws NullPointerException {
        throw new NullPointerException("CatchThrow.Callback");
    }

    public static void main(String[] args) {
        ExceptionTypes e = new ExceptionTypes();
        System.out.println(e.intMethod(10));
        System.out.println(e.booleanMethod(false));
        System.out.println(e.stringMethod("Hello World"));

        try {
            e.doIt();
        }catch(Exception ex) {
            System.out.println("Caught => " + ex.getMessage());
        }

        try {
            e.callback();
        }catch(Exception ex) {
            System.out.println("Caught in Java=> " + ex.getMessage());
        }
    }
}