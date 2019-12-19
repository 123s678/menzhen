package com.xm.dao;

import com.xm.entity.Prescriptiontemplatedetail;

import java.util.List;

public interface PrescriptiontemplatedetailDao {
    boolean addPrescriptiontemplatedetail(Prescriptiontemplatedetail p);
    boolean upPrescriptiontemplatedetail(Prescriptiontemplatedetail p);
    boolean delPrescriptiontemplatedetail(Integer id);
}
