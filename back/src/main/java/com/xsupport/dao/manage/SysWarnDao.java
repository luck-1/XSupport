package com.xsupport.dao.manage;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.manage.SysWarn;

import java.util.List;

/**
 * @author lxc
 * @date 2019/5/1
 * @description 系统异常
 */
@Mapper
public interface SysWarnDao extends MyMapper<SysWarn> {

    List<SysWarn> exportInfo();

    List<SysWarn> findAll();
}