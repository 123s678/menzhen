package com.xm.controller;

import com.xm.dao.*;
import com.xm.entity.Charge;
import com.xm.entity.Drug;
import com.xm.entity.Employee;
import com.xm.entity.Patient;
import com.xm.entity.dtt.PatientDtt;
import com.xm.service.ChargeService;
import com.xm.service.SfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping(value = "/sfInfo")
public class sfdController {
    @Autowired
    private RegisterDao registerDao;
    @Autowired
    private PatientDao patientDao;
    @Autowired
    private DrugDao drugDao;
    @Autowired
    private SfService sfService;
    @Autowired
    private ChargeDao chargeDao;
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private ChargeService chargeService;
    @Autowired
    private PrescriptionDao prescriptionDao;


    /*
    * 查询所有非医保价格
    * */
    @RequestMapping(value = "/getNo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public double getNo(HttpSession session){
     int id=(int)session.getAttribute("prepreid");
        return sfService.getNo(id);
    }
    /*
    * 查询所有医保价格
    * */
    @RequestMapping(value = "/getYes",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public double getYes(HttpSession session){
        int id=(int)session.getAttribute("prepreid");
        return sfService.getYes(id);
    }
    /*
    * 分页
    * */
    @RequestMapping(value = "/getLoadSho",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Map<String,Object> getLoadSho(HttpSession session){
        Map<String,Object> map=new HashMap<String,Object>();
        String receiptcode= chargeDao.newReceiptcode().substring(0,3)+(Integer.parseInt(chargeDao.newReceiptcode().substring(3,chargeDao.newReceiptcode().length()))+1);
        String invoicecode=chargeDao.newInvoicecode().substring(0,2)+(Integer.parseInt(chargeDao.newInvoicecode().substring(2,chargeDao.newInvoicecode().length()))+1);
        map.put("receiptcode",receiptcode);
        map.put("invoicecode",invoicecode);
        Employee employee=(Employee)session.getAttribute("employeeinfo");
        Employee employee1=employeeDao.selectAllByPwd(employee);
        map.put("employeename",employee1.getEmployeename());
        return map;
    }
    /*
    * 添加费用信息
    * */
    @RequestMapping(value = "/addCharge",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public boolean addCharge(Charge charge,HttpSession session){
        int id=(int)session.getAttribute("prepreid");
        charge.setPrescriptionid(prescriptionDao.selectPrescription(id).getId());
        registerDao.update496(registerDao.selectGuaHaoNew().getId());
        return chargeService.addCharge(charge);
    }
    /*
    * 查询所有费用信息
    * */
    @RequestMapping(value = "/ChargeAll",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<Charge> ChargeAll(){
        return chargeDao.getChargeAll();
    }
    @RequestMapping(value = "/woYaoQin",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String woYaoQin(@RequestParam("receiptcode") String receiptcode,HttpSession session){
        String status="";
        int id=(int)session.getAttribute("prepreid");
        if(registerDao.select497(id)!=498){
            status="0";
        }else{
            registerDao.update499(id);
            chargeDao.updateCharge2(receiptcode);
            status="1";
        }
        return status;
    }
    /*
    * 收费传值
    * */
    @RequestMapping(value = "/loadChaFei",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String loadChaFei(@RequestParam("prescriptioncode") String prescriptioncode,HttpSession session){
        String str="";
        if(prescriptionDao.getPrescriptionWithCount(prescriptioncode)==0){
            str="0";
        }else{
            int id=prescriptionDao.getPrescriptionWith(prescriptioncode).getRegisterid();
            System.out.println(id);
            session.setAttribute("prepreid",id);
            str=id+"";
        }
        return str;
    }
    /*
     * 收费传值
     * */
    @RequestMapping(value = "/loadShouFei",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String loadShouFei(@RequestParam("prescriptioncode") String prescriptioncode,HttpSession session){
        String str="";
        if(prescriptionDao.getPrescriptionWithCount(prescriptioncode)==0){
            str="0";
        }else{
            int id=prescriptionDao.getPrescriptionWith(prescriptioncode).getRegisterid();
            session.setAttribute("prepreid",id);
            str="1";
        }
        return str;
    }

}
