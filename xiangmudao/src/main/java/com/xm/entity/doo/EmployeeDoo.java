package com.xm.entity.doo;

public class EmployeeDoo implements java.io.Serializable {
    private Integer id;
    private String employeecode;
    private String employeename;
    private String psw;
    private String pinyincode;
    private String zhicheng;
    private String zhiwu;
    private String sex;
    private String tel;
    private String departmentname;
    private String email;
    private String idcard;
    private String address;
    private String birthday;
    private String inductiontime;
    private String xueli;
    private String zhuanye;
    private String mianmao;
    private String picture;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmployeecode() {
        return employeecode;
    }

    public void setEmployeecode(String employeecode) {
        this.employeecode = employeecode;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getPsw() {
        return psw;
    }

    public void setPsw(String psw) {
        this.psw = psw;
    }

    public String getPinyincode() {
        return pinyincode;
    }

    public void setPinyincode(String pinyincode) {
        this.pinyincode = pinyincode;
    }

    public String getZhicheng() {
        return zhicheng;
    }

    public void setZhicheng(String zhicheng) {
        this.zhicheng = zhicheng;
    }

    public String getZhiwu() {
        return zhiwu;
    }

    public void setZhiwu(String zhiwu) {
        this.zhiwu = zhiwu;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getInductiontime() {
        return inductiontime;
    }

    public void setInductiontime(String inductiontime) {
        this.inductiontime = inductiontime;
    }

    public String getXueli() {
        return xueli;
    }

    public void setXueli(String xueli) {
        this.xueli = xueli;
    }

    public String getZhuanye() {
        return zhuanye;
    }

    public void setZhuanye(String zhuanye) {
        this.zhuanye = zhuanye;
    }

    public String getMianmao() {
        return mianmao;
    }

    public void setMianmao(String mianmao) {
        this.mianmao = mianmao;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "EmployeeDoo{" +
                "id=" + id +
                ", employeecode='" + employeecode + '\'' +
                ", employeename='" + employeename + '\'' +
                ", psw='" + psw + '\'' +
                ", pinyincode='" + pinyincode + '\'' +
                ", zhicheng='" + zhicheng + '\'' +
                ", zhiwu='" + zhiwu + '\'' +
                ", sex='" + sex + '\'' +
                ", tel='" + tel + '\'' +
                ", departmentname='" + departmentname + '\'' +
                ", email='" + email + '\'' +
                ", idcard='" + idcard + '\'' +
                ", address='" + address + '\'' +
                ", birthday='" + birthday + '\'' +
                ", inductiontime='" + inductiontime + '\'' +
                ", xueli='" + xueli + '\'' +
                ", zhuanye='" + zhuanye + '\'' +
                ", mianmao='" + mianmao + '\'' +
                ", picture='" + picture + '\'' +
                '}';
    }
}
