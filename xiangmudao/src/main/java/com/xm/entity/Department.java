package com.xm.entity;


public class Department implements java.io.Serializable {

  private Integer id;
  private String departmentcode;
  private String departmentname;
  private String pinyincode;
  private String wubicode;
  private String site;
  private Integer isregister;
  private Integer isvalid;
  private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDepartmentcode() {
        return departmentcode;
    }

    public void setDepartmentcode(String departmentcode) {
        this.departmentcode = departmentcode;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getPinyincode() {
        return pinyincode;
    }

    public void setPinyincode(String pinyincode) {
        this.pinyincode = pinyincode;
    }

    public String getWubicode() {
        return wubicode;
    }

    public void setWubicode(String wubicode) {
        this.wubicode = wubicode;
    }

    public String getSite() {
        return site;
    }

    public void setSite(String site) {
        this.site = site;
    }

    public Integer getIsregister() {
        return isregister;
    }

    public void setIsregister(Integer isregister) {
        this.isregister = isregister;
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
        return "Department{" +
                "id=" + id +
                ", departmentcode='" + departmentcode + '\'' +
                ", departmentname='" + departmentname + '\'' +
                ", pinyincode='" + pinyincode + '\'' +
                ", wubicode='" + wubicode + '\'' +
                ", site='" + site + '\'' +
                ", isregister=" + isregister +
                ", isvalid=" + isvalid +
                ", note='" + note + '\'' +
                '}';
    }
}
