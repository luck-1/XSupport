package com.xsupport.jpa.measure;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.measure.Temperature;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
public interface TemperatureMapper extends MyBaseJpaDao<Temperature, String> {

    @Override
    Page<Temperature> findAll(Pageable pageable);


}