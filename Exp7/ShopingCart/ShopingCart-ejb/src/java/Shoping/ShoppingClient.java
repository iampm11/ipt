package Shoping;

import java.util.Scanner;
import javax.naming.Context;
import javax.naming.InitialContext;

public class ShoppingClient {
    private static int choice;
    private static int itemCount;
    
    private static Scanner s;
    
    public static void getChoice() {
        System.out.println(": SHOPING CART :");
        System.out.println("-----------------------");
        System.out.println("1. Add Items");
        System.out.println("2. Buy Item");
        System.out.println("0. Close Application");
        System.out.println(">> ");
        
        choice = s.nextInt();
    }
    
    public static void getCount() {
        System.out.println("Enter Item Count :");
        itemCount = s.nextInt();
    }
    
    public static void main(String[] args) throws Exception {
        s = new Scanner(System.in);
        Context context = new InitialContext();
        ShopRemote shop = (ShopRemote)context.lookup("shop1");
        
        boolean flag = true;
        while(flag) {
            getChoice();
            switch(choice) {
                case 1: 
                    getCount();
                    shop.addItem(itemCount);
                    System.out.println("Item Added - Total Items in Cart => " + shop.stock());
                    break;
                case 2:
                    getCount();
                    shop.removeItem(itemCount);
                    System.out.println("Item Purchased - Total Items in Cart => " + shop.stock());
                    break;
                case 0:
                    flag = false;
                    break;
                default:
                    System.out.println("\n:: INVALID CHOICE ::");
            }   
        }
    }
}
   
