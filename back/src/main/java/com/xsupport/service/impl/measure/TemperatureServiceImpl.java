package com.xsupport.service.impl.measure;

import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.measure.TemperatureService;
import com.xsupport.dao.measure.TemperatureDao;
import com.xsupport.jpa.measure.TemperatureMapper;
import com.xsupport.model.measure.Temperature;

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

//    @Override
    public void fi(){
         temperatureMapper.save(new Temperature());
         

    }

    @Override
    public Page<Temperature> findAll(Pageable pageable){
        return temperatureMapper.findAll(pageable);
    }


	
}