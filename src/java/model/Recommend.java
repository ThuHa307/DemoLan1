/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class Recommend {
    private int height;
    private int weight;
    private String skinColor;

    public Recommend(int height, int weight, String skinColor) {
        this.height = height;
        this.weight = weight;
        this.skinColor = skinColor;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    public int getWeight() {
        return weight;
    }

    public void setWeight(int weight) {
        this.weight = weight;
    }

    public String getSkinColor() {
        return skinColor;
    }

    public void setSkinColor(String skinColor) {
        this.skinColor = skinColor;
    }

    @Override
    public String toString() {
        return "Recommend{" + "height=" + height + ", weight=" + weight + ", skinColor=" + skinColor + '}';
    }
    
    public String getSize() {
        if (145 <= height && height < 150) {
            if (40 <= weight && weight < 50) return "XS";
            else if (50 <= weight && weight < 60) return "S";
            else if (60 <= weight && weight < 75) return "L";
        } else if (150 <= height && height < 160) {
            if (40 <= weight && weight < 50) return "M";
            else if (50 <= weight && weight < 60) return "M";
            else if (60 <= weight && weight < 75) return "L";
        } else if (160 <= height && height < 170) {
            if (40 <= weight && weight < 50) return "L";
            else if (50 <= weight && weight < 60) return "L";
            else if (60 <= weight && weight < 75) return "XL";
        } else if (170<= height && height<180) {
            if (40 <= weight && weight < 50) return "XL";
            else if (50 <= weight && weight < 60) return "XL";
            else if (60 <= weight && weight < 75) return "XXL";
        }
        return null;
    }
    
    public ArrayList<String> getColor() {
        ArrayList<String> colors = new ArrayList<>();
        if(skinColor.equalsIgnoreCase("tone1")) {
            colors.add("black");
            colors.add("brown");
            colors.add("red");
            colors.add("blue");
        }
        else if(skinColor.equalsIgnoreCase("tone2")) {
            colors.add("brown");
            colors.add("pink");
            colors.add("gray");
        }
        else if(skinColor.equalsIgnoreCase("tone3")) {
            colors.add("nude");
            colors.add("pink");
            colors.add("white");
        }
        else return null;
        return colors;
    }
    
    public static String formatArrayList(ArrayList<String> arrayList) {
        StringBuilder result = new StringBuilder();

        // Duyệt qua từng phần tử trong arrayList
        for (int i = 0; i < arrayList.size(); i++) {
            // Thêm dấu nháy đơn trước và sau phần tử
            result.append("'").append(arrayList.get(i)).append("'");

            // Nếu không phải phần tử cuối cùng, thêm dấu phẩy và khoảng trắng
            if (i < arrayList.size() - 1) {
                result.append(", ");
            }
        }

        return result.toString();
    }
}
