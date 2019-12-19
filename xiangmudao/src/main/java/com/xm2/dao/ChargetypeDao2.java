package com.xm2.dao;

import com.xm2.entity.Chargetype2;

import java.util.List;

public interface ChargetypeDao2 {
    public List<Chargetype2>query();

    int del(int id);

    int dels(long[] ids);

    int getadd(Chargetype2 chargetype2);

    int getupdate(Chargetype2 chargetype2);

}
