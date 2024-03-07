/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author PC
 */
public class CategoryDAO {
    private final String READ = "select * from category";
    
    public List<Category> readProducts() {
        ArrayList<Category> results = new ArrayList<>();
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement(READ);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);                
                Category x = new Category(id, name);
                results.add(x);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return results;
    }
    
    public int findId(String name) {
        int id = -1;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("select CategoryID from Category where CategoryName = ?");
            stm.setString(1, name);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return id;
    }
    
    public static String findName(int id) {
        String name = null;
        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement stm = con.prepareStatement("select CategoryName from Category where CategoryID = ?");
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                name = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

}
