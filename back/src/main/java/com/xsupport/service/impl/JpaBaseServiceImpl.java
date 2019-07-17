package com.xsupport.service.impl;

import com.xsupport.service.JpaBaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import java.io.Serializable;

/**
 * @author joker
 * @date 2019/7/16 18:11
 * @description 实现BaseJpaService接口的方法，继承BaseJpaService的接口的实现类可直接继承这个类，获取JpaRepository实例。
 */
public class JpaBaseServiceImpl<E,ID extends Serializable> implements JpaBaseService<E,ID> {

    /**
     * 这里必须使用@Autowired注入，使用@Resource会报错
     */
    @Autowired
    private JpaRepository<E, ID> jpaRepository;

    /**
     * 实现的方法，获取JpaRepository实例
     * @return 不同类型的JpaRepository实例
     */
    @Override
    public JpaRepository<E, ID> getRepository() {
        return jpaRepository;
    }
}
