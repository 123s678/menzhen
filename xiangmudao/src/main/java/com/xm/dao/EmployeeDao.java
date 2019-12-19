package com.xm.dao;

import com.xm.entity.Employee;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmployeeDao {
   public int isEmployeeExist(@Param("employeecode") String employeecode,@Param("psw") String psw);
   public Employee isLoadEmp(@Param("employeecode") String employeecode,@Param("psw") String psw);
   public int getEmpCount(@Param("employeecode") String employeecode,@Param("psw") String psw);
   public List<Employee> doPartSelectEmp(Integer id);
   public List<Employee> getAllEmployee();
   public Employee selectAllByPwd(Employee employee);
   Employee getNewEmployee();//查询最新的Employee
     int addEmployee(Employee employee);
     int removeEmployee(@Param("id") int id);
     int updateEmployee(Employee employee);
}
