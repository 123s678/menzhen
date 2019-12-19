package com.xm.service;

import com.xm.entity.Charge;

public interface ChargeService {
    boolean addCharge(Charge charge);
    String newReceiptcode();
    String newInvoicecode();
}
