package com.xm.dao;

import com.xm.entity.dto.EmployeeSzyDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeSzyDtoDao {
    List<EmployeeSzyDto> employee0(@Param("employeecode") String employeecode,@Param("psw") String psw);
    List<EmployeeSzyDto> employeeP(@Param("employeecode") String employeecode,@Param("psw") String psw,@Param("pid") Integer pid);
}
