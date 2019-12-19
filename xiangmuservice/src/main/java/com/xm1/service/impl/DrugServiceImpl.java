package com.xm1.service.impl;

import com.xm1.dao.DrugDao1;
import com.xm1.entity.Drug1;
import com.xm1.service.DrugService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service(value = "prototype")
@Scope(value = "prototype")
@Transactional
public class DrugServiceImpl implements DrugService1 {
    @Autowired
    private DrugDao1 drugDao1;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Drug1> getServiceDru() {
        System.out.println("进入DrugService");
        return drugDao1.getDrugAll();
    }

//    @Override
//    public List<Drug> getServiceDrus() {
//        return drugDao1.getDrugAlls();
//    }

    @Override
    public int delDurg(long id) {
        System.out.println("进入删除");
        return drugDao1.getDrugDel(id);
    }

    @Override
    public int delDurgs(String id) {
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
        return drugDao1.getDelDrugs(ds);
    }

    @Override
    public void getDrugAdd(Drug1 drug) {
        System.out.println("进入添加sevice");
        drugDao1.getDrugadd(drug);
    }

    @Override
    public boolean getDrugUpdservice(Drug1 drug1) {
        System.out.println("进入修改sevice");
        System.out.println(drugDao1.getupds(drug1));
        return drugDao1.getupds(drug1)==1;
    }

    //过期查询
    @Override
    public List<Drug1> getServiceGuoQi() {
        System.out.println("进入service查询过期");
        return drugDao1.getDrugGuoQi();
    }

//    //过期药品删除
//
//    public int delDurg1(long id) {
//        return drugDao1.getDrugDel(id);
//    }
//    //过期药品批量删除
//    public int delDurgs1(String id) {
//        //拆分数组
//        String ids=id.substring(0,id.lastIndexOf("-"));
//        System.out.println("ids="+ids);
//        String[] sids=ids.split("-");
//        System.out.println("sids"+sids);
//        long[]ds=new long[sids.length];
//        for (int i = 0; i <sids.length ; i++) {
//            ds[i]=Long.parseLong(sids[i]);
//            System.out.println("ds="+ds[i]);
//        }
//        return drugDao1.getDelDrugs(ds);
//    }

    //模糊查询
    @Override
    public List<Drug1> getServiceMoHu(String name) {
        return drugDao1.getDrugMoHu(name);
    }


}
