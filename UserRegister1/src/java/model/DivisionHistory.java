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

public class DivisionHistory {
    private int historyId;
    private int customerId;
    private int divitionId;
    private Date startDate;
    private Date endDate;
    private String divisionName;
    
    public DivisionHistory() {}
    
    public DivisionHistory(int customerId, int divitionId, Date startDate, Date endDate) {
        this.customerId = customerId;
        this.divitionId = divitionId;
        this.startDate = startDate;
        this.endDate = endDate;
    }
    
    public int getHistoryId() { return historyId; }
    public void setHistoryId(int historyId) { this.historyId = historyId; }
    
    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }
    
    public int getDivitionId() { return divitionId; }
    public void setDivitionId(int divitionId) { this.divitionId = divitionId; }
    
    public Date getStartDate() { return startDate; }
    public void setStartDate(Date startDate) { this.startDate = startDate; }
    
    public Date getEndDate() { return endDate; }
    public void setEndDate(Date endDate) { this.endDate = endDate; }
    
    public String getDivisionName() { return divisionName; }
    public void setDivisionName(String divisionName) { this.divisionName = divisionName; }
}