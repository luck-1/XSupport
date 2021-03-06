package com.xsupport.service.measure;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.measure.Temperature;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
@Component
public interface TemperatureService extends Service<Temperature> {

    Page<Temperature> findAll(Pageable pageable);

}