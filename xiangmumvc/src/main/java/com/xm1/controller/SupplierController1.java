package com.xm1.controller;

import com.xm.entity.Employee;
import com.xm1.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/ssssupp")
public class SupplierController1 {
    @Autowired
    CharetypeDao1 charetypeDao1;
    @Autowired
    DrugDao1 drugDao1;
    @Autowired
    SupplierDao1 supplierDao1;
    @Autowired
    AttributedetailDao1 attributedetailDao1;
    @Autowired
    EmployeeDao1 employeeDao1;
    @Autowired
    MedicalrecordtemplateDao1 medicalrecordtemplateDao1;


    @RequestMapping(value = "/tianshen")
    public String getsuppcha1(){
       return "/songshuaike/ssk/YaoFangDangAn.jsp";
    }


    @ModelAttribute(value = "/infoShow")
    public String infoShow(HttpSession session){
        System.out.println("运行");
        sh1(session);//取出supplier的name
        sh2(session);//取出chargetype的name
        sh3(session);//取出drug的状态
        sh4(session);
        selectId(session);
        sh5(session);
        sh6(session);
        sh7(session);
        sh8(session);
       //取出添加人的id
        return "index";
    }


    public void sh1(HttpSession session){
        session.setAttribute("supp",supplierDao1.getSuppAll());
    }
    public void sh2(HttpSession session){
        session.setAttribute("chargetype",charetypeDao1.getcharAll());
    }
    public void sh3(HttpSession session){
        session.setAttribute("drug", drugDao1.getDrugAll());
    }
    public void sh4(HttpSession session){
        session.setAttribute("attdate",attributedetailDao1.getAtttrAll());
    }
    public void sh6(HttpSession session) {
        session.setAttribute("attdate2",attributedetailDao1.getAtttrAll2());
    }
    public void sh7(HttpSession session) {
        session.setAttribute("attdate3",attributedetailDao1.getAtttrAll3());
    }
    public void sh8(HttpSession session){
        session.setAttribute("attdate4",attributedetailDao1.getAtttrAll4());
    }
    public void sh5(HttpSession session){
        session.setAttribute("medtm",medicalrecordtemplateDao1.getMedAlltm());
    }

    @RequestMapping(value = "/selectId")
    @ResponseBody
    public String selectId(HttpSession session){
        Employee employee=(Employee)session.getAttribute("employeeinfo");
        String e=employee.getEmployeecode();
        String p=employee.getPsw();
        Employee employee1=(Employee)employeeDao1.quid(e,p);
        int id=employee1.getId();
        System.out.println(employee1.getId());
        System.out.println("我没报错");
        return id+"";
    }
}
