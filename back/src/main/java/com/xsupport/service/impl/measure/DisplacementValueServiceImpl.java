package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.measure.DisplacementValueService;
import com.xsupport.dao.measure.DisplacementValueDao;
import com.xsupport.jpa.measure.DisplacementValueMapper;
import com.xsupport.model.measure.DisplacementValue;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移值
 */
@Service
public class DisplacementValueServiceImpl extends AbstractService<DisplacementValue> implements DisplacementValueService  {

	@Resource
	private DisplacementValueDao displacementValueDao;

    @Resource
    private DisplacementValueMapper displacementValueMapper;


	
}