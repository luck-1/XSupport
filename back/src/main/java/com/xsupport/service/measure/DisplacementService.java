package com.xsupport.service.measure;

import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.measure.Displacement;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@Component
public interface DisplacementService extends Service<Displacement> {

    Displacement findNewestData();


}