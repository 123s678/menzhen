package com.xm.dao;

import com.xm.entity.Charge;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChargeDao {
    int addCharge(Charge charge);
    String newReceiptcode();
    String newInvoicecode();
    List<Charge> getChargeAll();
    int updateCharge2(@Param("receiptcode") String receiptcode);
    int selectIf2(@Param("prescriptioncode") String prescriptioncode);
}
