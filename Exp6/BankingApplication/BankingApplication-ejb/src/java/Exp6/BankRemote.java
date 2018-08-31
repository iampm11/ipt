package Exp6;

import javax.ejb.Remote;

@Remote
public interface BankRemote {
    void withdraw(int a);
    void deposit(int a);
    int getBalance();
}
