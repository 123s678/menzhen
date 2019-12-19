package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Charge implements java.io.Serializable{

  private Integer id;
  private Integer prescriptionid;
  private String receiptcode;
  private String invoicecode;
  private Integer chargestatus;
  private Integer discount;
  private Integer privilege;
  private Integer beforereceivable;
  private Integer afterreceivable;
  private Integer medicarecanpay;
  private Integer cost;
  private Integer operationpersonid;
  private String chargetime;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPrescriptionid() {
        return prescriptionid;
    }

    public void setPrescriptionid(Integer prescriptionid) {
        this.prescriptionid = prescriptionid;
    }

    public String getReceiptcode() {
        return receiptcode;
    }

    public void setReceiptcode(String receiptcode) {
        this.receiptcode = receiptcode;
    }

    public String getInvoicecode() {
        return invoicecode;
    }

    public void setInvoicecode(String invoicecode) {
        this.invoicecode = invoicecode;
    }

    public Integer getChargestatus() {
        return chargestatus;
    }

    public void setChargestatus(Integer chargestatus) {
        this.chargestatus = chargestatus;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getPrivilege() {
        return privilege;
    }

    public void setPrivilege(Integer privilege) {
        this.privilege = privilege;
    }

    public Integer getBeforereceivable() {
        return beforereceivable;
    }

    public void setBeforereceivable(Integer beforereceivable) {
        this.beforereceivable = beforereceivable;
    }

    public Integer getAfterreceivable() {
        return afterreceivable;
    }

    public void setAfterreceivable(Integer afterreceivable) {
        this.afterreceivable = afterreceivable;
    }

    public Integer getMedicarecanpay() {
        return medicarecanpay;
    }

    public void setMedicarecanpay(Integer medicarecanpay) {
        this.medicarecanpay = medicarecanpay;
    }

    public Integer getCost() {
        return cost;
    }

    public void setCost(Integer cost) {
        this.cost = cost;
    }

    public Integer getOperationpersonid() {
        return operationpersonid;
    }

    public void setOperationpersonid(Integer operationpersonid) {
        this.operationpersonid = operationpersonid;
    }

    public String getChargetime() {
        return chargetime;
    }

    public void setChargetime(String chargetime) {
        this.chargetime = chargetime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Charge{" +
                "id=" + id +
                ", prescriptionid=" + prescriptionid +
                ", receiptcode='" + receiptcode + '\'' +
                ", invoicecode='" + invoicecode + '\'' +
                ", chargestatus=" + chargestatus +
                ", discount=" + discount +
                ", privilege=" + privilege +
                ", beforereceivable=" + beforereceivable +
                ", afterreceivable=" + afterreceivable +
                ", medicarecanpay=" + medicarecanpay +
                ", cost=" + cost +
                ", operationpersonid=" + operationpersonid +
                ", chargetime='" + chargetime + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
