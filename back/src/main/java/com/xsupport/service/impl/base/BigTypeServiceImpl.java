package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.BigTypeService;
import com.xsupport.dao.base.BigTypeDao;
import com.xsupport.jpa.base.BigTypeMapper;
import com.xsupport.model.base.BigType;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 类型
 */
@Service
public class BigTypeServiceImpl extends AbstractService<BigType> implements BigTypeService  {

	@Resource
	private BigTypeDao bigTypeDao;

    @Resource
    private BigTypeMapper bigTypeMapper;


	
}