package DTO;

import java.util.ArrayList;

public class Menu {
    int MenuID;
    String MenuName;
    boolean IsServing;
    ArrayList<Dish> Dishes;

    public Menu(int menuID, String menuName, boolean isServing, ArrayList<Dish> dishes) {
        MenuID = menuID;
        MenuName = menuName;
        IsServing = isServing;
        Dishes = dishes;
    }

    public Menu() {
    }

    public int getMenuID() {
        return MenuID;
    }

    public void setMenuID(int menuID) {
        MenuID = menuID;
    }

    public String getMenuName() {
        return MenuName;
    }

    public void setMenuName(String menuName) {
        MenuName = menuName;
    }

    public boolean isServing() {
        return IsServing;
    }

    public void setServing(boolean serving) {
        IsServing = serving;
    }

    public ArrayList<Dish> getDishes() {
        return Dishes;
    }

    public void setDishes(ArrayList<Dish> dishes) {
        Dishes = dishes;
    }

    @Override
    public String toString() {
        return "Menu{" +
                "MenuID=" + MenuID +
                ", MenuName='" + MenuName + '\'' +
                ", IsServing=" + IsServing +
                ", Dishes=" + Dishes +
                '}';
    }
}
