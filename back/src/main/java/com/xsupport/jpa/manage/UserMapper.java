package com.xsupport.jpa.manage;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.base.User;

import java.util.List;

public interface UserMapper extends MyBaseJpaDao<User,String> {

    User findUserByUsername(String username);

    void deleteUsersByIdIn(List<String> idList);

}