/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ACER
 */

import model.Customer;
import model.DivisionHistory;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerDAO {
    
    public int insertCustomer(Customer customer) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        
        String sql = "INSERT INTO Customer (nic, name, dob, contactno, gender, address, password, AddedBy, cDivition, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
        
        ps.setString(1, customer.getNic());
        ps.setString(2, customer.getName());
        ps.setDate(3, new java.sql.Date(customer.getDob().getTime()));
        ps.setString(4, customer.getContactno());
        ps.setString(5, customer.getGender());
        ps.setString(6, customer.getAddress());
        ps.setString(7, customer.getPassword());
        ps.setInt(8, customer.getAddedBy());
        ps.setInt(9, customer.getcDivition());
       ps.setString(10, "active"); 
        
        int rowsAffected = ps.executeUpdate();
        int customerId = -1;
        
        if (rowsAffected > 0) {
            ResultSet generatedKeys = ps.getGeneratedKeys();
            if (generatedKeys.next()) {
                customerId = generatedKeys.getInt(1);
            }
            generatedKeys.close();
        }
        
        ps.close();
        con.close();
        
        return customerId;
    }
    
    public void insertCustomerPaymentMethods(int customerId, int[] paymentMethodIds) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        
        String sql = "INSERT INTO CustomerPaymentMethod (CustomerId, PaymentMethodId) VALUES (?, ?)";
        PreparedStatement ps = con.prepareStatement(sql);
        
        for (int pmId : paymentMethodIds) {
            ps.setInt(1, customerId);
            ps.setInt(2, pmId);
//            ps.addBatch();
        }
        
        ps.executeBatch();
        ps.close();
        con.close();
    }
    
    public Customer getCustomerById(int customerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        
        String sql = "SELECT c.CustomerId, c.name AS customerName, c.nic, c.dob, c.contactno, c.gender, c.address, " +
                     "d.Name AS divisionName, a.name AS adminName, c.cDivition " +
                     "FROM Customer c " +
                     "JOIN Divition d ON c.cDivition = d.divitionId " +
                     "JOIN Admin a ON c.AddedBy = a.AdminId " +
                     "WHERE c.CustomerId = ?";
        
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();
        
        Customer customer = null;
        if (rs.next()) {
            customer = new Customer();
            customer.setCustomerId(rs.getInt("CustomerId"));
            customer.setName(rs.getString("customerName"));
            customer.setNic(rs.getString("nic"));
            customer.setDob(rs.getDate("dob"));
            customer.setContactno(rs.getString("contactno"));
            customer.setGender(rs.getString("gender"));
            customer.setAddress(rs.getString("address"));
            customer.setDivisionName(rs.getString("divisionName"));
            customer.setAdminName(rs.getString("adminName"));
            customer.setcDivition(rs.getInt("cDivition"));
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return customer;
    }
    
    public int getCurrentDivision(int customerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("SELECT cDivition FROM Customer WHERE CustomerId = ?");
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();
        
        int currentDivition = 0;
        if (rs.next()) {
            currentDivition = rs.getInt("cDivition");
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return currentDivition;
    }
    
    public void updateCustomerDivision(int customerId, int newDivitionId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement("UPDATE Customer SET cDivition = ? WHERE CustomerId = ?");
        ps.setInt(1, newDivitionId);
        ps.setInt(2, customerId);
        ps.executeUpdate();
        ps.close();
        con.close();
    }
    
    public List<DivisionHistory> getCustomerDivisionHistory(int customerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT d.Name AS divisionName, dh.StartDate, dh.EndDate " +
            "FROM DivitionHistory dh " +
            "JOIN Divition d ON dh.DivitionId = d.divitionId " +
            "WHERE dh.CustomerId = ? " +
            "ORDER BY dh.StartDate DESC"
        );
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();
        
        List<DivisionHistory> history = new ArrayList<>();
        while (rs.next()) {
            DivisionHistory divHistory = new DivisionHistory();
            divHistory.setDivisionName(rs.getString("divisionName"));
            divHistory.setStartDate(rs.getDate("StartDate"));
            divHistory.setEndDate(rs.getDate("EndDate"));
            history.add(divHistory);
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return history;
    }
    
    public String getCustomerName(int customerId) throws SQLException, ClassNotFoundException {
    String name = null;
    Connection con = DBConnection.getConnection();
    String sql = "SELECT name FROM Customer WHERE id = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setInt(1, customerId);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
    }
    rs.close();
    ps.close();
    con.close();
    return name;
    }

}
