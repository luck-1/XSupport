package com.xsupport.jpa.manage;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.manage.Type;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
public interface TypeMapper extends MyBaseJpaDao<Type,String> {

    Type findTypeById(String id);

    Type findTypeByBigTypeAndSubIndex(Integer bigYype,Integer subIndex);

    List<Type> findTypesByBigType(Integer bigType);

}