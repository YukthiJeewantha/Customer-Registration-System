/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ACER
 */

import model.Division;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DivisionDAO {
    
    public List<Division> getAllDivisions() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT divitionId, Name FROM Divition");
        
        List<Division> divisions = new ArrayList<>();
        while (rs.next()) {
            Division division = new Division();
            division.setDivitionId(rs.getInt("divitionId"));
            division.setName(rs.getString("Name"));
            divisions.add(division);
        }
        
        rs.close();
        stmt.close();
        con.close();
        
        return divisions;
    }
    
    public Division getDivisionById(int divitionId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT divitionId, Name FROM Divition WHERE divitionId = ?");
        ps.setInt(1, divitionId);
        ResultSet rs = ps.executeQuery();
        
        Division division = null;
        if (rs.next()) {
            division = new Division();
            division.setDivitionId(rs.getInt("divitionId"));
            division.setName(rs.getString("Name"));
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return division;
    }
}