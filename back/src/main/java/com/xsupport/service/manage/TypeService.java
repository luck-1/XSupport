package com.xsupport.service.manage;

import com.xsupport.model.manage.Type;
import com.xsupport.service.JpaBaseService;
import org.springframework.stereotype.Component;
import com.xsupport.service.Service;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@Component
public interface TypeService extends JpaBaseService<Type,String> {

    void updateLimitValue(Type type);

    Type findTypeByBigTypeAndSubIndex(Integer bigType,Integer subIndex);

    List<Type> findTypesByBigType(Integer bigType);
}