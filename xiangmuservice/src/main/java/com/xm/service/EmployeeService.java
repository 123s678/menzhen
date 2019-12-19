package com.xm.service;

import com.xm.entity.Employee;

public interface EmployeeService {
    public boolean isEmployeeExist(String employeecode,String psw);
    public Employee isLoadEmp(String employeecode,String psw);
    public boolean getEmpCount(String employeecode,String psw);
}
