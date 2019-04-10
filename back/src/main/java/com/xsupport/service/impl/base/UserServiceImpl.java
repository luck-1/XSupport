package com.xsupport.service.impl.base;

import javax.annotation.Resource;

import com.xsupport.model.http.ChangePasswordParam;
import com.xsupport.model.http.LoginParam;
import com.xsupport.system.exception.CustomException;
import com.xsupport.system.run.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.base.UserService;
import com.xsupport.dao.base.UserDao;
import com.xsupport.service.AbstractService;
import com.xsupport.model.base.User;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 
 */
@Service
public class UserServiceImpl extends AbstractService<User> implements UserService  {

	@Resource
	private UserDao userDao;

	@Override
	public void login(LoginParam loginParam){
		User user = userDao.selectByPrimaryKey(loginParam.getUsername());
		if(user == null){
			throw new CustomException(new ReturnCode.Builder().failed().msg("用户不存在！").build());
		}
		if(! loginParam.getPossword().equals(user.getPassword())){
			throw new CustomException(new ReturnCode.Builder().failed().msg("密码错误！").build());
		}
		if(user.getIsForbidden() ){
			throw new CustomException(new ReturnCode.Builder().failed().msg("该用户已被禁用！").build());
		}
	}

	@Override
	public void changePassword(ChangePasswordParam changePasswordParam){
		User user = userDao.selectByPrimaryKey(changePasswordParam.getId());
		if(user == null){
			throw new CustomException(new ReturnCode.Builder().failed().msg("用户不存在！").build());
		}
		if(! changePasswordParam.getOldPossword().equals(user.getPassword())){
			throw new CustomException(new ReturnCode.Builder().failed().msg("原密码不正确！").build());
		}
		user.setPassword(changePasswordParam.getNewPossword());
		userDao.updateByPrimaryKey(user);
	}
	
}