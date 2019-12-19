package com.xm.entity.dto;

public class PreDto implements java.io.Serializable {
    private Integer id;
    private String templatename;
    private String employeename;
    private String typename;
    private String classname;
    private String diagnosis;
    private String note;
    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public String getClassname() {
        return classname;
    }

    public void setClassname(String classname) {
        this.classname = classname;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    public String toString() {
        return "PreDto{" +
                "id=" + id +
                ", templatename='" + templatename + '\'' +
                ", employeename='" + employeename + '\'' +
                ", typename='" + typename + '\'' +
                ", classname='" + classname + '\'' +
                ", diagnosis='" + diagnosis + '\'' +
                ", note='" + note + '\'' +
                '}';
    }
}
