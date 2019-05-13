package com.xsupport.dao.measure;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.measure.DisplacementEvery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集单个记录
 */
@Mapper
public interface DisplacementEveryDao extends MyMapper<DisplacementEvery> {

    List<DisplacementEvery> findByGroupId();

    DisplacementEvery findByGroupIdAndPoint(@Param(value = "groupId") String groupId,@Param(value = "point") Integer point);

}