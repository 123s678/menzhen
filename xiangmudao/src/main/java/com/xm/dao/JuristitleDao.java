package com.xm.dao;

import com.xm.entity.Juristitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JuristitleDao {
    Juristitle newJuristitle();
    int addOb1(Juristitle juristitle);
    int addOb2(Juristitle juristitle);
    int addOb3(Juristitle juristitle);
    int addOb4(Juristitle juristitle);
    int addOb5(Juristitle juristitle);
    int addOb6(Juristitle juristitle);
    int addOb7(Juristitle juristitle);
    int addOb8(Juristitle juristitle);
    int addOb9(Juristitle juristitle);
    int addOb10(Juristitle juristitle);
    int addOb11(Juristitle juristitle);
    int addOb12(Juristitle juristitle);
    int addOb13(Juristitle juristitle);
    int addOb14(Juristitle juristitle);
    int addOb15(Juristitle juristitle);
    int addOb16(Juristitle juristitle);
    int addOb17(Juristitle juristitle);
    int addOb18(Juristitle juristitle);
    int addOb19(Juristitle juristitle);
    int addOb20(Juristitle juristitle);
    int addOb21(Juristitle juristitle);
    List<Juristitle> getAllByEmployeeid(@Param("employeeid") int employeeid);
    int removeJuristitle(List<Integer> list);
}
