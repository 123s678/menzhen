package com.xm.dao;

import com.xm.entity.Juristitle;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JurTitleDao {
    public List<Juristitle> queryByEmployeeId(@Param("id") int id);
    public int updateMax0(List<Integer> list);
    public int updateMin1(List<Integer> list);
}
