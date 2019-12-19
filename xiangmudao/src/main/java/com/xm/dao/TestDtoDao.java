package com.xm.dao;

import com.xm.entity.Employee;

import java.util.List;

public interface TestDtoDao {
    List<Employee> query();
    List<Employee> queryByIds(List<Integer> list);
    void save(Employee employee);
}
