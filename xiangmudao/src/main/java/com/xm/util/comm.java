package com.xm.util;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class comm {
    /*
     * 查看字符串是否能转化为数字
     * */
    public static boolean isNumber(String str) {
        for (int i = 0; i < str.length(); i++) {
            if (!Character.isDigit(str.charAt(i))) {
                return false;
            }
        }
        return true;
    }

    /*
     * 查看字符串是否为空
     * */
    public static boolean isNull(String str) {
        if (str == null) {
            return true;
        } else {
            return false;
        }
    }

    /*
     * 查看字符串集合是否为空
     * */
    public static boolean isNull(List<String> str) {
        boolean boo = false;
        for (String i : str) {
            if (i == null) {
                boo = true;
                break;
            } else {
                boo = false;
            }
        }
        return boo;
    }

    /*
     * 查看字符串数组是否为空
     * */
    public static boolean isNull(String[] str) {
        boolean boo = false;
        for (String i : str) {
            if (i == null) {
                boo = true;
                break;
            } else {
                boo = false;
            }
        }
        return boo;
    }

    /*
     * 查看字符串是否为""
     * */
    public static boolean isEmpty(String str) {
        if (str.equals("")) {
            return true;
        } else {
            return false;
        }
    }

    /*
     * 查看字符串集合是否为""
     * */
    public static boolean isEmpty(List<String> str) {
        boolean boo = false;
        for (String i : str) {
            if (i.equals("")) {
                boo = true;
                break;
            } else {
                boo = false;
            }
        }
        return boo;
    }

    /*
     * 查看字符串数组是否为""
     * */
    public static boolean isEmpty(String[] str) {
        boolean boo = false;
        for (String i : str) {
            if (i.equals("")) {
                boo = true;
                break;
            } else {
                boo = false;
            }
        }
        return boo;
    }

    /*
     * 把1,2,3,4,格式的字符串转成Integer数组
     * */
    public static Integer[] split(String strList) {
        String[] str = strList.split(",");
        Integer[] ins = new Integer[str.length];
        for (int i = 0; i < str.length; i++) {
            ins[i] = Integer.parseInt(str[i]);
        }
        return ins;
    }

    /*
     * 把1,2,3,4,格式的字符串转成Integer数组
     * */
    public static Integer[] split2(String strList) {
        String[] str = strList.split("-");

        for (String j:str){
            System.out.println(j);
        }

        Integer[] ins = new Integer[str.length];
        for (int i = 0; i < str.length; i++) {
            ins[i] = Integer.parseInt(str[i]);
        }
        return ins;
    }
    /*
     * 把String,String,String,String,格式的字符串转成String数组
     * */
    public static String[] splitString(String strList) {
        String[] str = strList.split(",");
        String[] ins = new String[str.length];
        for (int i = 0; i < str.length; i++) {
            ins[i] = str[i];
        }
        return ins;
    }



    /*
     * io流复制上传的文件返回文件名
     * */
    public static void fu(File file1, File file2) {
        FileInputStream fis = null;
        DataInputStream dis = null;
        FileOutputStream fos = null;
        DataOutputStream dos = null;
        try {
            fis = new FileInputStream(file1);
            dis = new DataInputStream(fis);
            fos = new FileOutputStream(file2);
            dos = new DataOutputStream(fos);
            byte[] bytes = new byte[1024];
            int data = 0;
            while ((data = dis.read(bytes)) != -1) {
                dos.write(bytes, 0, data);
            }
            dos.flush();
            dos.close();
            fos.close();
            dis.close();
            fis.close();
        } catch (Exception e) {
            e.fillInStackTrace();
        }
    }

    /*
     * 截取字符串名称
     * */
    public static String fileName(String str) {
        String temp[] = str.toString().split("\\\\");
        return temp[temp.length - 1];
    }

    /*
    * 追加sql
    * */
    public static String sqlIdZui(List<Integer> idList){
        String str="";
        String sql="in(";
        for (Integer i:idList) {
            sql += "?,";
        }
        str+=sql.substring(0,sql.length()-1);
        str+=")";
        return str;
    }
    /*
     * 追加sql
     * */
    public static String sqlStateZui(List<String> stateList){
        String str="";
        String sql="in(";
        for (String i:stateList) {
            sql += "?,";
        }
        str+=sql.substring(0,sql.length()-1);
        str+=")";
        return str;
    }
    /*
    * List<Integer> 转换成 Object数组
    * */
    public static Object[] sqlparObject(List<Integer> idList){
       Object[] ob=new Object[idList.size()];
       Integer j=0;
        for (Integer i:idList){
            ob[j]=i;
            j++;
        }
        return ob;
    }
    /*
     * List<String> 转换成 Object数组
     * */
    public static Object[] sqlStrparObject(List<String> stateList){
        Object[] ob=new Object[stateList.size()];
        Integer j=0;
        for (String i:stateList){
            ob[j]=i;
            j++;
        }
        return ob;
    }
    /*
    * 把Integer类型的数组拆成Integer类型的集合
    * */
    public static List<Integer> parListInt(Integer[] integer){
        List<Integer> list=new ArrayList<Integer>();
        for (Integer i:integer){
            list.add(i);
        }
        return list;
    }
    /*
     * 把String类型的数组拆成String类型的集合
     * */
    public static List<String> parListStr(String[] integer){
        List<String> list=new ArrayList<String>();
        for (String i:integer){
            list.add(i);
        }
        return list;
    }
    /*
    * 比较两个数字
    * */
    public static boolean Msz(Integer num1,Integer num2){
        if(num1<num2){
            return false;
        }else{
            return true;
        }
    }
/*
* 把集合转换成数组的方法
* */
    public static Integer[] pIn(List<Integer> list){
        Integer[] ob=new Integer[list.size()];
        Integer j=0;
        for (Integer i:list){
            ob[j]=i;
            j++;
        }
        return ob;
    }
    /*
    * 两个集合比较
    * 只有超出范围就false
    * 合理就true
    * */
    public static boolean PK(List<Integer> list1,List<Integer> list2){
        Integer[] ins1=pIn(list1);
        Integer[] ins2=pIn(list2);
        boolean bl=true;
        for (Integer i=0;i<ins1.length;i++){
            if(ins1[i]<=ins2[i]){
                bl=true;
                continue;
            }else{
                bl=false;
                break;
            }
        }
        return bl;
    }

    /*
     * 把1-2-3-4格式的字符串转成Integer集合
     * */
    public static List<Integer> aigInfo(String strList) {
        Integer[] integers=split2(strList);
        List<Integer> list=parListInt(integers);
        return list;
    }




}


