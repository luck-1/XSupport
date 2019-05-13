package com.xsupport.dao.measure;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.measure.PointEnum;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移测量点
 */
@Mapper
public interface PointEnumDao extends MyMapper<PointEnum> {

  
}