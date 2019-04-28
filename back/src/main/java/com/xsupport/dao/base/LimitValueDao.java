package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.LimitValue;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 阈值
 */
@Mapper
public interface LimitValueDao extends MyMapper<LimitValue> {

  
}