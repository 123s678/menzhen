package com.xm2.service.impl;

import com.xm2.dao.ChargetypeDao2;
import com.xm2.entity.Chargetype2;
import com.xm2.service.ChargetypeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * 收费类别
 */
@Service
@Scope("prototype")
@Transactional
public class ChargetypeServiceImpl2 implements ChargetypeService2 {

    @Autowired
    private ChargetypeDao2 chargetype2Dao;


    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Chargetype2> query() {
        return chargetype2Dao.query();
    }

    @Override
    public int del(int id) {
        return chargetype2Dao.del(id);
    }

    @Override
    public int dels(String id) {
        //拆分数组
        String ids=id.substring(0,id.lastIndexOf("-"));
        System.out.println("ids="+ids);
        String[] sids=ids.split("-");
        System.out.println("sids"+sids);
        long[]ds=new long[sids.length];
        for (int i = 0; i <sids.length ; i++) {
            ds[i]=Long.parseLong(sids[i]);
            System.out.println("ds="+ds[i]);
        }
        return chargetype2Dao.dels(ds);
    }

    @Override
    public int getadd(Chargetype2 chargetype2) {
        System.out.println("进入Service");
        return chargetype2Dao.getadd(chargetype2);
    }

    @Override
    public int getupdate(Chargetype2 chargetype2) {
        return chargetype2Dao.getupdate(chargetype2);
    }
}
