package com.xsupport.service.impl.base;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.base.HumidityService;
import com.xsupport.dao.base.HumidityDao;
import com.xsupport.jpa.base.HumidityMapper;
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