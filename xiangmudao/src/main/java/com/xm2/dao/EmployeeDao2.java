package com.xm2.dao;


import com.xm2.entity.Employee2;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao2 {



    long count(@Param("employeename") String employeename);

    List<Employee2> query(@Param("employeename") String employeename, @Param("offset") int offset, @Param("limit") int limit);
}
