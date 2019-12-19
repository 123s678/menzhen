package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Prescription implements java.io.Serializable {

  private Integer id;
  private Integer registerid;
  private String prescriptioncode;
  private String prescriptionname;
  private Integer doctorid;
  private Integer prescriptiontypeid;
  private Integer classifyid;
  private String note;
  private String diagnosis;
  private String prescriptiontime;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getRegisterid() {
        return registerid;
    }

    public void setRegisterid(Integer registerid) {
        this.registerid = registerid;
    }

    public String getPrescriptioncode() {
        return prescriptioncode;
    }

    public void setPrescriptioncode(String prescriptioncode) {
        this.prescriptioncode = prescriptioncode;
    }

    public String getPrescriptionname() {
        return prescriptionname;
    }

    public void setPrescriptionname(String prescriptionname) {
        this.prescriptionname = prescriptionname;
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    public Integer getPrescriptiontypeid() {
        return prescriptiontypeid;
    }

    public void setPrescriptiontypeid(Integer prescriptiontypeid) {
        this.prescriptiontypeid = prescriptiontypeid;
    }

    public Integer getClassifyid() {
        return classifyid;
    }

    public void setClassifyid(Integer classifyid) {
        this.classifyid = classifyid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getPrescriptiontime() {
        return prescriptiontime;
    }

    public void setPrescriptiontime(String prescriptiontime) {
        this.prescriptiontime = prescriptiontime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Prescription{" +
                "id=" + id +
                ", registerid=" + registerid +
                ", prescriptioncode='" + prescriptioncode + '\'' +
                ", prescriptionname='" + prescriptionname + '\'' +
                ", doctorid=" + doctorid +
                ", prescriptiontypeid=" + prescriptiontypeid +
                ", classifyid=" + classifyid +
                ", note='" + note + '\'' +
                ", diagnosis='" + diagnosis + '\'' +
                ", prescriptiontime='" + prescriptiontime + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
