/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ACER
 */

import util.DBConnection;

import java.sql.*;

public class DivisionHistoryDAO {
    
    public void insertDivisionHistory(int customerId, int divitionId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO DivitionHistory (CustomerId, DivitionId, startDate) VALUES (?, ?, GETDATE())"
        );
        ps.setInt(1, customerId);
        ps.setInt(2, divitionId);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
    
    public void endCurrentDivisionHistory(int customerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "UPDATE DivitionHistory SET endDate = GETDATE() WHERE CustomerId = ? AND endDate IS NULL"
        );
        ps.setInt(1, customerId);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
    
    public void insertNewDivisionHistory(int customerId, int divitionId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "INSERT INTO DivitionHistory (CustomerId, DivitionId, startDate, endDate) VALUES (?, ?, GETDATE(), NULL)"
        );
        ps.setInt(1, customerId);
        ps.setInt(2, divitionId);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
}
