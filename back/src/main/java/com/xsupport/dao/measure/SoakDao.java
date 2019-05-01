package com.xsupport.dao.measure;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.Soak;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 浸润测量
 */
@Mapper
public interface SoakDao extends MyMapper<Soak> {

    @Select("SELECT * FROM soak ORDER BY createTime DESC LIMIT 1")
    Soak findNewestData();


}