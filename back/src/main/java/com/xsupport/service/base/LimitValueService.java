package com.xsupport.service.base;

import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.base.LimitValue;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 阈值
 */
@Component
public interface LimitValueService extends Service<LimitValue> {

    void saveInfo(LimitValue limitValue);

}