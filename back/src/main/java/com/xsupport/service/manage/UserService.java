package com.xsupport.service.manage;

import com.github.pagehelper.PageInfo;
import com.xsupport.model.http.FindUserParam;
import com.xsupport.model.http.PasswordParam;
import com.xsupport.model.http.LoginParam;
import com.xsupport.model.manage.User;
import org.springframework.stereotype.Component;
import com.xsupport.service.Service;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Component
public interface UserService extends Service<User> {

    User login(LoginParam loginParam);

    void changePassword(PasswordParam passwordParam);

    void saveInfo(User user);

    void deleteUsersById(List<String> idList);

    PageInfo findByCondition(FindUserParam findUserParam);

    String changeForbiddenState(String id);

}