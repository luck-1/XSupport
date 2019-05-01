package com.xsupport.dao.measure;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Gas;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
@Mapper
public interface GasDao extends MyMapper<Gas> {

    Gas findNewestData(@Param("bigType") Integer bigType, @Param("subIndex")Integer subIndex);
}