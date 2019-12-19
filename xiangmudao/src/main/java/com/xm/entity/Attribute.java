package com.xm.entity;


public class Attribute implements java.io.Serializable {

  private Integer id;
  private String attributename;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAttributename() {
        return attributename;
    }

    public void setAttributename(String attributename) {
        this.attributename = attributename;
    }

    @Override
    public String toString() {
        return "Attribute{" +
                "id=" + id +
                ", attributename='" + attributename + '\'' +
                '}';
    }
}
