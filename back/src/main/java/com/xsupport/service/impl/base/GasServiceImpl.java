package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.GasService;
import com.xsupport.dao.base.GasDao;
import com.xsupport.jpa.base.GasMapper;
import com.xsupport.model.base.Gas;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
@Service
public class GasServiceImpl extends AbstractService<Gas> implements GasService  {

	@Resource
	private GasDao gasDao;

    @Resource
    private GasMapper gasMapper;


	
}