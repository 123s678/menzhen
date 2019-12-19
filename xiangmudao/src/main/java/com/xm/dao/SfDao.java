package com.xm.dao;

import org.apache.ibatis.annotations.Param;

public interface SfDao {
    public int getYesNoCount(@Param("id") int id);
    public double getYesNoSum(@Param("id") int id);
    public int getYesYesCount(@Param("id") int id);
    public double getYesYesSum(@Param("id") int id);
    public int getNoCount(@Param("id") int id);
    public double getNoSum(@Param("id") int id);
}
