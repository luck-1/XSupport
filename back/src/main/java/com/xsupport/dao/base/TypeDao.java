package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Type;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@Mapper
public interface TypeDao extends MyMapper<Type> {

  
}