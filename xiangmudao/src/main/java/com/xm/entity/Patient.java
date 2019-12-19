package com.xm.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Patient implements java.io.Serializable {

  private Integer id;
  private String cardcode;
  private String patientname;
  private Integer sex;
  private Integer maritalstatusid;
  private String job;
  private Integer patienttypeid;
  private Integer age;
  private Integer insuretypeid;
  private String medicarecode;
  private String tel;
  private String address;
  private String taboo;
  private String drugallergyhistory;
  private String identity;
}
