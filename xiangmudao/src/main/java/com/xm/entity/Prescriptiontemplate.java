package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Prescriptiontemplate implements java.io.Serializable {

  private Integer id;
  private String templatename;
  private Integer doctorid;
  private Integer prescriptiontypeid;
  private Integer classifyid;
  private String note;
  private String diagnosis;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename;
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

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Prescriptiontemplate{" +
                "id=" + id +
                ", templatename='" + templatename + '\'' +
                ", doctorid=" + doctorid +
                ", prescriptiontypeid=" + prescriptiontypeid +
                ", classifyid=" + classifyid +
                ", note='" + note + '\'' +
                ", diagnosis='" + diagnosis + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
