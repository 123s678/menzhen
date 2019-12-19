package com.xm.service;

import com.xm.entity.dto.EmployeeDto;

public interface EmployeeDtoService {
    EmployeeDto selectEmpDtoOne(String employeecode,String psw);
}
