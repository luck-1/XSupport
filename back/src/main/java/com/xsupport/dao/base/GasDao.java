package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Gas;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
@Mapper
public interface GasDao extends MyMapper<Gas> {

  
}