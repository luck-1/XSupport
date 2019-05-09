package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.measure.DisplacementGroupService;
import com.xsupport.dao.measure.DisplacementGroupDao;
import com.xsupport.jpa.measure.DisplacementGroupMapper;
import com.xsupport.model.measure.DisplacementGroup;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@Service
public class DisplacementGroupServiceImpl extends AbstractService<DisplacementGroup> implements DisplacementGroupService  {

	@Resource
	private DisplacementGroupDao displacementGroupDao;

    @Resource
    private DisplacementGroupMapper displacementGroupMapper;


	
}