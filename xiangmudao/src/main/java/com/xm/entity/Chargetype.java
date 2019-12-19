package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Chargetype implements java.io.Serializable {

  private Integer id;
  private String typecode;
  private String typename;
  private String itemmark;
  private Integer discount;
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

    public String getItemmark() {
        return itemmark;
    }

    public void setItemmark(String itemmark) {
        this.itemmark = itemmark;
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
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
        return "Chargetype{" +
                "id=" + id +
                ", typecode='" + typecode + '\'' +
                ", typename='" + typename + '\'' +
                ", itemmark='" + itemmark + '\'' +
                ", discount=" + discount +
                ", note='" + note + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
