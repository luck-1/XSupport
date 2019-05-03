package com.xsupport.service.measure;

import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.measure.Soak;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 浸润测量
 */
@Component
public interface SoakService extends Service<Soak> {

    Soak findNewestData();

}