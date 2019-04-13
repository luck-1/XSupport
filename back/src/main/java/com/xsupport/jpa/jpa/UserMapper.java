package com.xsupport.jpa.jpa;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.base.User;

public interface UserMapper extends MyBaseJpaDao<User,String> {

    User findUserByUsername(String username);

}
