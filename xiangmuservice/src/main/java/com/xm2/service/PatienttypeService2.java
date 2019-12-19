package com.xm2.service;

import com.xm2.entity.Patienttype2;

import java.util.List;

public interface PatienttypeService2 {
    public List<Patienttype2>query();
    int del(int id);
    int dels(String id);
    int getadd(Patienttype2 patienttype2);

    int getupdate(Patienttype2 patienttype2);
    List<Patienttype2>getmonu(String name);
}
