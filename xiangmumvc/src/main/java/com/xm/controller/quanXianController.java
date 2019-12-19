package com.xm.controller;

import com.xm.dao.EmployeeDao;
import com.xm.dao.JurBeanDao;
import com.xm.dao.JurTitleDao;
import com.xm.entity.Employee;
import com.xm.entity.Juristitle;
import com.xm.entity.bean.JurBean;
import com.xm.entity.bean.StateBean;
import com.xm.util.comm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/qx")
public class quanXianController {
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private JurBeanDao jurBeanDao;
    @Autowired
    private JurTitleDao juristitleDao;
    @RequestMapping(value = "/getAllEmployee",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<Employee> getAllEmployee(){
        return employeeDao.getAllEmployee();
    }
    @RequestMapping(value = "/getView",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<JurBean> getView(@RequestParam("id") int info){
        List<Juristitle> listAll=juristitleDao.queryByEmployeeId(info);
        List<JurBean> list=jurBeanDao.query(info,0);
        for (JurBean jurBean:list){
            int id=jurBean.getId();
            List<JurBean> list1=jurBeanDao.query(info,id);
            jurBean.setNodes(list1);
        }

        for (JurBean jurBean:list){
            StateBean stateBean=new StateBean();
            for (Juristitle juristitle:listAll){
                if(jurBean.getId() == juristitle.getId()){
                    stateBean.setChecked(true);
                }
            }

            jurBean.setState(stateBean);
            List<JurBean> listSon=jurBean.getNodes();
            for (JurBean jur1:listSon){
                StateBean stateBean1=new StateBean();
                for (Juristitle jur:listAll){
                    if(jur1.getId() == jur.getId()){
                        stateBean.setChecked(true);
                        stateBean1.setChecked(true);
                    }
                }
                jur1.setState(stateBean1);
            }

        }
        return list;
    }

    @RequestMapping(value = "/getFenPei",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String getFenPei(@RequestParam("id") int id,@RequestParam("pm") String pm){
        System.out.println(pm);
        List<Integer> listMax=new ArrayList<Integer>();
        for (Juristitle i:juristitleDao.queryByEmployeeId(id)){
            listMax.add(i.getId());
        }
        juristitleDao.updateMax0(listMax);
        List<Integer> listMin=comm.aigInfo(pm);
        juristitleDao.updateMin1(listMin);
        return "";
    }

}
