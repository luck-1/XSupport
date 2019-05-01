package com.xsupport.service.manage;

import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.manage.SysWarn;

/**
 * @author lxc
 * @date 2019/5/1
 * @description 系统异常
 */
@Component
public interface SysWarnService extends Service<SysWarn> {

    void changeState(String id,Integer state,String userId);
}