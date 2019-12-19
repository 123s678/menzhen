package com.xm2.service.impl;

import com.xm.dao.EmployeeDao;
import com.xm2.service.EmployeeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "employeeService2")
public class EmployeeServiceImpl2 implements EmployeeService2
{
    @Autowired
    private EmployeeDao employeeDao2;
    public boolean isEmployeeExist(String employeecode,String psw) {
        return employeeDao2.isEmployeeExist(employeecode,psw)==1;
    }
}
