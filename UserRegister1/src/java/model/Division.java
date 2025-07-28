/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author ACER
 */

public class Division {
    private int divitionId;
    private String name;
    
    public Division() {}
    
    public Division(int divitionId, String name) {
        this.divitionId = divitionId;
        this.name = name;
    }
    
    public int getDivitionId() { return divitionId; }
    public void setDivitionId(int divitionId) { this.divitionId = divitionId; }
    
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
}