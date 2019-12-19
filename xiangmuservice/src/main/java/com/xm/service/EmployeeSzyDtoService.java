package com.xm.service;

import com.xm.entity.dto.EmployeeSzyDto;

import java.util.List;

public interface EmployeeSzyDtoService {
    List<EmployeeSzyDto> jurisdiction(String employeecode,String psw,Integer pid);
}
