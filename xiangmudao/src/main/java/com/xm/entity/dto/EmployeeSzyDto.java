package com.xm.entity.dto;

import java.util.List;

public class EmployeeSzyDto implements java.io.Serializable {
    private String employeecode;
    private String psw;
    private String employeename;
    private Integer id;
    private String jurname;
    private Integer pid;
    private Integer isVav;
    private Integer jurisid;
    private Integer isEne;
    private String isUrl;
    private List<EmployeeSzyDto> getList;

    public String getEmployeecode() {
        return employeecode;
    }

    public void setEmployeecode(String employeecode) {
        this.employeecode = employeecode;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

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

    public Integer getIsEne() {
        return isEne;
    }

    public void setIsEne(Integer isEne) {
        this.isEne = isEne;
    }

    public String getIsUrl() {
        return isUrl;
    }

    public void setIsUrl(String isUrl) {
        this.isUrl = isUrl;
    }

    public List<EmployeeSzyDto> getGetList() {
        return getList;
    }

    public void setGetList(List<EmployeeSzyDto> getList) {
        this.getList = getList;
    }

    @Override
    public String toString() {
        return "EmployeeSzyDto{" +
                "employeecode='" + employeecode + '\'' +
                ", psw='" + psw + '\'' +
                ", employeename='" + employeename + '\'' +
                ", id=" + id +
                ", jurname='" + jurname + '\'' +
                ", pid=" + pid +
                ", isVav=" + isVav +
                ", jurisid=" + jurisid +
                ", isEne=" + isEne +
                ", isUrl='" + isUrl + '\'' +
                ", getList=" + getList +
                '}';
    }
}
