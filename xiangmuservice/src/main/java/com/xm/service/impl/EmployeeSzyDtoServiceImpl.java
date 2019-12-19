package com.xm.service.impl;

import com.xm.dao.EmployeeDao;
import com.xm.dao.EmployeeSzyDtoDao;
import com.xm.entity.dto.EmployeeSzyDto;
import com.xm.service.EmployeeSzyDtoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service(value = "mployeeSzyDtoService")
public class EmployeeSzyDtoServiceImpl implements EmployeeSzyDtoService {
    @Autowired
    private EmployeeSzyDtoDao employeeSzyDtoDao;
    public List<EmployeeSzyDto> jurisdiction(String employeecode,String psw,Integer pid) {
        List<EmployeeSzyDto> list0=employeeSzyDtoDao.employee0(employeecode,psw);
        for (EmployeeSzyDto e:list0){
            e.setGetList(employeeSzyDtoDao.employeeP(employeecode,psw,e.getId()));
        }
        return list0;
    }
}
