package com.xsupport.service.impl.base;

import javax.annotation.Resource;

import com.xsupport.jpa.base.UserMapper;
import com.xsupport.model.base.User;
import com.xsupport.system.exception.CustomException;
import com.xsupport.system.returncode.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.SystemWarningService;
import com.xsupport.dao.base.SystemWarningDao;
import com.xsupport.jpa.base.SystemWarningMapper;
import com.xsupport.model.base.SystemWarning;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author lxc
 * @date 2019/4/21
 * @description 系统异常
 */
@Service
public class SystemWarningServiceImpl extends AbstractService<SystemWarning> implements SystemWarningService {

    @Resource
    private SystemWarningDao systemWarningDao;

    @Resource
    private SystemWarningMapper systemWarningMapper;

    @Resource
    private UserMapper userMapper;

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void changeState(String id, Integer state, String userId) {
        User user = userMapper.getOne(userId);
        if (user == null){
            throw new CustomException(new ReturnCode.Builder().failed().msg("操作用户不存在！").build());
        }
        if (user.getIsForbidden()){
            throw new CustomException(new ReturnCode.Builder().failed().msg("用户已被禁用！").build());
        }
        SystemWarning systemWarning = systemWarningMapper.getOne(id);
        if (systemWarning == null) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("该记录不存在！").build());
        }
        systemWarning.setOptionUser(user.getName());
        systemWarning.setExceptionState(state);
        systemWarningMapper.save(systemWarning);
    }

}