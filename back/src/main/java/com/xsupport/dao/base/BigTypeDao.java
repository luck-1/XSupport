package com.xsupport.dao.base;

import org.apache.ibatis.annotations.*;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.BigType;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 类型
 */
@Mapper
public interface BigTypeDao extends MyMapper<BigType> {

}