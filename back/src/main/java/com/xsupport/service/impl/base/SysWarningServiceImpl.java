package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.SysWarningService;
import com.xsupport.dao.base.SysWarningDao;
import com.xsupport.jpa.base.SysWarningMapper;
import com.xsupport.model.base.SysWarning;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 系统异常
 */
@Service
public class SysWarningServiceImpl extends AbstractService<SysWarning> implements SysWarningService  {

	@Resource
	private SysWarningDao sysWarningDao;

    @Resource
    private SysWarningMapper sysWarningMapper;


	
}