package com.xm.entity;

public class Attributedetail implements java.io.Serializable {

  private Integer id;
  private Integer attributeid;
  private String detailname;
  private String note;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAttributeid() {
        return attributeid;
    }

    public void setAttributeid(Integer attributeid) {
        this.attributeid = attributeid;
    }

    public String getDetailname() {
        return detailname;
    }

    public void setDetailname(String detailname) {
        this.detailname = detailname;
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
        return "Attributedetail{" +
                "id=" + id +
                ", attributeid=" + attributeid +
                ", detailname='" + detailname + '\'' +
                ", note='" + note + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
