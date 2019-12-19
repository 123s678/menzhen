package com.xm.entity;

public class Registertype implements java.io.Serializable {

  private Integer id;
  private String typecode;
  private String typename;
  private Double typesum;
  private String note;
  private Integer isvalid;

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

    public Double getTypesum() {
        return typesum;
    }

    public void setTypesum(Double typesum) {
        this.typesum = typesum;
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
        return "Registertype{" +
                "id=" + id +
                ", typecode='" + typecode + '\'' +
                ", typename='" + typename + '\'' +
                ", typesum=" + typesum +
                ", note='" + note + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
