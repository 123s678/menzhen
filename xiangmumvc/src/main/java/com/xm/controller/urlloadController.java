package com.xm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/urlload")
public class urlloadController {
    @RequestMapping(value = "/fromGuaHao")
    public String fromGuaHao(){
        return "redirect:/songziyi/guahao.jsp";
    }
    @RequestMapping(value = "/fromHome")
    public String fromHome(){
        return "redirect:/home/home.jsp";
    }
    @RequestMapping(value = "/fromLogin")
    public String fromLogin(){
        return "redirect:/login.jsp";
    }
}
