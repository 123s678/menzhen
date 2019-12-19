package com.xm.dao;

import com.xm.entity.dtt.PrescriptionDtt;

import java.util.List;
import java.util.Map;

public interface PrescriptionDttDao {
    List<PrescriptionDtt> getAll(Map<String,Object> map);
    int getCount(Map<String,Object> map);
}
