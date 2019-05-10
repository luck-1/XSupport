package com.xsupport.service.impl.manage;

import javax.annotation.Resource;

import com.xsupport.jpa.manage.UserMapper;
import com.xsupport.model.manage.User;
import com.xsupport.system.exception.CustomException;
import com.xsupport.system.result.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.manage.SysWarnService;
import com.xsupport.dao.manage.SysWarnDao;
import com.xsupport.jpa.manage.SysWarnMapper;
import com.xsupport.model.manage.SysWarn;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author lxc
 * @date 2019/5/1
 * @description 系统异常
 */
@Service
public class SysWarnServiceImpl extends AbstractService<SysWarn> implements SysWarnService  {

	@Resource
	private SysWarnDao sysWarnDao;

    @Resource
    private SysWarnMapper sysWarnMapper;

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
        SysWarn systemWarning = sysWarnMapper.getOne(id);
        if (systemWarning == null) {
            throw new CustomException(new ReturnCode.Builder().failed().msg("该记录不存在！").build());
        }
        systemWarning.setOptionUser(user.getName());
        systemWarning.setExceptionState(state);
        sysWarnMapper.save(systemWarning);
    }

    @Override
    public void updateRemark(String id,String remark){
        SysWarn sysWarn = sysWarnMapper.getOne(id);
        if(sysWarn == null){
            throw new CustomException(new ReturnCode.Builder().failed().msg("该记录不存在！").build());
        }
        sysWarn.setRemark(remark);
        sysWarnMapper.save(sysWarn);
    }

    public List<SysWarn> findAll(){
        return sysWarnDao.findAll();
    }
	
}