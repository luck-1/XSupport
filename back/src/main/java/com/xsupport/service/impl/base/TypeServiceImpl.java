package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.TypeService;
import com.xsupport.dao.base.TypeDao;
import com.xsupport.jpa.base.TypeMapper;
import com.xsupport.model.base.Type;

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


	
}