package com.xm1.service;

import com.xm1.entity.Drug1;

import java.util.List;

public interface DrugService1 {
    //全部
    public List<Drug1> getServiceDru();

    //删除
    public int delDurg(long id);
    public int delDurgs(String id);
    //添加
    public void getDrugAdd(Drug1 drug);
    //修改
    boolean getDrugUpdservice(Drug1 drug1);
    //过期药品
    public List<Drug1> getServiceGuoQi();

//    //过期药品删除
//    public int delDurg1(long id);
//    public int delDurgs1(String id);


    //模糊查询
    public List<Drug1> getServiceMoHu(String name);
}
