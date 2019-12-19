package com.xm2.service;

import com.xm.entity.Charge;
import com.xm2.entity.Chargetype2;

import java.util.List;

public interface ChargetypeService2 {
    List<Chargetype2>query();
    int del (int id);
    int dels(String id);
    int getadd(Chargetype2 chargetype2);
    int getupdate(Chargetype2 chargetype2);
}
