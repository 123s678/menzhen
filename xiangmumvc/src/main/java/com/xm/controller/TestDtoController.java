package com.xm.controller;

import com.xm.dao.TestDtoDao;
import com.xm.entity.Employee;


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
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/testCon")
public class TestDtoController {
    @Autowired
    private TestDtoDao testDtoDao;
    String path="C:\\Users\\Administrator\\Desktop\\xiangmu\\";

    @RequestMapping(value = "/loadUrl",produces={"text/html;charset=UTF-8;","application/json;"})
    public String loadUrl(){
        return "redirect:/TestDto.jsp";
    }
    @RequestMapping(value = "/query",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<Employee> query(){
        return testDtoDao.query();
    }

    @RequestMapping(value = "/save",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public List<Employee> save(Employee employee){
         testDtoDao.save(employee);
         List<Employee> list=testDtoDao.query();
         return list;
    }



    @RequestMapping(value = "/fileDownload")
    public ResponseEntity<byte[]> fileDownload(HttpServletRequest request, HttpServletResponse resp) throws Exception {
        // resp.setContentType("application/vnd.ms-excel;charset=utf-8");
        byte[] body = null;
        // ServletContext servletContext = request.getServletContext();
        // String fileName = path.substring(path.lastIndexOf("_") + 1); //从uuid_name.jpg中截取文件名
        //String path = request.getSession().getServletContext().getRealPath("1.txt");
        File file = new File("咨询数据模板.xlsx");
        InputStream in = new FileInputStream(file);
        body = new byte[in.available()];
        in.read(body);
        HttpHeaders headers = new HttpHeaders();
        String fileName = new String("咨询数据模板.xlsx".getBytes("gbk"), "iso8859-1");
        headers.add("Content-Disposition", "attachment;filename=" + fileName);
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> response = new ResponseEntity<byte[]>(body, headers, statusCode);
        in.close();
        return response;
    }

    //上传excel文件
    @RequestMapping(value = "/read2007Excel",produces={"text/html;charset=UTF-8","application/json"})
    @ResponseBody
    public List<Employee> read2007Excel(InputStream inputStream)
            throws IOException
    {
        List<Employee> list = new LinkedList<Employee>();
        XSSFWorkbook xwb = new XSSFWorkbook(inputStream);
        // 读取第一章表格内容
        XSSFSheet sheet = xwb.getSheetAt(0);
        XSSFRow row = null ;
        for (int i = sheet.getFirstRowNum() + 1; i <= sheet
                .getPhysicalNumberOfRows(); i++) {
            row = sheet.getRow(i);
            if(row==null){
                continue;
            }
            XSSFCell cell1 = row.getCell(1);
            XSSFCell cell2 = row.getCell(2);
            XSSFCell cell3 = row.getCell(3);
            String id ="";
            String employeecode ="";
            String psw = "";

            /*
            * 这里报错
            * */
            try {
                id = cell1.getStringCellValue();
                employeecode = cell2.getStringCellValue() ;
                psw = cell3.getStringCellValue() ;
                System.out.println("成功了");
            }catch (Exception e){
                System.out.println("又失败了");
                e.printStackTrace();
            }

            Employee employee = new Employee() ;
            employee.setId(Integer.parseInt(id));
            employee.setEmployeecode(employeecode);
            employee.setPsw(psw);
            list.add(employee) ;
        }
        return list;
    }

    //上传excel文件
    @RequestMapping(value = "/uploadExcel",produces={"text/html;charset=UTF-8;","application/json;"})
    @ResponseBody
    public Map<String, Object> uploadExcel(MultipartFile myfile, HttpServletRequest request)
            throws IllegalStateException, IOException {
        InputStream inputStream =   myfile.getInputStream() ;
        Map<String,Object> map = new HashMap<>() ;
        try {
            List<Employee>  list = read2007Excel(inputStream) ;
            for (Employee employee :list){
                employee.setId(1);
                employee.setEmployeecode("");
                employee.setPsw("");
                testDtoDao.save(employee);
            }
            map.put("msg","上传成功") ;
        } catch (IOException e) {
            map.put("msg","上传失败") ;
            e.printStackTrace();
        }
        inputStream.close();
        return map;
    }

    /*
* 全部下载
* */
    @RequestMapping(value = "/fileDownloadData")
    public ResponseEntity<byte[]> fileDownloadData(HttpServletRequest request, HttpServletResponse resp)
            throws Exception {

        //加载表的所有数据
        List<Employee> list =  testDtoDao.query() ;
        //在服务器上产生excel数据表格
        XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(new File(path+"咨询数据模板.xlsx"))) ;
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
            Employee employee = list.get(i) ;
            row = sheet.createRow(i+1);
            //设置行高
            row.setHeight((short) 580);
            int id = employee.getId() ;
            String employeecode = employee.getEmployeecode() ;
            String psw  = employee.getPsw();
            XSSFCell cell0 = row.createCell(1) ;
            //设置单元格样式
            cell0.setCellStyle(style);
            XSSFCell cell1 = row.createCell(2) ;
            //设置单元格样式
            cell1.setCellStyle(style);
            //设置单元格样式
            XSSFCell cell2 = row.createCell(3) ;
            cell2.setCellStyle(style);
            cell0.setCellValue(id);
            cell1.setCellValue(employeecode);
            cell2.setCellValue(psw);
        }
        //格式化当前时间
        String strDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) ;
        String fileName = "咨询数据"+strDate+".xlsx" ;
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
    /*
    * 指定下载
    * */
    //处理下载所选数据
    @RequestMapping(value = "/fileDownloadSelectData")
    public ResponseEntity<byte[]> fileDownloadSelectData(@RequestParam("ids") String ids, HttpServletRequest request, HttpServletResponse resp)
            throws Exception {
        String[] sids = ids.split("-") ;



        List<Integer> dids = new ArrayList<Integer>() ;
        for (int i=1;i<sids.length;i++){
            dids.add(Integer.parseInt(sids[i])) ;
        }
        //加载表的所有数据
        List<Employee> list =  testDtoDao.queryByIds(dids) ;
        //在服务器上产生excel数据表格
        XSSFWorkbook xwb = new XSSFWorkbook(new FileInputStream(new File(path+"咨询数据模板.xlsx"))) ;
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
            Employee employee = list.get(i) ;
            row = sheet.createRow(i+1);
            //设置行高
            row.setHeight((short) 580);
            int id = employee.getId() ;
            String employeecode = employee.getEmployeecode() ;
            String psw  = employee.getPsw();
            XSSFCell cell0 = row.createCell(1) ;
            //设置单元格样式
            cell0.setCellStyle(style);
            XSSFCell cell1 = row.createCell(2) ;
            //设置单元格样式
            cell1.setCellStyle(style);
            //设置单元格样式
            XSSFCell cell2 = row.createCell(3) ;
            cell2.setCellStyle(style);
            cell0.setCellValue(id);
            cell1.setCellValue(employeecode);
            cell2.setCellValue(psw);
        }
        //格式化当前时间
        String strDate = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) ;
        String fileName = "咨询数据"+strDate+".xlsx" ;
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
