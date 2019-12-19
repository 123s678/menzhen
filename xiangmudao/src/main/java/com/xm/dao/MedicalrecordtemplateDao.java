package com.xm.dao;

import com.xm.entity.Medicalrecordtemplate;

public interface MedicalrecordtemplateDao {
    boolean updateMedical(Medicalrecordtemplate medicalrecordtemplate);
    Medicalrecordtemplate selectByIdAllOne(int id);
    boolean addMedical(Medicalrecordtemplate medicalrecordtemplate);
    String maxMedical();
}
