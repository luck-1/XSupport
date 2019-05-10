package com.xsupport.service.impl.manage;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.manage.BigTypeService;
import com.xsupport.dao.manage.BigTypeDao;
import com.xsupport.jpa.manage.BigTypeMapper;
import com.xsupport.model.manage.BigType;

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