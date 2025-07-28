/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ACER
 */

import model.Admin;
import util.DBConnection;

import java.sql.*;

public class AdminDAO {
    
    public Admin authenticateAdmin(String name, String password) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT AdminId, name FROM Admin WHERE name = ? AND password = ?"
        );
        ps.setString(1, name);
        ps.setString(2, password);
        
        ResultSet rs = ps.executeQuery();
        Admin admin = null;
        
        if (rs.next()) {
            admin = new Admin();
            admin.setAdminId(rs.getInt("AdminId"));
            admin.setName(rs.getString("name"));
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return admin;
    }
    
    public String getAdminName(int adminId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT name FROM Admin WHERE AdminId = ?");
        ps.setInt(1, adminId);
        ResultSet rs = ps.executeQuery();
        
        String adminName = "";
        if (rs.next()) {
            adminName = rs.getString("name");
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return adminName;
    }
}