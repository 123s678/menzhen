package com.xm.entity.dtt;

public class PrescriptionDtt implements java.io.Serializable {
    private Integer id;
    private String registercode;
    private String prescriptioncode;
    private String prescription;
    private String prescriptionname;
    private String employeename;
    private String typename;
    private String classname;
    private String note;
    private String prescriptiontime;
    private String diagnosis;
    private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getRegistercode() {
        return registercode;
    }

    public void setRegistercode(String registercode) {
        this.registercode = registercode;
    }

    public String getPrescriptioncode() {
        return prescriptioncode;
    }

    public void setPrescriptioncode(String prescriptioncode) {
        this.prescriptioncode = prescriptioncode;
    }

    public String getPrescription() {
        return prescription;
    }

    public void setPrescription(String prescription) {
        this.prescription = prescription;
    }

    public String getPrescriptionname() {
        return prescriptionname;
    }

    public void setPrescriptionname(String prescriptionname) {
        this.prescriptionname = prescriptionname;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPrescriptiontime() {
        return prescriptiontime;
    }

    public void setPrescriptiontime(String prescriptiontime) {
        this.prescriptiontime = prescriptiontime;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "PrescriptionDtt{" +
                "id=" + id +
                ", registercode='" + registercode + '\'' +
                ", prescriptioncode='" + prescriptioncode + '\'' +
                ", prescription='" + prescription + '\'' +
                ", prescriptionname='" + prescriptionname + '\'' +
                ", employeename='" + employeename + '\'' +
                ", typename='" + typename + '\'' +
                ", classname='" + classname + '\'' +
                ", note='" + note + '\'' +
                ", prescriptiontime='" + prescriptiontime + '\'' +
                ", diagnosis='" + diagnosis + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
