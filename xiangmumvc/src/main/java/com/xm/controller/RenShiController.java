package com.xm.controller;

import com.xm.dao.EmployeeDao;
import com.xm.dao.EmployeeDooDao;
import com.xm.dao.JurisDao;
import com.xm.dao.JuristitleDao;
import com.xm.entity.Employee;
import com.xm.entity.Juris;
import com.xm.entity.Juristitle;
import com.xm.entity.doo.EmployeeDoo;
import com.xm.util.comm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/rs")
public class RenShiController {
    @Autowired
    private EmployeeDooDao employeeDooDao;
    @Autowired
    private EmployeeDao employeeDao;
    @Autowired
    private JurisDao jurisDao;
    @Autowired
    private JuristitleDao juristitleDao;
    @RequestMapping(value = "/getAllDoo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    List<EmployeeDoo> getAllDoo(){
        return employeeDooDao.getAllDoo();
    }
    @RequestMapping(value = "/pictureInfo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String pictureInfo(@RequestParam(value = "price") String price, HttpSession session){
        session.setAttribute("fileNamePrice","songziyi/upload/"+comm.fileName(price));
        return "";
    }
    @RequestMapping(value = "/pictureInfo2",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String pictureInfo2(@RequestParam(value = "price") String price, HttpSession session){
        session.setAttribute("fileNamePrice2","songziyi/upload/"+comm.fileName(price));
        return "";
    }

    @RequestMapping(value = "/addInfo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String addInfo(Employee employee,HttpSession session){
        employee.setPicture((String)session.getAttribute("fileNamePrice"));
        /*
        * 查找权限表id+1
        * */
       employee.setJurisid(jurisDao.getNewJuris().getId()+1);
        /*
        * 先添加员工表
        * */
        System.out.println(employee.toString());
        employeeDao.addEmployee(employee);
        Juris juris=new Juris();
        /*
        * 查找最新员工表
        * */
        juris.setEmployeeid(employeeDao.getNewEmployee().getId());
        /*
        * 添加权限表
        * */
        jurisDao.addJuris(juris);
        /*
        * 开始21条权限分布表插入
        * */
        int jurisid=jurisDao.getNewJuris().getId();
        /*
        * 1
        * */
        Juristitle j1=new Juristitle();
        j1.setPid(0);
        j1.setJurisid(jurisid);
        juristitleDao.addOb1(j1);
        /*
         * 2
         * */
        Juristitle j2=new Juristitle();
        j2.setPid(0);
        j2.setJurisid(jurisid);
        juristitleDao.addOb2(j2);
        /*
         * 3
         * */
        int pid2=juristitleDao.newJuristitle().getId();
        Juristitle j3=new Juristitle();
        j3.setPid(pid2);
        j3.setJurisid(jurisid);
        juristitleDao.addOb3(j3);
        /*
        * 4
        * */
        Juristitle j4=new Juristitle();
        j4.setPid(pid2);
        j4.setJurisid(jurisid);
        juristitleDao.addOb4(j3);
        /*
         * 5
         * */
        Juristitle j5=new Juristitle();
        j5.setPid(pid2);
        j5.setJurisid(jurisid);
        juristitleDao.addOb5(j3);
        /*
         * 6
         * */
        Juristitle j6=new Juristitle();
        j6.setPid(pid2);
        j6.setJurisid(jurisid);
        juristitleDao.addOb6(j6);
        /*
         * 7
         * */
        Juristitle j7=new Juristitle();
        j7.setPid(0);
        j7.setJurisid(jurisid);
        juristitleDao.addOb7(j7);
        /*
         * 8
         * */
        Juristitle j8=new Juristitle();
        j8.setPid(0);
        j8.setJurisid(jurisid);
        juristitleDao.addOb8(j8);
        /*
         * 9
         * */
        int pid8=juristitleDao.newJuristitle().getId();
        Juristitle j9=new Juristitle();
        j9.setPid(pid8);
        j9.setJurisid(jurisid);
        juristitleDao.addOb9(j9);
        /*
         * 10
         * */
        Juristitle j10=new Juristitle();
        j10.setPid(pid8);
        j10.setJurisid(jurisid);
        juristitleDao.addOb10(j10);
        /*
        * 11
        * */
        Juristitle j11=new Juristitle();
        j11.setPid(0);
        j11.setJurisid(jurisid);
        juristitleDao.addOb11(j11);
        /*
         * 12
         * */
        int pid11=juristitleDao.newJuristitle().getId();
        Juristitle j12=new Juristitle();
        j12.setPid(pid11);
        j12.setJurisid(jurisid);
        juristitleDao.addOb12(j12);
        /*
         * 13
         * */
        Juristitle j13=new Juristitle();
        j13.setPid(pid11);
        j13.setJurisid(jurisid);
        juristitleDao.addOb13(j13);
        /*
         * 14
         * */
        Juristitle j14=new Juristitle();
        j14.setPid(pid11);
        j14.setJurisid(jurisid);
        juristitleDao.addOb14(j14);
        /*
        * 15
        * */
        Juristitle j15=new Juristitle();
        j15.setPid(0);
        j15.setJurisid(jurisid);
        juristitleDao.addOb15(j15);
        /*
         * 16
         * */
        Juristitle j16=new Juristitle();
        j16.setPid(0);
        j16.setJurisid(jurisid);
        juristitleDao.addOb16(j16);
        /*
        * 17
        * */
        int pid16=juristitleDao.newJuristitle().getId();
        Juristitle j17=new Juristitle();
        j17.setPid(pid16);
        j17.setJurisid(jurisid);
        juristitleDao.addOb17(j17);
        /*
        * 18
        * */
        Juristitle j18=new Juristitle();
        j18.setPid(pid16);
        j18.setJurisid(jurisid);
        juristitleDao.addOb18(j18);
        /*
         * 19
         * */
        Juristitle j19=new Juristitle();
        j19.setPid(pid16);
        j19.setJurisid(jurisid);
        juristitleDao.addOb19(j19);
        /*
         * 20
         * */
        Juristitle j20=new Juristitle();
        j20.setPid(pid16);
        j20.setJurisid(jurisid);
        juristitleDao.addOb20(j20);
        /*
         * 21
         * */
        Juristitle j21=new Juristitle();
        j21.setPid(pid16);
        j21.setJurisid(jurisid);
        juristitleDao.addOb21(j21);
        return "";
    }

    @RequestMapping(value = "/removeInfo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String removeInfo(@RequestParam("id") Integer employeeid){
        String str="";
        if(employeeid==5){
            str="0";
        }else{
            List<Juristitle> juristitles=juristitleDao.getAllByEmployeeid(employeeid);
            List<Integer> list=new ArrayList<Integer>();
            for (Juristitle i:juristitles){
                list.add(i.getId());
            }
            employeeDao.removeEmployee(employeeid);
            jurisDao.removeJuris(employeeid);
            juristitleDao.removeJuristitle(list);
           str="1";
        }
        return str;
    }

    @RequestMapping(value = "/updateInfo",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String updateInfo(Employee employee,HttpSession session){
        employee.setPicture((String)session.getAttribute("fileNamePrice2"));
        employeeDao.updateEmployee(employee);
        return "";
    }
}
