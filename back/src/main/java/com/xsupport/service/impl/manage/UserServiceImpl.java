package com.xsupport.service.impl.manage;

import javax.annotation.Resource;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xsupport.dao.manage.UserDao;
import com.xsupport.jpa.manage.UserMapper;
import com.xsupport.model.http.FindUserParam;
import com.xsupport.model.http.PasswordParam;
import com.xsupport.model.http.LoginParam;
import com.xsupport.system.exception.CustomException;
import com.xsupport.system.returncode.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.manage.UserService;
import com.xsupport.service.AbstractService;
import com.xsupport.model.manage.User;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/10
 * @description
 */
@Service
public class UserServiceImpl extends AbstractService<User> implements UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private UserDao userDao;

    @Override
    public User login(LoginParam loginParam) {
        User user = userMapper.findUserByUsername(loginParam.getUsername());
        if (user == null) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("用户不存在！").build());
        }
        if (!user.getPassword().equals(loginParam.getPassword())) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("密码错误！").build());
        }
        if (user.getIsForbidden() == null ? false : user.getIsForbidden()) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("该用户已被禁用！").build());
        }
        return user;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changePassword(PasswordParam passwordParam) {
        User user = userDao.selectByPrimaryKey(passwordParam.getId());
        if (user == null) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("用户不存在！").build());
        }
        if (!passwordParam.getOldPassword().equals(user.getPassword())) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("原密码不正确！").build());
        }
        user.setPassword(passwordParam.getNewPassword());
        userDao.updateByPrimaryKey(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void saveInfo(User user) {
        Integer count = userDao.findCountByUsernameAndId(user.getUsername(), user.getId());
        if (count > 0) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("该用户名已存在！").build());
        }

        userMapper.save(user);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteUsersById(List<String> idList){
        userMapper.deleteUsersByIdIn(idList);
    }

    @Override
    public PageInfo findByCondition(FindUserParam findUserParam){
        PageHelper.startPage(findUserParam.getPageNum(),findUserParam.getPageSize());
        List<User> userList = userDao.findByConditions(findUserParam.getName(),findUserParam.getPhone());
        PageInfo pageInfo = new PageInfo(userList);
        return pageInfo;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public String changeForbiddenState(String id){
        User user = userMapper.getOne(id);
        if (user == null) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("用户不存在！").build());
        }
        Boolean isForbidden = user.getIsForbidden();
        user.setIsForbidden(isForbidden != null && !isForbidden);
        userMapper.save(user);
        return user.getIsForbidden() ? "禁用成功" : "启用成功" ;
    }

}