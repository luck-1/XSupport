package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.measure.DisplacementEveryService;
import com.xsupport.dao.measure.DisplacementEveryDao;
import com.xsupport.jpa.measure.DisplacementEveryMapper;
import com.xsupport.model.measure.DisplacementEvery;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集单个记录
 */
@Service
public class DisplacementEveryServiceImpl extends AbstractService<DisplacementEvery> implements DisplacementEveryService  {

	@Resource
	private DisplacementEveryDao displacementEveryDao;

    @Resource
    private DisplacementEveryMapper displacementEveryMapper;


	
}