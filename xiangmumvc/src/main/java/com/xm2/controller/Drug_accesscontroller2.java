package com.xm2.controller;

import com.xm2.dao.Drug_accessDao2;
import com.xm2.dao.NumberDao2;
import com.xm2.pojo.Drug_access;
import com.xm2.pojo.Number;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/drug")
@Scope("prototype")
public class Drug_accesscontroller2 {

    @Autowired
    private Drug_accessDao2 drug_accessDao2;

    @Autowired
    private NumberDao2 numberDao2;

    @RequestMapping(value = "/quer")
    @ResponseBody
    public List<Drug_access>quer(){
        List<Drug_access>list=drug_accessDao2.que();
        return list;
    }

    @RequestMapping(value = "/nums")
    @ResponseBody
    public List<Number>nums(){
        List<Number>list=numberDao2.aa();
        return list;
    }
}
