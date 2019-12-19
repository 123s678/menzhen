package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

public class Juristitle implements java.io.Serializable {

  private Integer id;
  private String jurname;
  private Integer pid;
  private Integer isVav;
  private Integer jurisid;
  private List<Juristitle> juristitleList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getJurname() {
        return jurname;
    }

    public void setJurname(String jurname) {
        this.jurname = jurname;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getIsVav() {
        return isVav;
    }

    public void setIsVav(Integer isVav) {
        this.isVav = isVav;
    }

    public Integer getJurisid() {
        return jurisid;
    }

    public void setJurisid(Integer jurisid) {
        this.jurisid = jurisid;
    }

    public List<Juristitle> getJuristitleList() {
        return juristitleList;
    }

    public void setJuristitleList(List<Juristitle> juristitleList) {
        this.juristitleList = juristitleList;
    }

    @Override
    public String toString() {
        return "Juristitle{" +
                "id=" + id +
                ", jurname='" + jurname + '\'' +
                ", pid=" + pid +
                ", isVav=" + isVav +
                ", jurisid=" + jurisid +
                '}';
    }
}
