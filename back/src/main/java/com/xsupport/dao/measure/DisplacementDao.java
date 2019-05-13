package com.xsupport.dao.measure;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.measure.Displacement;
import org.apache.ibatis.annotations.Select;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@Mapper
public interface DisplacementDao extends MyMapper<Displacement> {

    Displacement findNewestData();

    Displacement findById(String id);

}