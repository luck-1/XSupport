package com.xsupport.service;

import com.xsupport.dao.MyMapper;
import com.xsupport.system.returncode.ReturnCode;
import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Condition;
import java.lang.reflect.Field;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;

@Service
public abstract class AbstractService<T> {

    @Autowired
    protected MyMapper<T> mapper;

    private Class<T> modelClass;

    public AbstractService() {
        ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
        modelClass = (Class<T>) pt.getActualTypeArguments()[0];
    }

    public void save(T model) { mapper.insertSelective(model);
    }

    public void save(List<T> models) {
        mapper.insertList(models);
    }

    public void deleteById(String id) {
        mapper.deleteByPrimaryKey(id);
    }

    public ReturnCode deleteByIds(String ids) {
        mapper.deleteByIds(ids);
        return null;
    }

    public void update(T model) {
        mapper.updateByPrimaryKeySelective(model);
    }

    public T findById(String id) {
        return mapper.selectByPrimaryKey(id);
    }

    @SuppressWarnings("unchecked")
	public T findBy(String fieldName, Object value) throws TooManyResultsException {
        try {
            T model = modelClass.newInstance();
            Field field = modelClass.getDeclaredField(fieldName);
            field.setAccessible(true);
            field.set(model, value);
            return mapper.selectOne(model);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException("未知错误!");
        }
    }

    /**
     * 按map查询
     * @param map
     * @return
     * @throws TooManyResultsException
     */
    public List<T> findByList(Map<String,Object> map) throws TooManyResultsException {
        try {
            T model = modelClass.newInstance();
            map.forEach((k,v)->{
                Field field = null;
                try {
                    field = modelClass.getDeclaredField(k);
                    field.setAccessible(true);
                    field.set(model, v);
                } catch (NoSuchFieldException | IllegalAccessException e) {
                    e.printStackTrace();
                }
            });

            return mapper.select(model);
        } catch (ReflectiveOperationException e) {
            throw new RuntimeException("未知错误");
        }
    }

    public List<T> findByIds(String ids) {
        return mapper.selectByIds(ids);
    }

    public List<T> findByCondition(Condition condition) {
        return mapper.selectByCondition(condition);
    }

    public List<T> findAll() {
        return mapper.selectAll();
    }
}
