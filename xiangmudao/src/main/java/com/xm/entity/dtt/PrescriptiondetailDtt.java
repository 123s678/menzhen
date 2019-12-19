package com.xm.entity.dtt;

public class PrescriptiondetailDtt implements java.io.Serializable{
    private Integer id;
    private Integer prescriptionid;
    private String drugname;
    private Integer eachdosage;
    private Integer dosagequantity;
    private String forname;
    private String countname;
    private Integer medicineamount;
    private String note;
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

    public String getDrugname() {
        return drugname;
    }

    public void setDrugname(String drugname) {
        this.drugname = drugname;
    }

    public Integer getEachdosage() {
        return eachdosage;
    }

    public void setEachdosage(Integer eachdosage) {
        this.eachdosage = eachdosage;
    }

    public Integer getDosagequantity() {
        return dosagequantity;
    }

    public void setDosagequantity(Integer dosagequantity) {
        this.dosagequantity = dosagequantity;
    }

    public String getForname() {
        return forname;
    }

    public void setForname(String forname) {
        this.forname = forname;
    }

    public String getCountname() {
        return countname;
    }

    public void setCountname(String countname) {
        this.countname = countname;
    }

    public Integer getMedicineamount() {
        return medicineamount;
    }

    public void setMedicineamount(Integer medicineamount) {
        this.medicineamount = medicineamount;
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
    
}
