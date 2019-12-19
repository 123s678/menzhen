package com.xm1.dao;


import com.xm.entity.Drug;
import com.xm1.entity.Drug1;

import java.util.List;

public interface DrugDao1 {
    //查询全部
    public List<Drug1> getDrugAll();
    //删除及批量删除
    public int getDrugDel(long id);
    public int getDelDrugs(long[] id);
    //添加
    public void getDrugadd(Drug1 drug);
    //修改
    int getupds(Drug1 drug1);

    //过期药品
    public List<Drug1> getDrugGuoQi();

    //过期药品删除以及批量删除
    public int getDrugDel1(long id);
    public int getDelDrugs1(long[] id);

    //模糊查询
    public List<Drug1> getDrugMoHu(String name);

}
