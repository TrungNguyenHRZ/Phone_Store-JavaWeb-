/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dto;

/**
 *
 * @author MY PC
 */
public class AccountDTO {
    private int accId; 
    private String email; 
    private String password; 
    private String fullName; 
    private int status; 
    private boolean role;

    public AccountDTO() {
    }

    public AccountDTO(int accId, String email, String password, String fullName, int status, boolean role) {
        this.accId = accId;
        this.email = email;
        this.password = password;
        this.fullName = fullName;
        this.status = status;
        this.role = role;
    }

    public int getAccId() {
        return accId;
    }

    public void setAccId(int accId) {
        this.accId = accId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public boolean isRole() {
        return role;
    }

    public void setRole(boolean role) {
        this.role = role;
    }

    
    
}
