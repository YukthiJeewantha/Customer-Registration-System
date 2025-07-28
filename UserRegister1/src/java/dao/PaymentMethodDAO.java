/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author ACER
 */

import model.PaymentMethod;
import util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PaymentMethodDAO {
    
    public List<PaymentMethod> getAllPaymentMethods() throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT methodId, methodName FROM PaymentMethod");
        
        List<PaymentMethod> paymentMethods = new ArrayList<>();
        while (rs.next()) {
            PaymentMethod paymentMethod = new PaymentMethod();
            paymentMethod.setMethodId(rs.getInt("methodId"));
            paymentMethod.setMethodName(rs.getString("methodName"));
            paymentMethods.add(paymentMethod);
        }
        
        rs.close();
        stmt.close();
        con.close();
        
        return paymentMethods;
    }
    
    public List<String> getCustomerPaymentMethods(int customerId) throws SQLException, ClassNotFoundException {
        Connection con = DBConnection.getConnection();
        PreparedStatement ps = con.prepareStatement(
            "SELECT pm.methodName FROM CustomerPaymentMethod cpm " +
            "JOIN PaymentMethod pm ON cpm.PaymentMethodId = pm.methodId WHERE cpm.CustomerId = ?"
        );
        ps.setInt(1, customerId);
        ResultSet rs = ps.executeQuery();
        
        List<String> paymentMethods = new ArrayList<>();
        while (rs.next()) {
            paymentMethods.add(rs.getString("methodName"));
        }
        
        rs.close();
        ps.close();
        con.close();
        
        return paymentMethods;
    }
}
