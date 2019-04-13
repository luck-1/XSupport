package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Temp;

/**
 * @author lxc
 * @date 2019/4/13
 * @description temp
 */
@Mapper
public interface TempDao extends MyMapper<Temp> {

  
}