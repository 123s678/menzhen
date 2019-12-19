package com.xm.service.impl;

import com.xm.dao.EmployeeDtoDao;
import com.xm.entity.dto.EmployeeDto;
import com.xm.service.EmployeeDtoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class EmployeeDtoServiceImpl implements EmployeeDtoService {
    @Autowired
    private EmployeeDtoDao employeeDtoDao;
    public EmployeeDto selectEmpDtoOne(String employeecode, String psw) {
        return employeeDtoDao.selectEmpDtoOne(employeecode,psw);
    }
}
