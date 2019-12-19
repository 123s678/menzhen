package com.xm.dao;



import com.xm.entity.dto.AttrDto;

import java.util.List;

public interface AttrDtoDao {
    /*
    * 婚姻状况
    * */
    List<AttrDto> getAttr3();
    /*
    * 医保类型
    * */
    List<AttrDto> getAttr8();
    /*
    * 参保类别
    * */
    List<AttrDto> getAttr20();
    /*
    * 处方类型
    * */
    List<AttrDto> getAttr15();
    /*
     * 处方分类
     * */
    List<AttrDto> getAttr16();
    /*
     * 用药方式
     * */
    List<AttrDto> getAttr24();
    /*
     * 用药频率
     * */
    List<AttrDto> getAttr25();
    /*
    * 职务
    * */
    List<AttrDto> getAttr4();
    /*
     * 职称
     * */
    List<AttrDto> getAttr5();
    /*
    * 学历
    * */
    List<AttrDto> getAttr1();
    /*
     * 政治面貌
     * */
    List<AttrDto> getAttr2();
    /*
     * 学习专业
     * */
    List<AttrDto> getAttr10();
}
