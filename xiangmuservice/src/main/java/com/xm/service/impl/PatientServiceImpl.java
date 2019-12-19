package com.xm.service.impl;

import com.xm.dao.PatientDao;
import com.xm.entity.Patient;
import com.xm.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "patientService")
public class PatientServiceImpl implements PatientService {
    @Autowired
    PatientDao patientDao;
    public boolean isPat(String cardcode) {
        return patientDao.isPat(cardcode)==1;
    }

    public Patient ontPat(String cardcode) {
        return patientDao.ontPat(cardcode);
    }

    public String selectMaxPat_1() {
        Integer num=Integer.parseInt(patientDao.selectMaxPat())+1;
        return num.toString();
    }
}
