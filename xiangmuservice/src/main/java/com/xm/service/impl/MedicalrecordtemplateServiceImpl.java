package com.xm.service.impl;

import com.xm.dao.MedicalrecordtemplateDao;
import com.xm.service.MedicalrecordtemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "medicalrecordtemplateService")
public class MedicalrecordtemplateServiceImpl implements MedicalrecordtemplateService {
    @Autowired
    MedicalrecordtemplateDao medicalrecordtemplateDao;
    public String maxMedical() {
        return medicalrecordtemplateDao.maxMedical().substring(0,4)+(Integer.parseInt(medicalrecordtemplateDao.maxMedical().substring(4,medicalrecordtemplateDao.maxMedical().length()))+1);
    }
}
