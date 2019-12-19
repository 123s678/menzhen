package com.xm.entity;

public class Viptype implements java.io.Serializable {

  private Integer id;
  private String typecode;
  private String typename;
  private Integer typediscount;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "Viptype{" +
                "id=" + id +
                ", typecode='" + typecode + '\'' +
                ", typename='" + typename + '\'' +
                ", typediscount=" + typediscount +
                ", note='" + note + '\'' +
                '}';
    }
}
