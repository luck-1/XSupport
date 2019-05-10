package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.measure.DisplacementPointEnumService;
import com.xsupport.dao.measure.DisplacementPointEnumDao;
import com.xsupport.jpa.measure.DisplacementPointEnumMapper;
import com.xsupport.model.measure.DisplacementPointEnum;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移测量点
 */
@Service
public class DisplacementPointEnumServiceImpl extends AbstractService<DisplacementPointEnum> implements DisplacementPointEnumService  {

	@Resource
	private DisplacementPointEnumDao displacementPointEnumDao;

    @Resource
    private DisplacementPointEnumMapper displacementPointEnumMapper;


	
}