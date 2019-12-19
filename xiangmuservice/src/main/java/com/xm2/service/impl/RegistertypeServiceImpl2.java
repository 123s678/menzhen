package com.xm2.service.impl;


import com.xm2.dao.RegistertypeDao2;
import com.xm2.entity.Registertype2;
import com.xm2.service.RegistertypeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 挂号类别
 */
@Service
@Scope("prototype")
@Transactional
public class RegistertypeServiceImpl2 implements RegistertypeService2 {

    @Autowired
    private RegistertypeDao2 registertypeDao2;

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Registertype2> query() {
        return registertypeDao2.query();
    }



    @Override
    public int del(int id) {
        return registertypeDao2.del(id);
    }

    @Override
    public int dels(String id) {
        System.out.println("进入");
        String ids=id.substring(0,id.lastIndexOf("-"));
        System.out.println(ids);
        String[]sids=ids.split("-");
        long []ds=new long[sids.length];
        for (int i = 0; i <sids.length ; i++) {
            ds[i]=Long.parseLong(sids[i]);
            System.out.println(ds[i]);
        }
        return registertypeDao2.dels(ds);


    }

    @Override
    public void getadd(Registertype2 registertype2) {
        registertypeDao2.getadd(registertype2);

    }

    @Override
    public boolean getdate(Registertype2 registertype2) {
     return    registertypeDao2.getdate(registertype2)==1;
    }

    @Override
    public Registertype2 getbyid(int id) {
        return registertypeDao2.getbyid(id);
    }
}
