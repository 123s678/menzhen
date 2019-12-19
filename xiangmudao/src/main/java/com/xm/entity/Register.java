package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Register implements java.io.Serializable {

  private Integer id;
  private Integer patientid;
  private Integer registertypeid;
  private String registercode;
  private Integer departmentid;
  private Integer doctorid;
  private Double registersum;
  private String registertime;
  private String registerstatus;
  private Integer registerpersonid;
  private Integer isvalid;
  private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getPatientid() {
        return patientid;
    }

    public void setPatientid(Integer patientid) {
        this.patientid = patientid;
    }

    public Integer getRegistertypeid() {
        return registertypeid;
    }

    public void setRegistertypeid(Integer registertypeid) {
        this.registertypeid = registertypeid;
    }

    public String getRegistercode() {
        return registercode;
    }

    public void setRegistercode(String registercode) {
        this.registercode = registercode;
    }

    public Integer getDepartmentid() {
        return departmentid;
    }

    public void setDepartmentid(Integer departmentid) {
        this.departmentid = departmentid;
    }

    public Integer getDoctorid() {
        return doctorid;
    }

    public void setDoctorid(Integer doctorid) {
        this.doctorid = doctorid;
    }

    public Double getRegistersum() {
        return registersum;
    }

    public void setRegistersum(Double registersum) {
        this.registersum = registersum;
    }

    public String getRegistertime() {
        return registertime;
    }

    public void setRegistertime(String registertime) {
        this.registertime = registertime;
    }

    public String getRegisterstatus() {
        return registerstatus;
    }

    public void setRegisterstatus(String registerstatus) {
        this.registerstatus = registerstatus;
    }

    public Integer getRegisterpersonid() {
        return registerpersonid;
    }

    public void setRegisterpersonid(Integer registerpersonid) {
        this.registerpersonid = registerpersonid;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Register{" +
                "id=" + id +
                ", patientid=" + patientid +
                ", registertypeid=" + registertypeid +
                ", registercode='" + registercode + '\'' +
                ", departmentid=" + departmentid +
                ", doctorid=" + doctorid +
                ", registersum=" + registersum +
                ", registertime='" + registertime + '\'' +
                ", registerstatus='" + registerstatus + '\'' +
                ", registerpersonid=" + registerpersonid +
                ", isvalid=" + isvalid +
                ", note='" + note + '\'' +
                '}';
    }
}
