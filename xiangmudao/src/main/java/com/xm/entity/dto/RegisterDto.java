package com.xm.entity.dto;

public class RegisterDto implements java.io.Serializable {
    private int id;
    private String registercode;
    private String patientname;
    private String employeename;
    private String registertime;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRegistercode() {
        return registercode;
    }

    public void setRegistercode(String registercode) {
        this.registercode = registercode;
    }

    public String getPatientname() {
        return patientname;
    }

    public void setPatientname(String patientname) {
        this.patientname = patientname;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getRegistertime() {
        return registertime;
    }

    public void setRegistertime(String registertime) {
        this.registertime = registertime;
    }

    @Override
    public String toString() {
        return "RegisterDto{" +
                "id=" + id +
                ", registercode='" + registercode + '\'' +
                ", patientname='" + patientname + '\'' +
                ", employeename='" + employeename + '\'' +
                ", registertime='" + registertime + '\'' +
                '}';
    }
}
