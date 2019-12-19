package com.xm1.dao;
import com.xm.entity.Attributedetail;
import com.xm1.entity.Attributedetail1;

import java.util.List;

public interface AttributedetailDao1 {
    List<Attributedetail1> getAtttrAll();//状态
    List<Attributedetail1> getAtttrAll2();//药品类型
    List<Attributedetail1> getAtttrAll3();//药品剂型
    List<Attributedetail1> getAtttrAll4(); //医保类别
}
