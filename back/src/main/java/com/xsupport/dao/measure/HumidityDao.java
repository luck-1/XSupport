package com.xsupport.dao.measure;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.measure.Humidity;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/29
 * @description 湿度监控
 */
@Mapper
public interface HumidityDao extends MyMapper<Humidity> {

    List<Humidity> findAll();

    List<Humidity> exportInfo();
}