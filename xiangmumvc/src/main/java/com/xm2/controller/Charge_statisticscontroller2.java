package com.xm2.controller;

import com.xm2.dao.Charge_statisticsDao2;
import com.xm2.pojo.Charge_statistics;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.*;

@Controller
@RequestMapping("/statistics")
@Scope("prototype")
public class Charge_statisticscontroller2 {


    @Autowired
    private Charge_statisticsDao2 charge_statisticsDao2;

    @RequestMapping(value = "/queryGroup")
    @ResponseBody
    public Map<String, List<Object>> queryGroup(){
        try {
            Thread.sleep(500);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        Map<String,List<Object>>map=new HashMap<>();
        List<Charge_statistics>list=charge_statisticsDao2.queryGroup();
        List<Object>list1=new ArrayList<>();
        List<Object>list2=new ArrayList<>();
        for (Charge_statistics c:list) {
            list1.add(c.getMont());
            list2.add(c.getMoney());
        }
        map.put("yf",list1);
        map.put("je",list2);
        return map;

    }
}
