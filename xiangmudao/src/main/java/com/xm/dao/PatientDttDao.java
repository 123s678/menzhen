package com.xm.dao;

import com.xm.entity.dtt.PatientDtt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PatientDttDao {
    List<PatientDtt> getAll();
    PatientDtt inWith(@Param("id") int id);
}
