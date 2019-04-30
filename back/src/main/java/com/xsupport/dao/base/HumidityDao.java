package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Humidity;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/29
 * @description 湿度监控
 */
@Mapper
public interface HumidityDao extends MyMapper<Humidity> {

    List<Humidity> findAll();
}