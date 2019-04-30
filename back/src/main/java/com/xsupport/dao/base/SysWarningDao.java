package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.SysWarning;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 系统异常
 */
@Mapper
public interface SysWarningDao extends MyMapper<SysWarning> {

  
}