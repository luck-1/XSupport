package com.xsupport.dao.manage;

import org.apache.ibatis.annotations.Mapper;
import com.xsupport.dao.MyMapper;
import com.xsupport.model.manage.User;
import org.apache.ibatis.annotations.Param;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Mapper
public interface UserDao extends MyMapper<User> {

    Integer findCountByUsernameAndId(@Param("username") String username,@Param("id") String id);

    List<User> findByConditions(@Param("name") String name,@Param("phone") String phone);
}