package com.xsupport.service.impl;

import com.xsupport.service.BaseJpaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.JpaRepository;
import java.io.Serializable;

/**
 * @author joker
 * @date 2019/7/16 18:11
 * @description
 */
public class BaseJpaServiceImpl<E,ID extends Serializable> implements BaseJpaService<E,ID> {

    @Autowired
    private JpaRepository<E, ID> jpaRepository;

    @Override
    public JpaRepository<E, ID> getRepository() {
        return jpaRepository;
    }
}
