package com.xm2.service.impl;

import com.xm2.dao.PatienttypeDao2;
import com.xm2.entity.Patienttype2;
import com.xm2.service.PatienttypeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.function.LongPredicate;

/**
 * 病人类别
 */
@Service
@Scope("prototype")
@Transactional
public class PatienttypeServiceImpl2  implements PatienttypeService2 {


    @Autowired
    private PatienttypeDao2 patienttypeDao2;


    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Patienttype2> query() {
        return patienttypeDao2.query();
    }

    @Override
    public int del(int id) {
        return patienttypeDao2.del(id);
    }

    @Override
    public int dels(String id) {
        String sids=id.substring(0,id.lastIndexOf("-"));
        String []sid=sids.split("-");
        long []ds=new long[sid.length];
        for (int i = 0; i < sid.length; i++) {
            ds[i]= Long.parseLong(sid[i]);
        }
        return patienttypeDao2.dels(ds);
    }

    @Override
    public int getadd(Patienttype2 patienttype2) {
        return patienttypeDao2.getadd(patienttype2);
    }

    @Override
    public int getupdate(Patienttype2 patienttype2) {
        return patienttypeDao2.getupdate(patienttype2);
    }

    @Override
    public List<Patienttype2> getmonu(String name) {
        return patienttypeDao2.getmonu(name);
    }
}
