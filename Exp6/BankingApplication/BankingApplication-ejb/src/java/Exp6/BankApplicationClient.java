/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Exp6;

import java.util.Scanner;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 *
 * @author reezp
 */
public class BankApplicationClient {
    private static int choice;
    private static int amount;
    
    private static Scanner s;
    
    public static void getChoice() {
        System.out.println(": BANKING APPLICATION :");
        System.out.println("-----------------------");
        System.out.println("1. Withdraw");
        System.out.println("2. Deposit");
        System.out.println("0. Close Transcation");
        System.out.println(">> ");
        
        choice = s.nextInt();
    }
    
    public static void getAmount() {
        System.out.println("Enter Amount :");
        amount = s.nextInt();
    }
    
    public static void main(String[] args) throws Exception {
        s = new Scanner(System.in);
        Context context = new InitialContext();
        String lookUp = "java:global/BankingApplication/BankingApplication-ejb/Bank!Exp6.BankRemote";
        BankRemote bank = (BankRemote)context.lookup(lookUp);
        
        boolean flag = true;
        while(flag) {
            getChoice();
            switch(choice) {
                case 1: 
                    getAmount();
                    bank.withdraw(amount);
                    System.out.println("Transcation Successfull - New Balance => " + bank.getBalance());
                    break;
                case 2:
                    getAmount();
                    bank.deposit(amount);
                    System.out.println("Transcation Successfull - New Balance => " + bank.getBalance());
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
