package com.xm.controller;

import com.xm.dao.PatientDao;
import com.xm.entity.Patient;
import com.xm.service.PatientService;
import com.xm.util.comm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/patient")
public class PatientController {
    @Autowired
    private PatientService patientService;
    @Autowired
    private PatientDao patientDao;
    @RequestMapping(value = "/selectPatient",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String selectPatient(@RequestParam("cardcode") String cardcode){
        String isStr="";
       if(!cardcode.equals("false")){
           if(isExt(cardcode)){
               Patient patient=patientService.ontPat(cardcode);
               isStr=patient.toString();
           }else{
               isStr="01";
           }
       }else{
           isStr="0";
       }
        return isStr;
    }

    public boolean isExt(String cardcode){
        boolean info=false;
        if(patientService.isPat(cardcode)){
            info=true;
        }
        return info;
    }
    @RequestMapping(value = "/loadPat",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String loadPat(){
        return patientService.selectMaxPat_1();
    }

    @RequestMapping(value = "/addPat",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String addPat(Patient patient){
        String strIs="";
        if(patient.getTel().length()!=11||!patient.getTel().substring(0,1).equals("1")||!comm.isNumber(patient.getTel())){
            strIs="11";
        }else if(!isNsN(patient.getIdentity())){
            strIs="18";
        }else{
        boolean bl=patientDao.insertPat(patient);
        if(bl==false){
            strIs=false+"";
        }else{
            Patient patientNew=patientDao.selectNewPat();
            strIs=patientNew.toString();
        }
        }
        return strIs;
    }

    public boolean isNsN(String identity){
        boolean bl=false;
        if(identity.length()==15){
            bl=true;
        } else if(identity.length()==18){
            bl=true;
        }
        return bl;
    }

}
