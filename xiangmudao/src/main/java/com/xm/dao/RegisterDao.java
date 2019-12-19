package com.xm.dao;

import com.xm.entity.Register;
import org.apache.ibatis.annotations.Param;

public interface RegisterDao {
    public String NewRegister();
    public boolean addRegister(Register register);
    public int getExt(@Param("registercode") String registercode);//是否存在
    public Register getOne(@Param("registercode") String registercode);//查一条
    public boolean jiuZhen(@Param("registercode") String registercode);
    public boolean tuiHao(@Param("registercode") String registercode);
    public Register selectGuaHaoNew();//查找最新病人信息
    /*
    * 查找挂号状态497
    * */
    public int select497(@Param("id") int id);
    /*
    * 修改为已退款
    * */
    public int update499(@Param("id") int id);
    /*
     * 修改为已收费
     * */
    public int update496(@Param("id") int id);
    /*
    * 查询挂号状态
    * */
    public int select496(@Param("id") int id);
    /*
    * 修改为已发药
    * */
    public int update497(@Param("id") int id);
    /*
    * 修改为已退药
    * */
    public int update498(@Param("id") int id);
}
