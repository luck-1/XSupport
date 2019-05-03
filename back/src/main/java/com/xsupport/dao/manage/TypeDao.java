package com.xsupport.dao.manage;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.manage.Type;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@Mapper
public interface TypeDao extends MyMapper<Type> {



}