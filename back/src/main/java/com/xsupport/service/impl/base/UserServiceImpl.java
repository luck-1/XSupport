package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import com.xsupport.dao.base.UserDao;
import com.xsupport.jpa.jpa.UserMapper;
import com.xsupport.model.http.ChangePasswordParam;
import com.xsupport.model.http.LoginParam;
import com.xsupport.system.exception.CustomException;
import com.xsupport.system.returncode.ReturnCode;
import com.xsupport.util.SysUtil;
import org.springframework.stereotype.Service;
import com.xsupport.service.base.UserService;
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
	private UserMapper userMapper;

	@Resource
	private UserDao userDao;

	@Override
	public void login(LoginParam loginParam){
		User user = userMapper.findUserByUsername(loginParam.getUsername());
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

	@Override
	public void saveInfo(User user){
		//保存
		if(user.getId() == null || "".equals(user.getId())){
			user.setId(SysUtil.getUuid());
			userDao.insert(user);
		}else{
			//修改
			Integer count = userDao.findCountByUsernameAndId(user.getId(),user.getUsername());
			if(count > 0){
				throw new CustomException(new ReturnCode.Builder().failed().msg("该用户名已存在！").build());
			}
			userDao.updateByPrimaryKey(user);
		}
	}
	
}