package com.xm1.service.impl;

import com.xm.dao.EmployeeDao;
import com.xm1.dao.EmployeeDao1;
import com.xm1.service.EmployeeService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "employeeService1")
public class EmployeeServiceImpl1 implements EmployeeService1
{
    @Autowired
    private EmployeeDao employeeDao1;
    @Autowired
    private EmployeeDao1 employeeDao;
    public boolean isEmployeeExist(String employeecode,String psw) {
        return employeeDao1.isEmployeeExist(employeecode,psw)==1;
    }

//    @Override
//    public List<Employee> getchaId(String employeecode, String psw) {
//        return employeeDao.getemId(employeecode,psw);
//    }
}
