package com.xm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xm.dao.MedicalrecordtemplateDao;
import com.xm.dao.MedicalrecordtemplateDtoDao;
import com.xm.entity.Employee;
import com.xm.entity.Medicalrecordtemplate;
import com.xm.entity.dto.MedicalrecordtemplateDto;
import com.xm.service.MedicalrecordtemplateDtoService;
import com.xm.service.MedicalrecordtemplateService;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.annotation.Resources;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/medicalDCon")
public class MedicalrecordtemplateDtoController {

    @Resource(name="medicalrecordtemplateDtoService")
    MedicalrecordtemplateDtoService medicalrecordtemplateDtoService;
    @Resource(name="medicalrecordtemplateDao")
    MedicalrecordtemplateDao medicalrecordtemplateDao;
    @Resource(name="medicalrecordtemplateDtoDao")
    MedicalrecordtemplateDtoDao medicalrecordtemplateDtoDao;
    @Resource(name="medicalrecordtemplateService")
    MedicalrecordtemplateService medicalrecordtemplateService;
    String path="C:\\Users\\Administrator\\Desktop\\xiangmu\\";
    /*
    * 查询分页的方法
    * */
    @RequestMapping(value = "/getMedicalDtoList",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Map<String,Object> getMedicalDtoList(@RequestParam("templatecode") String templatecode,
                                                @RequestParam("templatename") String templatename,
                                                @RequestParam("departmentname") String departmentname,
                                                @RequestParam("employeename") String employeename,
                                                @RequestParam("fitstatus") String fitstatus,
                                                @RequestParam("pageSize") Integer pageSize,
                                                @RequestParam("pageNumber") Integer pageNumber){

        Map<String,Object> map=new HashMap<String,Object>();
        Map<String,Object> map1=new HashMap<String,Object>();
        map1.put("templatecode",templatecode);
        map1.put("templatename",templatename);
        map1.put("departmentname",departmentname);
        map1.put("employeename",employeename);
        map1.put("fitstatus",fitstatus);
        map1.put("offset",(pageNumber-1)*pageSize);
        map1.put("limit",pageSize);
        List<MedicalrecordtemplateDto> rows=medicalrecordtemplateDtoService.getMedicalDtoList(map1);
        map.put("total",medicalrecordtemplateDtoService.getCount(map1));
        map.put("rows",rows);
        return map;
    }
    /*
    * 查询分页条数的方法
    * */
    @RequestMapping(value = "/getMecDtoOne",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<MedicalrecordtemplateDto> getMecDtoOne(@RequestParam("id") int id){
        return medicalrecordtemplateDtoService.getMecDtoOne(id);
    }
    /*
    * 根据id删除
    * */
    @RequestMapping(value = "/shanSing",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public boolean shanSing(@RequestParam("id") int id){
        return medicalrecordtemplateDtoService.deleteMedical(id);
    }
    /*
    * 点击修改后传id进来
    * */
    @RequestMapping(value = "/fromSession",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Medicalrecordtemplate fromSession(@RequestParam("id") int id){
        return medicalrecordtemplateDao.selectByIdAllOne(id);
    }

    /*
     * 点击修改后传id进来
     * */
    @RequestMapping(value = "/updateMedical",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public boolean updateMedical(@RequestParam("templatecode") String templatecode,
                                 @RequestParam("templatename") String templatename,
                                 @RequestParam("fitstatus") String fitstatus,
                                 @RequestParam("note") String note,
                                 @RequestParam("diseaseid") int diseaseid,
                                 @RequestParam("id") int id
                                 ){
        Medicalrecordtemplate medicalrecordtemplate=new Medicalrecordtemplate();
        medicalrecordtemplate.setId(id);
        medicalrecordtemplate.setTemplatecode(templatecode);
        medicalrecordtemplate.setTemplatename(templatename);
        medicalrecordtemplate.setFitstatus(fitstatus);
        medicalrecordtemplate.setDiseaseid(diseaseid);
        medicalrecordtemplate.setNote(note);
        return medicalrecordtemplateDao.updateMedical(medicalrecordtemplate);
    }

    /*
     * loadInsert
     * */
    @RequestMapping(value = "/loadInsert",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String loadInsert(){
        return medicalrecordtemplateService.maxMedical()+"";
    }
    /*
     * loadInsert
     * */
    @RequestMapping(value = "/addM",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public boolean addM(@RequestParam("templatecode") String templatecode,
                        @RequestParam("templatename") String templatename,
                        @RequestParam("doctorid") int doctorid,
                        @RequestParam("diseaseid") int diseaseid,
                        @RequestParam("fitstatus") String fitstatus,
                        @RequestParam("note") String note,
                        @RequestParam("patientappeal") String patientappeal,
                        @RequestParam("medicalhistory") String medicalhistory,
                        @RequestParam("physicalstatus") String physicalstatus,
                        @RequestParam("primarydiagnosis") String primarydiagnosis,
                        @RequestParam("opinion") String opinion
                        ){
        Medicalrecordtemplate medicalrecordtemplate=new Medicalrecordtemplate();
        medicalrecordtemplate.setTemplatecode(templatecode);
        medicalrecordtemplate.setTemplatename(templatename);
        medicalrecordtemplate.setDoctorid(doctorid);
        medicalrecordtemplate.setDiseaseid(diseaseid);
        medicalrecordtemplate.setFitstatus(fitstatus);
        medicalrecordtemplate.setNote(note);
        medicalrecordtemplate.setPatientappeal(patientappeal);
        medicalrecordtemplate.setMedicalhistory(medicalhistory);
        medicalrecordtemplate.setPhysicalstatus(physicalstatus);
        medicalrecordtemplate.setPrimarydiagnosis(primarydiagnosis);
        medicalrecordtemplate.setOpinion(opinion);
        return medicalrecordtemplateDao.addMedical(medicalrecordtemplate);
    }



    /*
     * 指定下载
     * */
    //处理下载所选数据
    @RequestMapping(value = "/ddinfo")
    public ResponseEntity<byte[]> ddinfo(@RequestParam("ids") String ids, HttpServletRequest request, HttpServletResponse resp)
            throws Exception {
        String[] sids = ids.split("-") ;


        List<Integer> dids = new ArrayList<Integer>() ;
        for (int i=0;i<sids.length;i++){
            dids.add(Integer.parseInt(sids[i])) ;
        }
        //加载表的所有数据
        List<MedicalrecordtemplateDto> list =  medicalrecordtemplateDtoDao.queryByIdLis(dids) ;
        for (MedicalrecordtemplateDto i:list){
            System.out.println(i.toString());
        }
        //在服务器上产生excel数据表格
        XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(new File(path+"病例模板.xlsx"))) ;
        //得到excel表格的每个worksheet
        XSSFSheet sheet = xwb.getSheetAt(0);
        //声明行
        XSSFRow row = null;
        //单元格样式
        XSSFCellStyle style = xwb.createCellStyle();
        style.setAlignment(HorizontalAlignment.CENTER);
        XSSFFont font = xwb.createFont();// 创建字体对象
        font.setFontHeightInPoints((short) 15);// 设置字体大小
        style.setFont(font);
        for (int i=0;i<list.size();i++) {
            MedicalrecordtemplateDto m = list.get(i) ;
            row = sheet.createRow(i+1);
            //设置行高
            row.setHeight((short) 580);
             String templatecode=m.getTemplatecode(); //模板编号,
             String templatename=m.getTemplatename(); //模板名称,
             String employeename=m.getEmployeename(); //医生名称,
             String diseasename=m.getDiseasename(); //类别名称,
             String  fitstatus=m.getFitstatus(); // 适用情况,
             String departmentname=m.getDepartmentname(); // 科室名称,
             String  patientappeal=m.getPatientappeal(); // 病人主诉,
             String  medicalhistory=m.getMedicalhistory(); // 病人病史,
             String physicalstatus=m.getPhysicalstatus(); // 体检情况,
             String primarydiagnosis=m.getPrimarydiagnosis(); // 初步诊断,
             String opinion=m.getOpinion(); // 处理意见
            XSSFCell cell0 = row.createCell(1) ;
            cell0.setCellStyle(style);
            XSSFCell cell1 = row.createCell(2) ;
            cell1.setCellStyle(style);
            XSSFCell cell2 = row.createCell(3) ;
            cell2.setCellStyle(style);
            XSSFCell cell3 = row.createCell(4) ;
            cell3.setCellStyle(style);
            XSSFCell cell4 = row.createCell(5) ;
            cell4.setCellStyle(style);
            XSSFCell cell5 = row.createCell(6) ;
            cell5.setCellStyle(style);
            XSSFCell cell6 = row.createCell(7) ;
            cell6.setCellStyle(style);
            XSSFCell cell7 = row.createCell(8) ;
            cell7.setCellStyle(style);
            XSSFCell cell8 = row.createCell(9) ;
            cell8.setCellStyle(style);
            XSSFCell cell9 = row.createCell(10) ;
            cell9.setCellStyle(style);
            XSSFCell cell10 = row.createCell(11) ;
            cell10.setCellStyle(style);


            cell0.setCellValue(templatecode);
            cell1.setCellValue(templatename);
            cell2.setCellValue(employeename);
            cell3.setCellValue(diseasename);
            cell4.setCellValue(fitstatus);
            cell5.setCellValue(departmentname);
            cell6.setCellValue(patientappeal);
            cell7.setCellValue(medicalhistory);
            cell8.setCellValue(physicalstatus);
            cell9.setCellValue(primarydiagnosis);
            cell10.setCellValue(opinion);
        }
        //格式化当前时间
        String strDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) ;
        String fileName = "病例模板"+strDate+".xlsx" ;
        //在服务器上生成数据
        FileOutputStream os = new FileOutputStream(fileName);
        xwb.write(os);
        os.close();// 关闭文件输出流
        byte[] body = null;
        File file = new File(fileName);
        InputStream in = new FileInputStream(file);
        body = new byte[in.available()];
        in.read(body);

        HttpHeaders headers = new HttpHeaders();
        String fname = new String(fileName.getBytes("gbk"), "iso8859-1");
        headers.add("Content-Disposition", "attachment;filename=" + fname);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
        in.close();
        return response;
    }


}
