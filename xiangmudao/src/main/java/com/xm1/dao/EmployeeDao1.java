package com.xm1.dao;

import com.xm.entity.Employee;
import org.apache.ibatis.annotations.Param;

public interface EmployeeDao1 {
   public int isEmployeeExist(@Param("employeecode") String employeecode, @Param("psw") String psw);
   public Employee quid(@Param("employeecode")String employeecode, @Param("psw")String psw);
}
