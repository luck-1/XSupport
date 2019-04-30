package com.xsupport.service.impl.base;

import javax.annotation.Resource;

import com.xsupport.system.exception.CustomException;
import com.xsupport.system.returncode.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.LimitValueService;
import com.xsupport.dao.base.LimitValueDao;
import com.xsupport.jpa.base.LimitValueMapper;
import com.xsupport.model.base.LimitValue;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 阈值
 */
@Service
public class LimitValueServiceImpl extends AbstractService<LimitValue> implements LimitValueService  {

	@Resource
	private LimitValueDao limitValueDao;

    @Resource
    private LimitValueMapper limitValueMapper;

    @Override
    public void saveInfo(LimitValue limitValue){
        LimitValue findLimitValue = limitValueMapper.findLimitValueById(limitValue.getId());
        if(findLimitValue == null){
            throw new CustomException(new ReturnCode.Builder().failed().msg("该类型阈值不存在！").build());
        }
        findLimitValue.setLimitValue(limitValue.getLimitValue());
        limitValueMapper.save(findLimitValue);
    }

	
}