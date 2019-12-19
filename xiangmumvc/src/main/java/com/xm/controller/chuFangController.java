package com.xm.controller;

import com.xm.dao.*;
import com.xm.entity.Prescription;
import com.xm.entity.Prescriptiondetail;
import com.xm.entity.Register;
import com.xm.entity.dtt.PrescriptionDtt;
import com.xm.entity.dtt.PrescriptiondetailDtt;
import com.xm.util.comm;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value = "/cf")
public class chuFangController {
    @Autowired
    private PrescriptionDttDao prescriptionDttDao;
    @Autowired
    private PrescriptiondetailDttDao prescriptiondetailDttDao;
    @Autowired
    private PrescriptionDao prescriptionDao;
    @Autowired
    private DrugDao drugDao;
    @Autowired
    private PrescriptiondetailDao  prescriptiondetailDao;
    @Autowired
    private RegisterDao registerDao;
    @RequestMapping(value = "/getAll",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Map<String,Object> getAll(@RequestParam("registercode") String registercode,
                                     @RequestParam("prescriptioncode") String prescriptioncode,
                                     @RequestParam("prescriptionname") String prescriptionname,
                                     @RequestParam("employeename") String employeename,
                                     @RequestParam("pageNumber") int pageNumber,
                                     @RequestParam("pageSize") int pageSize
                                     ){
        Map<String,Object> map=new HashMap<String,Object>();
        Map<String,Object> map1=new HashMap<String,Object>();
        map1.put("registercode",registercode);
        map1.put("prescriptioncode",prescriptioncode);
        map1.put("prescriptionname",prescriptionname);
        map1.put("employeename",employeename);
        map1.put("offset",(pageNumber-1)*pageSize);
        map1.put("limit",pageSize);
        List<PrescriptionDtt> rows=prescriptionDttDao.getAll(map1);
        map.put("total",prescriptionDttDao.getCount(map1));
        map.put("rows",rows);
        return  map;
    }
    @RequestMapping(value = "/getTailAll",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<PrescriptiondetailDtt> getTailAll(@RequestParam("prescriptionid") Integer prescriptionid){
        return prescriptiondetailDttDao.getTailAll(prescriptionid);
    }
    /*
    * 添加处方
    * */
    @RequestMapping(value = "/add1",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String add1(Prescription prescription,HttpSession session){
        String str="";
        Register register=(Register)session.getAttribute("regInfoInfo");
        int id=register.getId();
        prescription.setRegisterid(id);
        str=prescriptionDao.addPre(prescription)+"";

        return str;
    }
    @RequestMapping(value = "/selectOne1",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String selectOne1(@RequestParam("id") Integer id){
        int num=drugDao.getOne(id).getCunrushu();
        return num+"";
    }
    @RequestMapping(value = "/selectT2",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String selectT2(@RequestParam("num1") Integer num1,@RequestParam("num2") Integer num2){
        return comm.Msz(num1,num2)+"";
    }
    /*
    * 添加处方药品
    * */
    @RequestMapping(value = "/add2",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String add2(Prescriptiondetail prescriptiondetail){

            String str="";
            int prescriptionid=prescriptiondetailDao.getNewPrescriptiondetail().getPrescriptionid();
            int drugid=prescriptiondetailDao.getNewPrescriptiondetail().getDrugid();
            if(prescriptiondetail.getDrugid()==drugid&&prescriptionid==prescriptiondetail.getPrescriptionid()){
                int mount=prescriptiondetail.getMedicineamount();
                Prescriptiondetail prescriptiondetail1=new Prescriptiondetail();
                prescriptiondetail1.setDrugid(drugid);
                prescriptiondetail1.setPrescriptionid(prescriptionid);
                int id=prescriptiondetailDao.getNew123(prescriptiondetail1).getId();
                str=prescriptiondetailDao.updateExt(mount,id)+"";
            }else{
                str=prescriptiondetailDao.addPreTail(prescriptiondetail)+"";
            }
        return str;
    }
    /*
    * 删除pre
    * */
    @RequestMapping(value = "/delChu",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String delChu(@RequestParam("id") int id){
        boolean bl1=prescriptionDao.delPre(id);
        boolean bl2=prescriptiondetailDao.delPreTail(id);
        return bl1+"";
    }
    /*
    * 确诊
    * */
    @RequestMapping(value = "/jz",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String jz(HttpSession session){
     String str="";
        Register register=(Register)session.getAttribute("regInfoInfo");
        String registercode=register.getRegistercode();
        if(registerDao.getExt(registercode)!=1){
            str="0";
        }else{
            boolean bl=  registerDao.jiuZhen(registercode);
            if(bl){
                str="1";
            }
        }

        return str;
    }
    /*
    * 退号
    * */
    @RequestMapping(value = "/tuihao",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String tuihao(HttpSession session){
        String str="";
        Register register=(Register)session.getAttribute("regInfoInfo");
        String registercode=register.getRegistercode();
        if(registerDao.getExt(registercode)!=1){
            str="0";
        }else{
            boolean bl= registerDao.tuiHao(registercode);
            if(bl){
                str="1";
            }
        }

        return str;
    }

    /*
    * 给name赋值
    * */
    @RequestMapping(value = "/cardcodeinfo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String cardcodeinfo(HttpSession session){
        Register register=(Register)session.getAttribute("regInfoInfo");
        return register.getRegistercode();
    }
}
