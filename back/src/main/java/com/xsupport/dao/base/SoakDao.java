package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Soak;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 浸润测量
 */
@Mapper
public interface SoakDao extends MyMapper<Soak> {

  
}