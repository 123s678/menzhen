package com.xm.dao;

import com.xm.entity.dtt.PrescriptiondetailDtt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PrescriptiondetailDttDao {
    List<PrescriptiondetailDtt> getTailAll(@Param("prescriptionid") Integer prescriptionid);
}
