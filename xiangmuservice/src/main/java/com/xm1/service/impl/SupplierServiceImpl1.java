package com.xm1.service.impl;

import com.xm1.dao.SupplierDao1;
import com.xm1.entity.Supplier1;
import com.xm1.service.SupplierService1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("supp")
@Transactional
public class SupplierServiceImpl1 implements SupplierService1{
    @Autowired
    private SupplierDao1 supplierDao1;
    @Transactional(propagation = Propagation.SUPPORTS)
    @Override
    public List<Supplier1> SupperServiceAll() {
        System.out.println("进入Sup查询全部");
        return supplierDao1.getSuppAll();
    }
}
