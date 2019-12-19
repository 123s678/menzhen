package com.xm.dao;

import com.xm.entity.Prescriptiondetail;
import org.apache.ibatis.annotations.Param;

public interface PrescriptiondetailDao {
    boolean addPreTail(Prescriptiondetail prescriptiondetail);
    boolean delPreTail(@Param("prescriptionid") Integer prescriptionid);
    Prescriptiondetail newPrescriptionDetail();
    int selectExt(@Param("prescriptionid") int prescriptionid,@Param("drugid") int drugid);
    Prescriptiondetail medicineamount(@Param("prescriptionid") int prescriptionid,@Param("drugid") int drugid);
    boolean updateExt(@Param("medicineamount") int medicineamount,@Param("id") int id);
    Prescriptiondetail getNewPrescriptiondetail();
    Prescriptiondetail getNew123(Prescriptiondetail prescriptiondetail);
}
