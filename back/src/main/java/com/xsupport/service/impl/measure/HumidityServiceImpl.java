package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.measure.HumidityService;
import com.xsupport.dao.measure.HumidityDao;
import com.xsupport.jpa.measure.HumidityMapper;
import com.xsupport.model.base.Humidity;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/29
 * @description 湿度监控
 */
@Service
public class HumidityServiceImpl extends AbstractService<Humidity> implements HumidityService  {

	@Resource
	private HumidityDao humidityDao;

    @Resource
    private HumidityMapper humidityMapper;

    @Override
    public List<Humidity> findAll(){
        return humidityDao.findAll();
    }
	
}