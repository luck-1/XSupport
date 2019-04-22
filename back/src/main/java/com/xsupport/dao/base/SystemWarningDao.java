package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.SystemWarning;

/**
 * @author lxc
 * @date 2019/4/21
 * @description 系统异常
 */
@Mapper
public interface SystemWarningDao extends MyMapper<SystemWarning> {

  
}