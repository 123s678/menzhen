package com.xm.controller;

import com.xm.dao.EmployeeDao;
import com.xm.dao.PatientDao;
import com.xm.dao.RegisterDao;
import com.xm.dao.RegistertypeDao;
import com.xm.entity.Employee;
import com.xm.entity.Register;
import com.xm.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value = "/guahao")
public class guahaoController {
    @Autowired
    EmployeeDao employeeDao;
    @Autowired
    RegisterService registerService;
    @Autowired
    RegistertypeDao registertypeDao;
    @Autowired
    PatientDao patientDao;
    @Autowired
    RegisterDao registerDao;
    @RequestMapping(value = "/chs0",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<Employee> chs0(@RequestParam("id") int id){
        return employeeDao.doPartSelectEmp(id);
    }
    @RequestMapping(value = "/smInfo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String smInfo(){
        return registerService.NewRegister();
    }
    @RequestMapping(value = "/getTypeSum",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getTypeSum(@RequestParam("id") Integer id){
        return registertypeDao.getTypeSum(id).getTypesum().toString();
    }
    @RequestMapping(value = "/guaGuaHao",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String guaGuaHao(@RequestParam("patientname") String patientname,
                            @RequestParam("registertypeid") int registertypeid,
                            @RequestParam("registercode") String registercode,
                            @RequestParam("departmentid") int departmentid,
                            @RequestParam("doctorid") int doctorid,
                            @RequestParam("registersum") double registersum,
                            @RequestParam("registerpersonid") int registerpersonid,
                            @RequestParam("note") String note,
                            @RequestParam("registerstatus") int registerstatus,
                            @RequestParam("isvalid") int isvalid) {
        Register register=new Register();
        register.setPatientid(patientDao.patientId(patientname));
        register.setRegistertypeid(registertypeid);
        register.setRegistercode(registercode);
        register.setDepartmentid(departmentid);
        register.setDoctorid(doctorid);
        register.setRegistersum(registersum);
        register.setRegisterpersonid(registerpersonid);
        register.setNote(note);
        register.setRegisterstatus(registerstatus+"");
        register.setIsvalid(isvalid);
        return registerDao.addRegister(register)+"";
    }



}
