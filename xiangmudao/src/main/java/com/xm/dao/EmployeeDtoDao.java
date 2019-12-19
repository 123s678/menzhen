package com.xm.dao;

import com.xm.entity.dto.EmployeeDto;
import org.apache.ibatis.annotations.Param;

public interface EmployeeDtoDao {
    EmployeeDto selectEmpDtoOne(@Param("employeecode") String employeecode,@Param("psw") String psw);
}
