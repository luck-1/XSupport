package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.TemperatureService;
import com.xsupport.dao.base.TemperatureDao;
import com.xsupport.jpa.base.TemperatureMapper;
import com.xsupport.model.base.Temperature;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
@Service
public class TemperatureServiceImpl extends AbstractService<Temperature> implements TemperatureService  {

	@Resource
	private TemperatureDao temperatureDao;

    @Resource
    private TemperatureMapper temperatureMapper;

    @Override
    public List<Temperature> findAll(){
        return temperatureDao.findAll();
    }

	
}