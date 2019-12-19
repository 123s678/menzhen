package com.xm2.dao;
import com.xm2.entity.Registertype2;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface RegistertypeDao2 {
    public List<Registertype2> query();
    int del(int id);
    int dels(long[] a);

    void getadd(Registertype2 registertype2);

    int getdate(Registertype2 registertype2);

    Registertype2 getbyid(int id);


}

