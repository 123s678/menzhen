package com.xm.dao;

import com.xm.entity.Patient;
import org.apache.ibatis.annotations.Param;

public interface PatientDao {
    int isPat(@Param("cardcode") String cardcode);//是否存在
    Patient ontPat(@Param("cardcode") String cardcode);//查找一条
    String selectMaxPat();//查询最大卡号
    boolean insertPat(Patient patient);//添加卡
    Patient selectNewPat();//查询最新的数据
    int patientId(@Param("patientname") String patientname);//查询id
    Patient getWithPatient(@Param("id") int id);
    String getPatientNameByRegisterCode(@Param("registercode") String registercode);
}
