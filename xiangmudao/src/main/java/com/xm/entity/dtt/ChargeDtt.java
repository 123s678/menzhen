package com.xm.entity.dtt;

public class ChargeDtt implements java.io.Serializable {
    private Integer prescriptionid;//处方id
    private String prescriptioncode;//处方号
    private String receiptcode;//收据号
    private String invoicecode;//发票号
    private Integer employeeId;//操作员id
    private String employeename;//操作员姓名
    private double beforereceivable;//折前应收
    private double afterreceivable;//折后应收
    private double medicarecanpay;//医保可付

    public Integer getPrescriptionid() {
        return prescriptionid;
    }

    public void setPrescriptionid(Integer prescriptionid) {
        this.prescriptionid = prescriptionid;
    }

    public String getPrescriptioncode() {
        return prescriptioncode;
    }

    public void setPrescriptioncode(String prescriptioncode) {
        this.prescriptioncode = prescriptioncode;
    }

    public String getReceiptcode() {
        return receiptcode;
    }

    public void setReceiptcode(String receiptcode) {
        this.receiptcode = receiptcode;
    }

    public String getInvoicecode() {
        return invoicecode;
    }

    public void setInvoicecode(String invoicecode) {
        this.invoicecode = invoicecode;
    }

    public Integer getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Integer employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeename() {
        return employeename;
    }

    public void setEmployeename(String employeename) {
        this.employeename = employeename;
    }

    public double getBeforereceivable() {
        return beforereceivable;
    }

    public void setBeforereceivable(double beforereceivable) {
        this.beforereceivable = beforereceivable;
    }

    public double getAfterreceivable() {
        return afterreceivable;
    }

    public void setAfterreceivable(double afterreceivable) {
        this.afterreceivable = afterreceivable;
    }

    public double getMedicarecanpay() {
        return medicarecanpay;
    }

    public void setMedicarecanpay(double medicarecanpay) {
        this.medicarecanpay = medicarecanpay;
    }
}
