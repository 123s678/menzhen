package com.xm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/*
* 跳转页面功能Controller
* */
@Controller
@RequestMapping("/load")
public class LoadController {
    /*
    * 医生挂号
    * */
    @RequestMapping(value = "/load1")
    public String load1(){
        return "redirect:/songziyi/guahao.jsp";
    }
    /*
    * 病例模板
    * */
    @RequestMapping(value = "/load2")
    public String load2(){
        return "redirect:/songziyi/binglimoban.jsp";
    }
    /*
    * 处方模板
    * */
    @RequestMapping(value = "/load3")
    public String load3(){
        return "redirect:/songziyi/chufangmoban.jsp";
    }
    /*
    * 病例
    * */
    @RequestMapping(value = "load4")
    public String load4(){
        return "redirect:/songziyi/bingli.jsp";
    }
    /*
    * 处方
    * */
    @RequestMapping(value = "/load5")
    public String load5(){
        return "redirect:/songziyi/chufang.jsp";
    }
    /*
    * 收费标准
    * */
    @RequestMapping(value = "load6")
    public String load6(){
        return "redirect:/songziyi/sfd.jsp";
    }
    /*
    * 药房档案
    * */
    @RequestMapping(value = "/load7")
    public String load7(){
        return "redirect:/ssssupp/tianshen";
    }
    /*
    * 发药管理
    * */
    @RequestMapping(value = "load8")
    public String load8(){
        return "redirect:/songziyi/fayao.jsp";
    }
    /*
    * 挂号类别
    * */
    @RequestMapping(value = "/load9")
    public String load9(){
        return "redirect:/jiangjintao/Basic_information/RegisterType.jsp";
    }
    /*
    * 收费类别
    * */
    @RequestMapping(value = "load10")
    public String load10(){
        return "redirect:/jiangjintao/Basic_information/Chargetype.jsp";
    }
    /*
    * 病人类别
    * */
    @RequestMapping(value = "/load11")
    public String load11(){
        return "redirect:/jiangjintao/Basic_information/Patienttype.jsp";
    }
    /*
    * 人事管理
    * */
    @RequestMapping(value = "/load12")
    public String load12(){
        return "redirect:/songziyi/renshi.jsp";
    }
    /*
    * 使用单位
    * */
    @RequestMapping(value = "load13")
    public String load13(){
        return "";
    }
    /*
    * 资源管理
    * */
    @RequestMapping(value = "/load14")
    public String load14(){
        return "";
    }
    /*
    * 角色管理
    * */
    @RequestMapping(value = "load15")
    public String load15(){
        return "";
    }
    /*
    * 数据统计
    * */
    @RequestMapping(value = "/load16")
    public String load16(){
        return "redirect:/jiangjintao/Statistic/Statistical_set.jsp";
    }
    /*
    * 权限管理
    * */
    @RequestMapping(value = "/load17")
    public String load17(){
        return "redirect:/songziyi/quanxian.jsp";
    }
}
