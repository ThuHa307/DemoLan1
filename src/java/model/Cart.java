package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public Item getItemByID(int id) {
        for (Item i : items) {
            if (i.getProduct().getId() == id) {
                return i;
            }
        }
        return null;
    }

    public int getQuantityById(int id) {
        return getItemByID(id).getQuantity();
    }

    public void addItem(Item t) {
        //neu co o cart roi
        if (getItemByID(t.getProduct().getId()) != null) {
            Item i = getItemByID(t.getProduct().getId());
            i.setQuantity(i.getQuantity()+t.getQuantity());
        } else {
            //chua co
            items.add(t);
        }
    }
    public void removeItem(int id){
        if(getItemByID(id)!=null){
            items.remove(getItemByID(id));
        }
    }
    public double getTotalMoney(){
        double t=0;
        for (Item i : items) {
            t+=i.getQuantity()*i.getPrice();
        }
        return t;
    }
}
