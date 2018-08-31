package Shoping;

import javax.ejb.Stateless;

@Stateless(mappedName = "shop1")
public class Shop implements ShopRemote {
    private int item = 0;

    @Override
    public void addItem(int p) {
        item += p;
    }

    @Override
    public void removeItem(int b) {
        if(item > b) {
            item -= b;
        } else {
            item = 0;
        }
    }

    @Override
    public int stock() {
        return item;
    }
    
}
