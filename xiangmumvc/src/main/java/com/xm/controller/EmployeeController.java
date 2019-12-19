package com.xm.controller;

import com.xm.dao.*;
import com.xm.entity.Employee;
import com.xm.entity.Role;
import com.xm.entity.dto.AttrDto;
import com.xm.service.EmployeeDtoService;
import com.xm.service.EmployeeService;
import com.xm.service.EmployeeSzyDtoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    EmployeeDao employeeDao;
    @Autowired
    EmployeeService employeeService;
    @Autowired
    EmployeeDtoService employeeDtoService;
    @Autowired
    EmployeeSzyDtoService employeeSzyDtoService;
    @Autowired
    ViptypeDao viptypeDao;
    @Autowired
    AttrDtoDao attrDtoDao;
    @Autowired
    PatienttypeDao patienttypeDao;
    @Autowired
    DepartmentDao departmentDao;
    @Autowired
    RegistertypeDao registertypeDao;
    @Autowired
    DiseaseDao diseaseDao;
    @Autowired
    DrugDao drugDao;
    @Autowired
    RoleDao roleDao;
    @RequestMapping("/login")
    @ResponseBody
    public boolean login(@RequestParam("employeecode") String employeecode, @RequestParam("psw") String psw, HttpSession session){
        /*
         * 判断是否可以登录
         * */
        boolean bl=employeeService.isEmployeeExist(employeecode,psw);
        String isLoad="";
      if(employeeService.getEmpCount(employeecode,psw)){
          if(employeeService.isLoadEmp(employeecode,psw).getIsoperator()!=1){
              isLoad="你不是管理员";
          }
      }
        if(bl==true){
            Employee employee=new Employee();
            employee.setEmployeecode(employeecode);
            employee.setPsw(psw);
            session.setAttribute("employeeinfo",employee);
            session.setAttribute("employeeimg",employeeService.isLoadEmp(employeecode,psw));
            session.setAttribute("rolename",employeeDtoService.selectEmpDtoOne(employeecode,psw).getRolename());
            session.setAttribute("jurisdiction",  employeeSzyDtoService.jurisdiction(employeecode,psw,employee.getId()));
        }else if(bl==false){
            isLoad="账号有误";

        }
        session.setAttribute("isLoad",isLoad);
        return bl;
    }
    @ModelAttribute(value = "infoSessionVip")
    public String infoSession(HttpSession session){
        infoVipList(session);//查询所有vip
        getAttr3(session);//查询所有婚姻状况
        getAttr8(session);//查询所有医保类型
        getAttr20(session);//查询所有参保类别
        getPatientType(session);//查询所有病人类别
        getDepartAll(session);//查询所有科室
        getTypeAll(session);//查询挂号类型
        getDiseaseAll(session);//查询所有疾病类型
        getAllEmployee(session);//查询所有医生
        getAttr15(session);//查询所有处方类型
        getAttr16(session);//查询所有处方分类
        getDrugAll(session);//查询所有药品
        getAttr24(session);//查询所有用药方式
        getAttr25(session);//查询所有用药频率
        getAttr4(session);//查询所有职务
        getAttr5(session);//查询所有职称
        getAttr1(session);//查询所有学历
        getAttr2(session);//查询所有学历
        getAttr10(session);//查询所有学历
        getAllRole(session);//查询所有角色
        return "index";
    };
    /*
    * 查询所有vip
    * */
    public void infoVipList(HttpSession session){
        session.setAttribute("vipList",viptypeDao.getVipList());
    }
    /*
    * 查询所有婚姻状况
    * */
    public void getAttr3(HttpSession session){
        session.setAttribute("hyzk",attrDtoDao.getAttr3());
    }

    /*
     * 查询所有医保类型
     * */
    public void getAttr8(HttpSession session){
        session.setAttribute("yblx",attrDtoDao.getAttr8());
    }
    /*
     * 查询所有参保类别
     * */
    public void getAttr20(HttpSession session){
        session.setAttribute("cblb",attrDtoDao.getAttr20());
    }
    /*
    * 查询所有病人类别
    * */
    public void getPatientType(HttpSession session){
        session.setAttribute("brlb",patienttypeDao.getPatientType());
    }
    /*
    * 查询所有科室
    * */
    public void getDepartAll(HttpSession session){
        session.setAttribute("ksks",departmentDao.getDepartAll());
    }
    /*
    * 查询所有挂号类型
    * */
    public void getTypeAll(HttpSession session){
        session.setAttribute("ghlxs",registertypeDao.getTypeAll());
    }
    /*
    * 查询所有疾病类型
    * */
    public void getDiseaseAll(HttpSession session){
        session.setAttribute("jjbbllxx",diseaseDao.getDiseaseAll());
    }
    /*
    * 查询所有医生
    * */
    public void getAllEmployee(HttpSession session){
        session.setAttribute("yisho",employeeDao.getAllEmployee());
    }
    /*
     * 查询所有处方类型
     * */
    public void getAttr15(HttpSession session){
        session.setAttribute("cflxif",attrDtoDao.getAttr15());
    }
    /*
     * 查询所有处方分类
     * */
    public void getAttr16(HttpSession session){
        session.setAttribute("cfflif",attrDtoDao.getAttr16());
    }
    /*
    * 查询所有药品
    * */
    public void getDrugAll(HttpSession session){
        session.setAttribute("drugAll",drugDao.getAll());
    };
    /*
     * 查询所有用药方式
     * */
    public void getAttr24(HttpSession session){
        session.setAttribute("drugyyfs",attrDtoDao.getAttr24());
    };
    /*
     * 查询所有用药频率
     * */
    public void getAttr25(HttpSession session){
        session.setAttribute("drugyypl",attrDtoDao.getAttr25());
    };
    /*
    * 查询所有职务
    * */
    public void getAttr4(HttpSession session){
        session.setAttribute("syzw",attrDtoDao.getAttr4());
    }
    /*
     * 查询所有职称
     * */
    public void getAttr5(HttpSession session){
        session.setAttribute("syzc",attrDtoDao.getAttr5());
    }
    /*
    * 查询所有学历
    * */
    public void getAttr1(HttpSession session){
        session.setAttribute("zgxl",attrDtoDao.getAttr1());
    }
    /*
     * 查询所有政治面貌
     * */
    public void getAttr2(HttpSession session){
        session.setAttribute("zzmm",attrDtoDao.getAttr2());
    }
    /*
     * 查询所有专业
     * */
    public void getAttr10(HttpSession session){
        session.setAttribute("xxzy",attrDtoDao.getAttr10());
    }
    /*
    * 查询所有角色
    * */
    public void getAllRole(HttpSession session){
        session.setAttribute("roleAllInfo",roleDao.getAll());
    }
}
