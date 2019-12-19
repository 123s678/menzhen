package com.xm.service.impl;

import com.xm.dao.ChargeDao;
import com.xm.entity.Charge;
import com.xm.service.ChargeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "chargeService")
public class ChargeServiceImpl implements ChargeService {
    @Autowired
    private ChargeDao chargeDao;
    public boolean addCharge(Charge charge) {
        return chargeDao.addCharge(charge)==1;
    }

    public String newReceiptcode() {
        String str=chargeDao.newReceiptcode();
        String str1=str.substring(0,3);
        Integer str2=Integer.parseInt(str.substring(3,str.length()))+1;
        return str1+str2;
    }

    public String newInvoicecode() {
        String str=chargeDao.newInvoicecode();
        String str1=str.substring(0,2);
        Integer str2=Integer.parseInt(str.substring(2,str.length()))+1;
        return str1+str2;
    }
}
