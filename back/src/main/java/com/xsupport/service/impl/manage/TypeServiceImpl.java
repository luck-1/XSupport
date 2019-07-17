package com.xsupport.service.impl.manage;

import javax.annotation.Resource;

import com.xsupport.service.impl.JpaBaseServiceImpl;
import com.xsupport.system.exception.CustomException;
import com.xsupport.system.result.ReturnCode;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.manage.TypeService;
import com.xsupport.dao.manage.TypeDao;
import com.xsupport.jpa.manage.TypeMapper;
import com.xsupport.model.manage.Type;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@Service
public class TypeServiceImpl extends JpaBaseServiceImpl<Type,String> implements TypeService  {

	@Resource
	private TypeDao typeDao;

    @Resource
    private TypeMapper typeMapper;

    @Override
    public void updateLimitValue(Type type){
        Type findType = typeMapper.findTypeByBigTypeAndSubIndex(type.getBigType(),type.getSubIndex());
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

    @Override
    public Type findTypeByBigTypeAndSubIndex(Integer bigType,Integer subIndex){
        return typeMapper.findTypeByBigTypeAndSubIndex(bigType,subIndex);
    }



}