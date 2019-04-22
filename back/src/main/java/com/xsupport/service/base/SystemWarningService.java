package com.xsupport.service.base;

import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.base.SystemWarning;

/**
 * @author lxc
 * @date 2019/4/21
 * @description 系统异常
 */
@Component
public interface SystemWarningService extends Service<SystemWarning> {

    void changeState(String id,Integer state,String userId);

}