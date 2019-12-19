package com.xm.controller;

import com.xm.dao.*;
import com.xm.entity.Medicalrecord;
import com.xm.entity.Register;
import com.xm.entity.dto.RegisterDto;
import com.xm.entity.dtt.MedicalrecordDtt;
import com.xm.service.RegisterService;
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
@RequestMapping(value = "/bl")
public class bingLiController {
    @Autowired
    private MedicalrecordDttDao medicalrecordDttDao;
    @Autowired
    private RegisterService registerService;
    @Autowired
    private MedicalrecordDao medicalrecordDao;
    @Autowired
    private RegisterDao registerDao;
    @Autowired
    private PatientDao patientDao;
    @Autowired
    private RegisterDtoDao registerDtoDao;
    @RequestMapping(value = "/getAll",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Map<String,Object> getAll(@RequestParam("registercode") String registercode,
                                     @RequestParam("medicalrecordcode") String medicalrecordcode,
                                     @RequestParam("medicalrecordname") String medicalrecordname,
                                     @RequestParam("employeename") String employeename,
                                     @RequestParam("pageSize") int pageSize,
                               @RequestParam("pageNumber") int pageNumber){

        Map<String,Object> map=new HashMap<String,Object>();
        Map<String,Object> map1=new HashMap<String,Object>();
        map1.put("registercode",registercode);
        map1.put("medicalrecordcode",medicalrecordcode);
        map1.put("medicalrecordname",medicalrecordname);
        map1.put("employeename",employeename);
        map1.put("offset",(pageNumber-1)*pageSize);
        map1.put("limit",pageSize);
        List<MedicalrecordDtt> rows=medicalrecordDttDao.getMedicAll(map1);
        map.put("total",medicalrecordDttDao.getCount(map1));
        map.put("rows",rows);
        return  map;
    }
    @RequestMapping(value = "/getEx",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getEx(@RequestParam("registercode") String registercode){
        String ex="";
        if(registercode.equals("")){
            ex="0";
        }else if(!registerService.getExtRegister(registercode)){
            ex="1";
        }else{
            ex=registerService.getOneRegister(registercode).getId().toString();
        }
        return ex;
    }
    @RequestMapping(value = "/getNew",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getNew(HttpSession session){
        session.getAttribute("regInfoInfo");
        if(session.getAttribute("regInfoInfo")==null){
            return "1";
        }else{
        return registerService.NewRegister();
    }
    }
    @RequestMapping(value = "/addBing",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String addBing(Medicalrecord medicalrecord,HttpSession session){
        Register register=(Register)session.getAttribute("regInfoInfo");
        int id=register.getId();
        medicalrecord.setRegisterid(id);
        return  medicalrecordDao.addMedical(medicalrecord)+"";
    }
    @RequestMapping(value = "/updBing",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String updBing(Medicalrecord medicalrecord){
        return  medicalrecordDao.updMedical(medicalrecord)+"";
    }
    @RequestMapping(value = "/getRegisterDtoAll",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<RegisterDto> getRegisterDtoAll(){
        return  registerDtoDao.getAll();
    }





    @RequestMapping(value = "/queRen",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String queRen(@RequestParam("registercode") String registercode, HttpSession session){
        String str="";
        if(registerDao.getExt(registercode)==0){
            str="0";
        }else{
            session.setAttribute("regInfoInfo",registerDao.getOne(registercode));
            str=patientDao.getPatientNameByRegisterCode(registercode);
        }
        return  str;
    }


    @RequestMapping(value = "/infoSing",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String infoSing(HttpSession session){
        String str=null;
        if(session.getAttribute("regInfoInfo")!=null){
            Register register=(Register)session.getAttribute("regInfoInfo");
            str=register.getRegistercode();
        }
        return  str;
    }


}
