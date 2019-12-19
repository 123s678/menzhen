package com.xm.entity;


public class Supplier implements java.io.Serializable {

  private Integer id;
  private String suppliercode;
  private String suppliername;
  private String pinyincode;
  private String supplieraddress;
  private String contacts;
  private String tel;
  private String email;
  private Integer bankid;
  private String bankaccount;
  private String note;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSuppliercode() {
        return suppliercode;
    }

    public void setSuppliercode(String suppliercode) {
        this.suppliercode = suppliercode;
    }

    public String getSuppliername() {
        return suppliername;
    }

    public void setSuppliername(String suppliername) {
        this.suppliername = suppliername;
    }

    public String getPinyincode() {
        return pinyincode;
    }

    public void setPinyincode(String pinyincode) {
        this.pinyincode = pinyincode;
    }

    public String getSupplieraddress() {
        return supplieraddress;
    }

    public void setSupplieraddress(String supplieraddress) {
        this.supplieraddress = supplieraddress;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getBankid() {
        return bankid;
    }

    public void setBankid(Integer bankid) {
        this.bankid = bankid;
    }

    public String getBankaccount() {
        return bankaccount;
    }

    public void setBankaccount(String bankaccount) {
        this.bankaccount = bankaccount;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Supplier{" +
                "id=" + id +
                ", suppliercode='" + suppliercode + '\'' +
                ", suppliername='" + suppliername + '\'' +
                ", pinyincode='" + pinyincode + '\'' +
                ", supplieraddress='" + supplieraddress + '\'' +
                ", contacts='" + contacts + '\'' +
                ", tel='" + tel + '\'' +
                ", email='" + email + '\'' +
                ", bankid=" + bankid +
                ", bankaccount='" + bankaccount + '\'' +
                ", note='" + note + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
