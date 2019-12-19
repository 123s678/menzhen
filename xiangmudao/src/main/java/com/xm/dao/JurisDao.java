package com.xm.dao;

import com.xm.entity.Juris;
import org.apache.ibatis.annotations.Param;

public interface JurisDao {
    Juris getNewJuris();//查询最新的juris
    int addJuris(Juris juris);
    int selectJurisIdByEmployeeid(@Param("employeeid") int employeeid);
    int removeJuris(@Param("employeeid") int employeeid);
}
