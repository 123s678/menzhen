package com.xm2.controller;

import com.xm2.entity.Patienttype2;
import com.xm2.service.PatienttypeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 病人类别
 */
@Controller
@RequestMapping("/patient2")
public class PatienttypeController2 {

    @Resource
    private PatienttypeService2 patienttypeService2;

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<Patienttype2>query(){
        return patienttypeService2.query();
    }

    @RequestMapping(value = "/del")
    @ResponseBody
    public List<Patienttype2> del(int id){
        patienttypeService2.del(id);
        return patienttypeService2.query();
    }

    @RequestMapping(value = "/dels")
    @ResponseBody
    public List<Patienttype2> dels(String id){
        patienttypeService2.dels(id);
        return patienttypeService2.query();
    }

    @RequestMapping(value = "/getadd")
    @ResponseBody
    public List<Patienttype2>getadd(Patienttype2 patienttype2){
        System.out.println("nin");
        patienttypeService2.getadd(patienttype2);

        return patienttypeService2.query();
    }
    @RequestMapping(value = "/getup")
    @ResponseBody
    public List<Patienttype2>getup(Patienttype2 patienttype2){
        System.out.println(patienttype2.toString());
        patienttypeService2.getupdate(patienttype2);
        return patienttypeService2.query();
    }

    @RequestMapping(value = "/mohu")
    @ResponseBody
    public List<Patienttype2>mohu(String name){
        Patienttype2 patienttype2=new Patienttype2();
        System.out.println(patienttype2.toString());
        return patienttypeService2.getmonu(name);
    }

}
