package com.xm.dao;

import com.xm.entity.dtt.DrugTailDtt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DrugTailDttDao {
    List<DrugTailDtt> getDrugWith(@Param("prescriptioncode") String prescriptioncode);
}
