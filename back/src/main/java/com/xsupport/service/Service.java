package com.xsupport.service;

import com.xsupport.system.result.ReturnCode;
import org.apache.ibatis.exceptions.TooManyResultsException;

import java.util.List;

@org.springframework.stereotype.Service
public interface Service<T> {

    void save(T model);

    void save(List<T> models);

    void deleteById(String id);

    ReturnCode deleteByIds(String ids);

    void update(T model);

    T findById(String id);

    T findBy(String fieldName, Object value) throws TooManyResultsException;

    List<T> findByIds(String ids);

    List<T> findAll();

}
