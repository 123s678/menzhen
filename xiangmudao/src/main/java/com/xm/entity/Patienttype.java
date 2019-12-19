package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Patienttype implements java.io.Serializable{

  private Integer id;
  private String typecode;
  private String typename;
  private Integer typediscount;
  private Integer isvalid;
  private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTypecode() {
        return typecode;
    }

    public void setTypecode(String typecode) {
        this.typecode = typecode;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Integer getTypediscount() {
        return typediscount;
    }

    public void setTypediscount(Integer typediscount) {
        this.typediscount = typediscount;
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
        return "Patienttype{" +
                "id=" + id +
                ", typecode='" + typecode + '\'' +
                ", typename='" + typename + '\'' +
                ", typediscount=" + typediscount +
                ", isvalid=" + isvalid +
                ", note='" + note + '\'' +
                '}';
    }
}
