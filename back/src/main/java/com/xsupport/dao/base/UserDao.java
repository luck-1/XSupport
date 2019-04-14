package com.xsupport.dao.base;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.base.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Primary;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Mapper
@Primary
public interface UserDao extends MyMapper<User> {

    Integer findCountByUsernameAndId(@Param("username") String username,@Param("id") String id);
}