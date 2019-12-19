package com.xm.dao;

import com.xm.entity.Drug;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DrugDao {
    List<Drug> getAll();
    Drug getOne(@Param("id") Integer id);
    List<Drug> getWithDrug(@Param("id") int id);
    List<Drug> getDrugShu(List<Integer> list);
}
