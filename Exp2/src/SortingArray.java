import java.io.*;
import java.util.*;

public class SortingArray {
    {
        System.loadLibrary("sort");
    }
    static int array[];

    public static native int[] ArraySorting(int[] array);

    public static void main(String args[]) {
        System.out.print("Enter Length of Array : ");
        Scanner s = new Scanner(System.in);
        int len = s.nextInt();
        array = new int[len];

        System.out.print("Enter Content of Array : ");
        for(int i = 0; i < len; i++) {
            int t = s.nextInt();
            array[i] = t;
        }

        System.out.println("Sorted Array => ");
        int[] sortedArray = (new SortingArray()).ArraySorting(array);
        print(sortedArray);
    }

    public static void print(int[] array) {
        for(int i = 0; i < array.length; i++) {
            System.out.print(array[i] + " ");
        }
        System.out.print("\n");
    }
}