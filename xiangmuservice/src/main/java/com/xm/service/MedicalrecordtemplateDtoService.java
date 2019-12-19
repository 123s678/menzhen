package com.xm.service;

import com.xm.entity.dto.MedicalrecordtemplateDto;


import java.util.List;
import java.util.Map;

public interface MedicalrecordtemplateDtoService {
    List<MedicalrecordtemplateDto> getMedicalDtoList(Map<String,Object> map);
    int getCount(Map<String,Object> map);
    List<MedicalrecordtemplateDto> getMecDtoOne(int id);
    boolean deleteMedical(int id);
}
