package com.xm2.entity;

public class Patienttype2 {
    private int id;
    private String typecode;
    private String typename;
    private String typediscount;
    private String isvalid;
    private String note;


    public int getId() {
        return id;
    }

    public void setId(int id) {
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

    public String getTypediscount() {
        return typediscount;
    }

    public void setTypediscount(String typediscount) {
        this.typediscount = typediscount;
    }

    public String getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(String isvalid) {
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
        return "Patienttype2{" +
                "id=" + id +
                ", typecode='" + typecode + '\'' +
                ", typename='" + typename + '\'' +
                ", typediscount='" + typediscount + '\'' +
                ", isvalid='" + isvalid + '\'' +
                ", note='" + note + '\'' +
                '}';
    }
}
