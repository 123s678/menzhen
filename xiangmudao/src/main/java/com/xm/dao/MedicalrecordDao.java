package com.xm.dao;

import com.xm.entity.Medicalrecord;

public interface MedicalrecordDao {
    boolean addMedical(Medicalrecord medicalrecord);
    boolean updMedical(Medicalrecord medicalrecord);
}
