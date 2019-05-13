package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.measure.PointEnumService;
import com.xsupport.dao.measure.PointEnumDao;
import com.xsupport.jpa.measure.PointEnumMapper;
import com.xsupport.model.measure.PointEnum;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移测量点
 */
@Service
public class PointEnumServiceImpl extends AbstractService<PointEnum> implements PointEnumService {

	@Resource
	private PointEnumDao pointEnumDao;

    @Resource
    private PointEnumMapper pointEnumMapper;


	
}