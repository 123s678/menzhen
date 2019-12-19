package com.xm.dao;

import com.xm.entity.dto.PreDto;

import java.util.List;
import java.util.Map;

public interface PreDtoDao {
    List<PreDto> getAllPreList(Map<String,Object> map);
    int getCount(Map<String,Object> map);
}
