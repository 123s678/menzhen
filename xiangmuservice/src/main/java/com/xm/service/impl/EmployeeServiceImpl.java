package com.xm.service.impl;

import com.xm.dao.EmployeeDao;
import com.xm.entity.Employee;
import com.xm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "employeeService")
public class EmployeeServiceImpl implements EmployeeService
{
    @Autowired
    private EmployeeDao employeeDao;
    public boolean isEmployeeExist(String employeecode,String psw) {
        return employeeDao.isEmployeeExist(employeecode,psw)==1;
    }

    public Employee isLoadEmp(String employeecode, String psw) {
        return employeeDao.isLoadEmp(employeecode,psw);
    }

    public boolean getEmpCount(String employeecode, String psw) {
        return employeeDao.getEmpCount(employeecode,psw)==1;
    }
}
