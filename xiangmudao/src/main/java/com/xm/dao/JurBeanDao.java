package com.xm.dao;

import com.xm.entity.bean.JurBean;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface JurBeanDao {
    public List<JurBean> query(@Param("id") int id,@Param("pid") int pid);
}
