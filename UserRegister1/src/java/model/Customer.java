/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */

import java.util.Date;
import java.util.List;

public class Customer {
    private int customerId;
    private String nic;
    private String name;
    private Date dob;
    private String contactno;
    private String gender;
    private String address;
    private String password;
    private int addedBy;
    private int cDivition;
    private String divisionName;
    private String adminName;
    private String status;
    private List<String> paymentMethods;
    
    // Constructors
    public Customer() {}
    
    public Customer(String nic, String name, Date dob, String contactno, 
                   String gender, String address, String password, int addedBy, int cDivition) {
        this.nic = nic;
        this.name = name;
        this.dob = dob;
        this.contactno = contactno;
        this.gender = gender;
        this.address = address;
        this.password = password;
        this.addedBy = addedBy;
        this.cDivition = cDivition;
        this.status = status;
    }
    
    // Getters and Setters
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    
    public String getNic() { return nic; }
    public void setNic(String nic) { this.nic = nic; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    
    public Date getDob() { return dob; }
    public void setDob(Date dob) { this.dob = dob; }
    
    public String getContactno() { return contactno; }
    public void setContactno(String contactno) { this.contactno = contactno; }
    
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
    
    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public int getAddedBy() { return addedBy; }
    public void setAddedBy(int addedBy) { this.addedBy = addedBy; }
    
    public int getcDivition() { return cDivition; }
    public void setcDivition(int cDivition) { this.cDivition = cDivition; }
    
    public String getDivisionName() { return divisionName; }
    public void setDivisionName(String divisionName) { this.divisionName = divisionName; }
    
    public String getAdminName() { return adminName; }
    public void setAdminName(String adminName) { this.adminName = adminName; }
    
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    
    public List<String> getPaymentMethods() { return paymentMethods; }
    public void setPaymentMethods(List<String> paymentMethods) { this.paymentMethods = paymentMethods; }
}
