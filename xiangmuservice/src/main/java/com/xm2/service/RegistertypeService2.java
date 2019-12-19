package com.xm2.service;


import com.xm2.entity.Chargetype2;
import com.xm2.entity.Registertype2;


import java.util.List;

public interface RegistertypeService2 {
    public List<Registertype2>query();


    int del(int id);
    int dels(String id);

    void getadd(Registertype2 registertype2);

    boolean getdate(Registertype2 registertype2);

    Registertype2 getbyid(int id);


}
