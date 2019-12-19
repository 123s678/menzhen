package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public class Dispensing implements java.io.Serializable {

  private Integer id;
  private Integer chargeid;
  private Integer dispensingstatus;
  private String dispensingtime;
  private Integer isvalid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getChargeid() {
        return chargeid;
    }

    public void setChargeid(Integer chargeid) {
        this.chargeid = chargeid;
    }

    public Integer getDispensingstatus() {
        return dispensingstatus;
    }

    public void setDispensingstatus(Integer dispensingstatus) {
        this.dispensingstatus = dispensingstatus;
    }

    public String getDispensingtime() {
        return dispensingtime;
    }

    public void setDispensingtime(String dispensingtime) {
        this.dispensingtime = dispensingtime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    @Override
    public String toString() {
        return "Dispensing{" +
                "id=" + id +
                ", chargeid=" + chargeid +
                ", dispensingstatus=" + dispensingstatus +
                ", dispensingtime='" + dispensingtime + '\'' +
                ", isvalid=" + isvalid +
                '}';
    }
}
