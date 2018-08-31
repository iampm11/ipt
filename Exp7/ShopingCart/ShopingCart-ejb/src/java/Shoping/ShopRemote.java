package Shoping;

import javax.ejb.Remote;

@Remote
public interface ShopRemote {
    void addItem(int p);
    void removeItem(int b);
    int stock();
}
