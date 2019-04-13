package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.TempService;
import com.xsupport.dao.base.TempDao;
import com.xsupport.jpa.base.TempMapper;
import com.xsupport.model.base.Temp;

/**
 * @author lxc
 * @date 2019/4/13
 * @description temp
 */
@Service
public class TempServiceImpl extends AbstractService<Temp> implements TempService  {

	@Resource
	private TempDao tempDao;

    @Resource
    private TempMapper tempMapper;


	
}