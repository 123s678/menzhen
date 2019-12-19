package com.xm.entity.dtt;

public class PatientDtt implements java.io.Serializable{
    private Integer id;
    private String patientname;
    private Integer sex;
    private String maritalstatusname;
    private String job;
    private String typename;
    private Integer age;
    private String insuretypename;
    private String medicarecode;
    private String tel;
    private String address;
    private String taboo;
    private String drugallergyhistory;
    private String identity;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPatientname() {
        return patientname;
    }

    public void setPatientname(String patientname) {
        this.patientname = patientname;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getMaritalstatusname() {
        return maritalstatusname;
    }

    public void setMaritalstatusname(String maritalstatusname) {
        this.maritalstatusname = maritalstatusname;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getInsuretypename() {
        return insuretypename;
    }

    public void setInsuretypename(String insuretypename) {
        this.insuretypename = insuretypename;
    }

    public String getMedicarecode() {
        return medicarecode;
    }

    public void setMedicarecode(String medicarecode) {
        this.medicarecode = medicarecode;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTaboo() {
        return taboo;
    }

    public void setTaboo(String taboo) {
        this.taboo = taboo;
    }

    public String getDrugallergyhistory() {
        return drugallergyhistory;
    }

    public void setDrugallergyhistory(String drugallergyhistory) {
        this.drugallergyhistory = drugallergyhistory;
    }

    public String getIdentity() {
        return identity;
    }

    public void setIdentity(String identity) {
        this.identity = identity;
    }

    @Override
    public String toString() {
        return "PatientDtt{" +
                "id=" + id +
                ", patientname='" + patientname + '\'' +
                ", sex=" + sex +
                ", maritalstatusname='" + maritalstatusname + '\'' +
                ", job='" + job + '\'' +
                ", typename='" + typename + '\'' +
                ", age=" + age +
                ", insuretypename='" + insuretypename + '\'' +
                ", medicarecode='" + medicarecode + '\'' +
                ", tel='" + tel + '\'' +
                ", address='" + address + '\'' +
                ", taboo='" + taboo + '\'' +
                ", drugallergyhistory='" + drugallergyhistory + '\'' +
                ", identity='" + identity + '\'' +
                '}';
    }
}
