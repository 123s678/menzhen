package com.xm1.entity;

import java.util.List;

public class Attribute1 {
    private Integer id;
    private String attributename;


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

    public String getAttributename() {
        return attributename;
    }

    public void setAttributename(String attributename) {
        this.attributename = attributename;
    }
}
