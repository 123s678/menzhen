package com.xm.controller;

import com.xm.dao.*;
import com.xm.entity.Charge;
import com.xm.entity.Drug;
import com.xm.entity.Prescription;
import com.xm.entity.dtt.FaYaoDtt;
import com.xm.util.comm;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/fy")
public class faYaoController {
    @Autowired
    private PrescriptionDao prescriptionDao;
    @Autowired
    private RegisterDao registerDao;
    @Autowired
    private ChargeDao chargeDao;
    @Autowired
    private FaYaoDttDao faYaoDttDao;
    @Autowired
    private DrugDao drugDao;
    @RequestMapping(value = "/selectAllPrescription",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<Prescription> selectAllPrescription(){
        return  prescriptionDao.selectAllPrescription();
    }
    @RequestMapping(value = "/woYaoFaYao",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String woYaoFaYao(@RequestParam("prescriptioncode") String prescriptioncode){
        String str="";
        int rid=prescriptionDao.getPrescriptionWith(prescriptioncode).getRegisterid();
        int id=registerDao.select496(rid);
        if(id!=496){
            str="0";
        }else{
            int chargestatus=chargeDao.selectIf2(prescriptioncode);
            if(chargestatus==2){
                str="1";
            }else {
                /*
                 * 查询所有发药信息
                 * */
                System.out.println("开始");
                List<FaYaoDtt> faYaoDttList = faYaoDttDao.getFaYao(prescriptionDao.selectIdByPrescriptionCode(prescriptioncode));
                for (FaYaoDtt i:faYaoDttList){
                    System.out.println(i.toString());
                }


                List<Integer> listNum = new ArrayList<Integer>();
                for (FaYaoDtt i : faYaoDttList) {
                    listNum.add(i.getId());
                }

                List<Drug> drugList = drugDao.getDrugShu(listNum);
                List<Integer> list1 = new ArrayList<Integer>();
                for (FaYaoDtt i : faYaoDttList) {
                    list1.add(i.getMedicineamount());
                }
                List<Integer> list2 = new ArrayList<Integer>();
                for (Drug i : drugList) {
                    list2.add(i.getCunrushu());
                }


                if (comm.PK(list1, list2) == false) {
                    str = "2";
                } else {
                    /*
                     * 修改库存
                     * */
                    System.out.println("开始修改");
                    for (FaYaoDtt i : faYaoDttList) {
                        int count = faYaoDttDao.updateJn(i.getMedicineamount(), i.getId());
                    }
                    System.out.println("结束修改");
                    int registerid=prescriptionDao.selectRegisterId(prescriptioncode);
                    /*
                     * 修改发药状态
                     * */
                    registerDao.update497(registerDao.selectGuaHaoNew().getId());
                    str="3";
                }

            }
        }
        return  str;
    }

    @RequestMapping(value = "/woYaoTuiYao",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String woYaoTuiYao(@RequestParam("prescriptioncode") String prescriptioncode){
        int rid=prescriptionDao.getPrescriptionWith(prescriptioncode).getRegisterid();
      registerDao.update498(rid);
        List<FaYaoDtt> faYaoDttList = faYaoDttDao.getFaYao(prescriptionDao.selectIdByPrescriptionCode(prescriptioncode));
        for (FaYaoDtt i : faYaoDttList) {
            int count = faYaoDttDao.updateJi(i.getMedicineamount(), i.getId());
        }
        return "";
    }

}
