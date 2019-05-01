package com.xsupport.service.impl.base;

import javax.annotation.Resource;

import com.xsupport.system.exception.CustomException;
import com.xsupport.system.returncode.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.TypeService;
import com.xsupport.dao.base.TypeDao;
import com.xsupport.jpa.base.TypeMapper;
import com.xsupport.model.base.Type;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@Service
public class TypeServiceImpl extends AbstractService<Type> implements TypeService  {

	@Resource
	private TypeDao typeDao;

    @Resource
    private TypeMapper typeMapper;

    @Override
    public void updateLimitValue(Type type){
        Type findType = typeMapper.findTypeById(type.getId());
        if(findType == null){
            throw new CustomException(new ReturnCode.Builder().failed().msg("该类型阈值不存在！").build());
        }
        findType.setLimitValue(type.getLimitValue());
        typeMapper.save(findType);
    }

    @Override
    public List<Type> findTypesByBigType(Integer bigType){
        return typeMapper.findTypesByBigType(bigType);
    }
}