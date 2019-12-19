package com.xm.entity.dto;

public class AttrDto implements java.io.Serializable {
    private Integer aid;
    private Integer tid;
    private String aname;
    private String tname;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getAname() {
        return aname;
    }

    public void setAname(String aname) {
        this.aname = aname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    @Override
    public String toString() {
        return "AttrDto{" +
                "aid=" + aid +
                ", tid=" + tid +
                ", aname='" + aname + '\'' +
                ", tname='" + tname + '\'' +
                '}';
    }
}
