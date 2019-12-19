package com.xm1.controller;

import com.xm1.entity.Drug1;
import com.xm1.service.DrugService1;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Controller
@RequestMapping("/dur")
@Scope("prototype")
public class DurController1 {
    @Resource(name = "prototype")
    private DrugService1 drugService1;

    @RequestMapping(value = "/durca1")
    @ResponseBody
    public List<Drug1> dur1(){
        System.out.println("进入Drug查询");
        return drugService1.getServiceDru();
    }

    //删除Drug
    @RequestMapping(value = "/DelDuge1")
    @ResponseBody
    public List<Drug1> del(long id){
        drugService1.delDurg(id);
        return drugService1.getServiceDru();
    }


    //删除多个
    @RequestMapping(value = "/dels")
    @ResponseBody
    public List<Drug1> dels(String id){
        drugService1.delDurgs(id);
        return drugService1.getServiceDru();
    }
    //添加
    @RequestMapping(value = "/durgadd")
    @ResponseBody
    public List<Drug1> addDurg(Drug1 drug){
        System.out.println("进入添加");
        drugService1.getDrugAdd(drug);
        List<Drug1> list =new ArrayList<>();
        if (list!=null){
            System.out.println("成");
        }else {
            System.out.println("败");
        }
        return drugService1.getServiceDru();
    }
    //修改

    @RequestMapping(value = "/xiugai")
    @ResponseBody
    public List<Drug1> getupd(Drug1 drug1){
        System.out.println(drug1.toString());
        System.out.println("进入修改coll");
        System.out.println("7");
       boolean bl= drugService1.getDrugUpdservice(drug1);
        System.out.println(bl);
        System.out.println("7");
        return drugService1.getServiceDru();
    }

    @RequestMapping(value = "/Guoqi")
    @ResponseBody
    public List<Drug1> getGuoQi(){
        return drugService1.getServiceGuoQi();
    }



//    //文件上传
//    @RequestMapping(value = "/doupload")
//    public String doupload(@RequestParam(value ="photo", required = false) MultipartFile attach, HttpServletRequest request){
//        //服务器的地址
//        String obPath = request.getSession().getServletContext().getRealPath("/upimages") ;
//        //允许上传图片的大小
//        int filesize = 500000;
//        //得到上传上传文件的大小
//        long fsize  = attach.getSize() ;
//        // 上传文件的名字
//        String fileName = attach.getOriginalFilename() ;
//        //文件的后缀名
//        String prefix = fileName.substring(fileName.lastIndexOf(".")+1) ;
//
//        if(fsize> filesize){
//            //跳转到上传错误页面
//            request.setAttribute("error","文件超重了！");
//            return "error" ;//异常页面
//        }
//        else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
//                || prefix.equalsIgnoreCase("jpeg") || prefix.equalsIgnoreCase("pneg")) {//上传图片格式不正确
//            System.out.println("aaa1");
//            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
//            System.out.println("aaa2");
//            String newFileName = simpleDateFormat.format(new Date()) + "-" + fileName ;
//            System.out.println("aaa3");
//            File targetFile = new File(obPath, newFileName);
//            System.out.println("aaa4");
//            if(!targetFile.exists()){
//                targetFile.mkdirs();
//            }
//            try {
//                attach.transferTo(targetFile);
//            }catch (Exception e){
//                e.printStackTrace();
//            }
//        }
//        else{
//            request.setAttribute("error","文件格式不正确！");
//            return "error" ;//异常页面
//        }
//
//        return "success" ;//成功页面
//    }
//
//    @RequestMapping(value = "/doupload1")
//    public String doupload1(@RequestParam(value ="photo", required = false) MultipartFile[] attachs,HttpServletRequest request){
//        //服务器的地址
//        String obPath = request.getSession().getServletContext().getRealPath("/upimages") ;
//        for(MultipartFile attach : attachs){
//            //允许上传图片的大小
//            int filesize = 500000;
//            //得到上传上传文件的大小
//            long fsize  = attach.getSize() ;
//            // 上传文件的名字
//            String fileName = attach.getOriginalFilename() ;
//            //文件的后缀名
//            String prefix = fileName.substring(fileName.lastIndexOf(".")+1) ;
//            if(fsize> filesize){
//                //跳转到上传错误页面
//                request.setAttribute("error","文件超重了！");
//                return "error" ;//异常页面
//            }
//            else if(prefix.equalsIgnoreCase("jpg") || prefix.equalsIgnoreCase("png")
//                    || prefix.equalsIgnoreCase("jpeg") || prefix.equalsIgnoreCase("pneg")) {//上传图片格式不正确
//
//                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
//                String newFileName = simpleDateFormat.format(new Date()) + "-" + fileName ;
//                File targetFile = new File(obPath, newFileName);
//                if(!targetFile.exists()){
//                    targetFile.mkdirs();
//                }
//                try {
//                    attach.transferTo(targetFile);
//                }catch (Exception e){
//                    e.printStackTrace();
//                }
//            }
//            else{
//                request.setAttribute("error","文件格式不正确！");
//                return "error" ;//异常页面
//            }
//
//        }
//
//
//
//        return "success" ;
//    }


}
