package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.User;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Mapper
public interface UserDao  extends MyMapper<User> {

  
}