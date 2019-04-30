package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Temperature;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
@Mapper
public interface TemperatureDao extends MyMapper<Temperature> {

    List<Temperature> findAll();
}