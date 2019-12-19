package com.xm2.entity;

public class Registertype2 {
    private int id;
    private String typecode;
    private String typename;
    private double typesum;
    private String note;
    private int isvalid;


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

    public double getTypesum() {
        return typesum;
    }

    public void setTypesum(double typesum) {
        this.typesum = typesum;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public int getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(int isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Registertype2{" +
                "id=" + id +
                ", typecode='" + typecode + '\'' +
                ", typename='" + typename + '\'' +
                ", typesum=" + typesum +
                ", note='" + note + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
