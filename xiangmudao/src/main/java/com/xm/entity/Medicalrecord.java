package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Medicalrecord implements java.io.Serializable {

  private Integer id;
  private Integer registerid;
  private String medicalrecordcode;
  private String medicalrecordname;
  private Integer doctorid;
  private Integer diseaseid;
  private String note;
  private String patientappeal;
  private String medicalhistory;
  private String physicalstatus;
  private String primarydiagnosis;
  private String opinion;
  private String recordtime;
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

    public String getMedicalrecordcode() {
        return medicalrecordcode;
    }

    public void setMedicalrecordcode(String medicalrecordcode) {
        this.medicalrecordcode = medicalrecordcode;
    }

    public String getMedicalrecordname() {
        return medicalrecordname;
    }

    public void setMedicalrecordname(String medicalrecordname) {
        this.medicalrecordname = medicalrecordname;
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    public Integer getDiseaseid() {
        return diseaseid;
    }

    public void setDiseaseid(Integer diseaseid) {
        this.diseaseid = diseaseid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getPatientappeal() {
        return patientappeal;
    }

    public void setPatientappeal(String patientappeal) {
        this.patientappeal = patientappeal;
    }

    public String getMedicalhistory() {
        return medicalhistory;
    }

    public void setMedicalhistory(String medicalhistory) {
        this.medicalhistory = medicalhistory;
    }

    public String getPhysicalstatus() {
        return physicalstatus;
    }

    public void setPhysicalstatus(String physicalstatus) {
        this.physicalstatus = physicalstatus;
    }

    public String getPrimarydiagnosis() {
        return primarydiagnosis;
    }

    public void setPrimarydiagnosis(String primarydiagnosis) {
        this.primarydiagnosis = primarydiagnosis;
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion;
    }

    public String getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(String recordtime) {
        this.recordtime = recordtime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Medicalrecord{" +
                "id=" + id +
                ", registerid=" + registerid +
                ", medicalrecordcode='" + medicalrecordcode + '\'' +
                ", medicalrecordname='" + medicalrecordname + '\'' +
                ", doctorid=" + doctorid +
                ", diseaseid=" + diseaseid +
                ", note='" + note + '\'' +
                ", patientappeal='" + patientappeal + '\'' +
                ", medicalhistory='" + medicalhistory + '\'' +
                ", physicalstatus='" + physicalstatus + '\'' +
                ", primarydiagnosis='" + primarydiagnosis + '\'' +
                ", opinion='" + opinion + '\'' +
                ", recordtime='" + recordtime + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
