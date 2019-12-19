package com.xm2.controller;

import com.xm.entity.Chargetype;
import com.xm2.entity.Chargetype2;
import com.xm2.service.ChargetypeService2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 收费类别
 */

@Controller
@RequestMapping("/charge")
public class ChargetypeController2 {

    @Resource
    private ChargetypeService2 chargetypeService2;

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<Chargetype2>query(){
        return chargetypeService2.query();
    }

    @RequestMapping(value = "/del")
    @ResponseBody
    public List<Chargetype2> del(int id){
        chargetypeService2.del(id);
        return chargetypeService2.query();
    }

    @RequestMapping(value = "/dels")
    @ResponseBody
    public List<Chargetype2> dels(String id){
        chargetypeService2.dels(id);
        return chargetypeService2.query();
    }

    @RequestMapping(value = "/getadd")
    @ResponseBody
    public List<Chargetype2> getadd (Chargetype2 chargetype2){
        chargetypeService2.getadd(chargetype2);
        return chargetypeService2.query();
    }

    @RequestMapping(value = "/getup")
    @ResponseBody
    public List<Chargetype2>getup(Chargetype2 chargetype2){
        chargetypeService2.getupdate(chargetype2);
        return chargetypeService2.query();
    }
}
