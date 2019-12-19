package com.xm.dao;

import com.xm.entity.dto.MedicalrecordtemplateDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MedicalrecordtemplateDtoDao {
    List<MedicalrecordtemplateDto> getMedicalDtoList(Map<String,Object> map);
    int getCount(Map<String,Object> map);
    List<MedicalrecordtemplateDto> getMecDtoOne(@Param("id") int id);
    int deleteMedical(@Param("id") int id);
    List<MedicalrecordtemplateDto> queryByIdLis(List<Integer> list);
}
