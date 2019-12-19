package com.xm.entity.dto;

public class MedicalrecordtemplateDto implements java.io.Serializable {
    private Integer id;//id
    private String templatecode; //模板编号,
    private String templatename; //模板名称,
    private String employeename; //医生名称,
    private String diseasename; //类别名称,
    private String  fitstatus; // 适用情况,
    private String departmentname; // 科室名称,
    private String  patientappeal; // 病人主诉,
    private String  medicalhistory; // 病人病史,
    private String physicalstatus; // 体检情况,
    private String primarydiagnosis; // 初步诊断,
    private String opinion; // 处理意见

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTemplatecode() {
        return templatecode;
    }

    public void setTemplatecode(String templatecode) {
        this.templatecode = templatecode;
    }

    public String getTemplatename() {
        return templatename;
    }

    public void setTemplatename(String templatename) {
        this.templatename = templatename;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public String getDiseasename() {
        return diseasename;
    }

    public void setDiseasename(String diseasename) {
        this.diseasename = diseasename;
    }

    public String getFitstatus() {
        return fitstatus;
    }

    public void setFitstatus(String fitstatus) {
        this.fitstatus = fitstatus;
    }

    public String getDepartmentname() {
        return departmentname;
    }

    public void setDepartmentname(String departmentname) {
        this.departmentname = departmentname;
    }

    public String getPatientappeal() {
        return patientappeal;
    }

    public void setPatientappeal(String patientappeal) {
        this.patientappeal = patientappeal;
    }

    public String getMedicalhistory() {
        return medicalhistory;
    }

    public void setMedicalhistory(String medicalhistory) {
        this.medicalhistory = medicalhistory;
    }

    public String getPhysicalstatus() {
        return physicalstatus;
    }

    public void setPhysicalstatus(String physicalstatus) {
        this.physicalstatus = physicalstatus;
    }

    public String getPrimarydiagnosis() {
        return primarydiagnosis;
    }

    public void setPrimarydiagnosis(String primarydiagnosis) {
        this.primarydiagnosis = primarydiagnosis;
    }

    public String getOpinion() {
        return opinion;
    }

    public void setOpinion(String opinion) {
        this.opinion = opinion;
    }

    @Override
    public String toString() {
        return "medicalrecordtemplateDto{" +
                "templatecode='" + templatecode + '\'' +
                ", templatename='" + templatename + '\'' +
                ", employeename='" + employeename + '\'' +
                ", diseasename='" + diseasename + '\'' +
                ", fitstatus='" + fitstatus + '\'' +
                ", departmentname='" + departmentname + '\'' +
                ", patientappeal='" + patientappeal + '\'' +
                ", medicalhistory='" + medicalhistory + '\'' +
                ", physicalstatus='" + physicalstatus + '\'' +
                ", primarydiagnosis='" + primarydiagnosis + '\'' +
                ", opinion='" + opinion + '\'' +
                '}';
    }
}
