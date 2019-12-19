package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

public  class Juris implements java.io.Serializable {
  private Integer id;
  private Integer employeeid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getEmployeeid() {
        return employeeid;
    }

    public void setEmployeeid(Integer employeeid) {
        this.employeeid = employeeid;
    }

    @Override
    public String toString() {
        return "Juris{" +
                "id=" + id +
                ", employeeid=" + employeeid +
                '}';
    }
}
