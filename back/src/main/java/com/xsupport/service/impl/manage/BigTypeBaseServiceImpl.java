package com.xsupport.service.impl.manage;

import javax.annotation.Resource;

import com.xsupport.service.impl.JpaBaseServiceImpl;
import org.springframework.stereotype.Service;
import com.xsupport.service.manage.BigTypeBaseService;
import com.xsupport.dao.manage.BigTypeDao;
import com.xsupport.jpa.manage.BigTypeMapper;
import com.xsupport.model.manage.BigType;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 类型
 */
@Service
public class BigTypeBaseServiceImpl extends JpaBaseServiceImpl<BigType,String> implements BigTypeBaseService {

	@Resource
	private BigTypeDao bigTypeDao;

    @Resource
    private BigTypeMapper bigTypeMapper;

}