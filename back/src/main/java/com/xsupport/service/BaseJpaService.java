package com.xsupport.service;

import com.xsupport.jpa.MyBaseJpaDao;
import java.io.Serializable;

public interface BaseJpaService<E,ID extends Serializable> {

    MyBaseJpaDao<E, ID> getRepository();

    default void deleteByPrimary(){}

}
