package com.xm2.controller;

import com.xm.entity.Registertype;
import com.xm2.entity.Registertype2;
import com.xm2.service.RegistertypeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

/**
 * 挂号类别
 */
@Controller
@RequestMapping("/register")
public class RegistertypeController2 {

    @Resource
    private RegistertypeService2 registerableService;

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<Registertype2>query(){
        return registerableService.query();
    }




    @RequestMapping(value = "/del")
    @ResponseBody
    public List<Registertype2> del(int id){
        registerableService.del(id);
        return registerableService.query();
    }


    @RequestMapping(value = "/dels")
    @ResponseBody
    public List<Registertype2>dels(String id){
        registerableService.dels(id);
        System.out.println(id);
        return registerableService.query();
    }

    @RequestMapping(value = "/getadd")
    @ResponseBody
    public List<Registertype2> getadd(Registertype2 registertype2){
        registerableService.getadd(registertype2);
        return registerableService.query();
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public List<Registertype2> update(Registertype2 registertype2){
      registerableService.getdate(registertype2);
    return registerableService.query();
    }




}
