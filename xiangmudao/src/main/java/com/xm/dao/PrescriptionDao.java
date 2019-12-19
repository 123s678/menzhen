package com.xm.dao;

import com.xm.entity.Prescription;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface PrescriptionDao {
    boolean addPre(Prescription prescription);
    boolean delPre(@Param("id") Integer id);
    Integer selectIdByCode(@Param("prescriptioncode") String prescriptioncode);
    Prescription selectPrescription(@Param("registerid") int registerid);
    List<Prescription> selectAllPrescription();
    /*
    * 通过处方号查询处方id
    * */
    int selectIdByPrescriptionCode(@Param("prescriptioncode") String prescriptioncode);
    /*
    * 通过处方号查询挂号id
    * */
    int selectRegisterId(@Param("prescriptioncode") String prescriptioncode);
    /*
    * 通过处方号查询挂号信息
    * */
    Prescription getPrescriptionWith(@RequestParam("prescriptioncode") String prescriptioncode);
    /*
    * 通过处方号查询是否存在
    * */
    int getPrescriptionWithCount(@RequestParam("prescriptioncode") String prescriptioncode);
}
