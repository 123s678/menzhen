package com.xm.entity.dto;

public class PreTailDto implements java.io.Serializable {
    private Integer id;
    private Integer pid;
    private String drugname;
    private Integer eachdosage;
    private Integer dosagequantity;
    private String forname;
    private String frename;
    private Integer medicineamount;
    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
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

    public String getFrename() {
        return frename;
    }

    public void setFrename(String frename) {
        this.frename = frename;
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

    @Override
    public String toString() {
        return "PreTailDto{" +
                "id=" + id +
                ", pid=" + pid +
                ", drugname='" + drugname + '\'' +
                ", eachdosage=" + eachdosage +
                ", dosagequantity=" + dosagequantity +
                ", forname='" + forname + '\'' +
                ", frename='" + frename + '\'' +
                ", medicineamount=" + medicineamount +
                ", note='" + note + '\'' +
                '}';
    }
}
