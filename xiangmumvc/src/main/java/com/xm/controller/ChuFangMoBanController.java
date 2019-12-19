package com.xm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xm.dao.*;
import com.xm.entity.Prescriptiontemplate;
import com.xm.entity.Prescriptiontemplatedetail;
import com.xm.entity.dto.MedicalrecordtemplateDto;
import com.xm.entity.dto.PreDto;
import com.xm.entity.dto.PreTailDto;
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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/chuFang")
public class ChuFangMoBanController {
    @Autowired
    private PreDtoDao preDtoDao;
    @Autowired
    private PreTailDtoDao preTailDtoDao;
    @Autowired
    private PrescriptiontemplateDao prescriptiontemplateDao;
    @Autowired
    private PrescriptiontemplatedetailDao prescriptiontemplatedetailDao;
    String path="C:\\Users\\Administrator\\Desktop\\xiangmu\\";
    @RequestMapping(value = "/getAllFile",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Map<String,Object> getAllFile(@RequestParam("templatename") String templatename,
                                          @RequestParam("employeename") String employeename,
                                          @RequestParam("pageSize") int pageSize,
                                          @RequestParam("pageNumber") int pageNumber
                                   ){
        Map<String,Object> map=new HashMap<String,Object>();
        Map<String,Object> map1=new HashMap<String,Object>();
        map1.put("templatename",templatename);
        map1.put("employeename",employeename);
        map1.put("offset",(pageNumber-1)*pageSize);
        map1.put("limit",pageSize);
        List<PreDto> rows=preDtoDao.getAllPreList(map1);
        map.put("total",preDtoDao.getCount(map1));
        map.put("rows",rows);
        return  map;
    }
    @RequestMapping(value = "/getAllTailList",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<PreTailDto> getAllTailList(@RequestParam("pid") Integer pid){
        return  preTailDtoDao.getAllTailList(pid);
    }
    @RequestMapping(value = "/addPrescriptiontemplate",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String addPrescriptiontemplate(Prescriptiontemplate p){
        return prescriptiontemplateDao.addPrescriptiontemplate(p)+"";
    }
    @RequestMapping(value = "/addprescriptiontemplatedetail",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String addprescriptiontemplatedetail(Prescriptiontemplatedetail p){
        System.out.println(p.toString());
        return prescriptiontemplatedetailDao.addPrescriptiontemplatedetail(p)+"";
    }
    @RequestMapping(value = "/upprescriptiontemplatedetail",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String upprescriptiontemplatedetail(Prescriptiontemplatedetail p){
        return prescriptiontemplatedetailDao.upPrescriptiontemplatedetail(p)+"";
    }
    @RequestMapping(value = "/deprescriptiontemplatedetail",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public String deprescriptiontemplatedetail(@RequestParam("id") Integer id){
        return prescriptiontemplatedetailDao.delPrescriptiontemplatedetail(id)+"";
    }

    /*
     * 指定下载
     * */
    //处理下载所选数据
    @RequestMapping(value = "/fileId")
    public ResponseEntity<byte[]> fileId(@RequestParam("ids") String ids, HttpServletRequest request, HttpServletResponse resp)
            throws Exception {
        System.out.println(ids);
        String[] sids = ids.split("-") ;
        List<Integer> dids = new ArrayList<Integer>() ;
        for (int i=0;i<sids.length;i++){
            dids.add(Integer.parseInt(sids[i])) ;
        }
        System.out.println("开始");
        //加载表的所有数据
        List<PreTailDto> list =  preTailDtoDao.getAllTailByIds(dids) ;
        System.out.println(list.size());
        System.out.println("结束");

        //在服务器上产生excel数据表格
        XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(new File(path+"处方模板.xlsx"))) ;
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
            PreTailDto m = list.get(i) ;
            row = sheet.createRow(i+1);
            //设置行高
            row.setHeight((short) 580);
            String drugname=m.getDrugname(); //药品名称,
            Integer eachdosage=m.getEachdosage(); //每剂用量,
            Integer dosagequantity=m.getDosagequantity(); //剂数,
            String forname=m.getForname(); //用药方式,
            String  frename=m.getFrename(); // 用药频率,
            Integer medicineamount=m.getMedicineamount(); // 用药总量,
            String  note=m.getNote(); // 备注
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
            cell0.setCellValue(drugname);
            cell1.setCellValue(eachdosage);
            cell2.setCellValue(dosagequantity);
            cell3.setCellValue(forname);
            cell4.setCellValue(frename);
            cell5.setCellValue(medicineamount);
            cell6.setCellValue(note);
        }
        //格式化当前时间
        String strDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) ;
        String fileName = "处方模板"+strDate+".xlsx" ;
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
