/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.math.BigDecimal;
import java.sql.Date;

public class Voucher {
    private int voucherID;
    private Date startDate;
    private Date endDate;
    private int fixedDiscount;
    private int limitedQuantity;
    private String description;
    private String status;
    private int percentage;
    private String voucherName;

    public Voucher() {
    }
    public Voucher(int voucherID, Date startDate, Date endDate, int fixedDiscount, int limitedQuantity, String description, String status, int percentage, String voucherName)
    {
        this.voucherID = voucherID;
        this.startDate = startDate;
        this.endDate = endDate;
        this.fixedDiscount = fixedDiscount;
        this.limitedQuantity = limitedQuantity;
        this.description = description;
        this.status = status;
        this.percentage = percentage;
        this.voucherName=voucherName;
    }
    
    public int getVoucherID() {
        return voucherID;
    }

    public String getVoucherName() {
        return voucherName;
    }

    public void setVoucherName(String voucherName) {
        this.voucherName = voucherName;
    }

    public void setVoucherID(int voucherID) {
        this.voucherID = voucherID;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public int getFixedDiscount() {
        return fixedDiscount;
    }

    public void setFixedDiscount(int fixedDiscount) {
        this.fixedDiscount = fixedDiscount;
    }

    public int getLimitedQuantity() {
        return limitedQuantity;
    }

    public void setLimitedQuantity(int limitedQuantity) {
        this.limitedQuantity = limitedQuantity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getPercentage() {
        return percentage;
    }

    public void setPercentage(int percentage) {
        this.percentage = percentage;
    }

}

