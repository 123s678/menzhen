package com.xm.dao;

import com.xm.entity.Registertype;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RegistertypeDao {
    List<Registertype> getTypeAll();
    Registertype getTypeSum(@Param("id") Integer id);//根据id查询挂号费
}
