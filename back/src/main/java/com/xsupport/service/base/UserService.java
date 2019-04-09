package com.xsupport.service.base;

import com.xsupport.model.http.LoginParam;
import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.base.User;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Component
public interface UserService extends Service<User> {

    void login(LoginParam loginParam);

}