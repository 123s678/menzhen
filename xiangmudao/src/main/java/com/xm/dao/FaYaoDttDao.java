package com.xm.dao;

import com.xm.entity.dtt.FaYaoDtt;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FaYaoDttDao {
    List<FaYaoDtt> getFaYao(@Param("prescriptionid") int prescriptionid);
    int updateJn(@Param("cunrushu") int cunrushu,@Param("id") int id);
    int updateJi(@Param("cunrushu") int cunrushu,@Param("id") int id);
}
