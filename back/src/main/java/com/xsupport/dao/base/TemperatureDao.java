package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Temperature;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
@Mapper
public interface TemperatureDao extends MyMapper<Temperature> {

  
}