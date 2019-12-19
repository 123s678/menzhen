package com.xm1.entity;

import java.util.List;

public class Attributedetail1 {
    private Integer id;
    private Integer attributeid;
    private String detailname;
    private String note;
    private Integer isvalid;

    private Attributedetail1 attributedetail1;

    public Attributedetail1 getAttributedetail1() {
        return attributedetail1;
    }

    public void setAttributedetail1(Attributedetail1 attributedetail1) {
        this.attributedetail1 = attributedetail1;
    }

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
}
