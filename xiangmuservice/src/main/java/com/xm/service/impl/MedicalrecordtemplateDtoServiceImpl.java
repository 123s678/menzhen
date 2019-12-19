package com.xm.service.impl;

import com.xm.dao.MedicalrecordtemplateDtoDao;
import com.xm.entity.dto.MedicalrecordtemplateDto;
import com.xm.service.MedicalrecordtemplateDtoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service(value = "medicalrecordtemplateDtoService")
public class MedicalrecordtemplateDtoServiceImpl implements MedicalrecordtemplateDtoService {
    @Autowired
    private MedicalrecordtemplateDtoDao medicalrecordtemplateDtoDao;
    public List<MedicalrecordtemplateDto> getMedicalDtoList(Map<String,Object> map) {
        return medicalrecordtemplateDtoDao.getMedicalDtoList(map);
    }

    public int getCount(Map<String, Object> map) {
        return medicalrecordtemplateDtoDao.getCount(map);
    }

    public List<MedicalrecordtemplateDto> getMecDtoOne(int id) {
        return medicalrecordtemplateDtoDao.getMecDtoOne(id);
    }

    public boolean deleteMedical(int id) {
        return medicalrecordtemplateDtoDao.deleteMedical(id)==1;
    }
}
