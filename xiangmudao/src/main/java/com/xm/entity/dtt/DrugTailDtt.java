package com.xm.entity.dtt;

public class DrugTailDtt implements java.io.Serializable {
    private String drugname;
    private Integer eachdosage;
    private String dosagequantity;
    private String classname;
    private String typename;
    private String medicineamount;
    private Integer ismedicare;
    private double medicareprice;
    private double inbulksellprice;
    private String prescriptioncode;

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

    public String getDosagequantity() {
        return dosagequantity;
    }

    public void setDosagequantity(String dosagequantity) {
        this.dosagequantity = dosagequantity;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getMedicineamount() {
        return medicineamount;
    }

    public void setMedicineamount(String medicineamount) {
        this.medicineamount = medicineamount;
    }

    public Integer getIsmedicare() {
        return ismedicare;
    }

    public void setIsmedicare(Integer ismedicare) {
        this.ismedicare = ismedicare;
    }

    public double getMedicareprice() {
        return medicareprice;
    }

    public void setMedicareprice(double medicareprice) {
        this.medicareprice = medicareprice;
    }

    public double getInbulksellprice() {
        return inbulksellprice;
    }

    public void setInbulksellprice(double inbulksellprice) {
        this.inbulksellprice = inbulksellprice;
    }

    public String getPrescriptioncode() {
        return prescriptioncode;
    }

    public void setPrescriptioncode(String prescriptioncode) {
        this.prescriptioncode = prescriptioncode;
    }

    @Override
    public String toString() {
        return "DrugTailDtt{" +
                "drugname='" + drugname + '\'' +
                ", eachdosage=" + eachdosage +
                ", dosagequantity='" + dosagequantity + '\'' +
                ", classname='" + classname + '\'' +
                ", typename='" + typename + '\'' +
                ", medicineamount='" + medicineamount + '\'' +
                ", ismedicare=" + ismedicare +
                ", medicareprice=" + medicareprice +
                ", inbulksellprice=" + inbulksellprice +
                ", prescriptioncode='" + prescriptioncode + '\'' +
                '}';
    }
}
