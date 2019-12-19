package com.xm.entity.dtt;

public class MedicalrecordDtt implements java.io.Serializable {
    private Integer id;//自增列
    private String registercode;//挂号编号
    private String   medicalrecordcode;//病例编号
    private String  medicalrecordname;//病例名称
    private String  employeename;//医生名称
    private String  diseasename;//疾病类别
    private String  note;//备注
    private String  patientappeal;//病人主诉
    private String  medicalhistory;//病人病史
    private String physicalstatus;//体检情况
    private String primarydiagnosis;//初步诊断
    private String  opinion;//处理意见
    private String   recordtime;//记录时间
    private Integer isvalid;//是否有效

    public String getRegistercode() {
        return registercode;
    }

    public void setRegistercode(String registercode) {
        this.registercode = registercode;
    }

    public String getMedicalrecordcode() {
        return medicalrecordcode;
    }

    public void setMedicalrecordcode(String medicalrecordcode) {
        this.medicalrecordcode = medicalrecordcode;
    }

    public String getMedicalrecordname() {
        return medicalrecordname;
    }

    public void setMedicalrecordname(String medicalrecordname) {
        this.medicalrecordname = medicalrecordname;
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

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
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

    public String getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(String recordtime) {
        this.recordtime = recordtime;
    }

    public Integer getIsvalid() {
        return isvalid;
    }

    public void setIsvalid(Integer isvalid) {
        this.isvalid = isvalid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
