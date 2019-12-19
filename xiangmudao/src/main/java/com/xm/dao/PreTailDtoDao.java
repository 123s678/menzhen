package com.xm.dao;

import com.xm.entity.dto.PreTailDto;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PreTailDtoDao {
    List<PreTailDto> getAllTailList(@Param("pid") int pid);
    List<PreTailDto> getAllTailByIds(List<Integer> list);
}
