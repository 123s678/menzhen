package com.xm2.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Employee2 implements java.io.Serializable{

  private Integer id;
  private String employeecode;
  private String employeename;
  private String psw;
  private String pinyincode;
  private String wubicode;
  private Integer jobtitleid;
  private Integer positionid;
  private Integer sex;
  private String tel;
  private Integer departmentid;
  private String email;
  private String idcard;
  private String address;
  private String birthday;
  private String inductiontime;
  private Integer maxeducationid;
  private Integer majorid;
  private Integer politicsstatusid;
  private String picture;
  private String note;
  private Integer isvalid;
  private Integer isoperator;
  private Integer roleid;
}
