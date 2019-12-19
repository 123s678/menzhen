package com.xm.dao;

import com.xm.entity.dtt.MedicalrecordDtt;

import java.util.List;
import java.util.Map;

public interface MedicalrecordDttDao {
    List<MedicalrecordDtt> getMedicAll(Map<String,Object> map);
    int getCount(Map<String,Object> map);
}
