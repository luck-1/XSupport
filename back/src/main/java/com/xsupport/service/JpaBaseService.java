package com.xsupport.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import java.io.Serializable;
import java.util.List;
import java.util.Optional;

/**
 * @author lxc
 * @date 2019/7/16 16:38
 * @param <E> 实体类类名
 * @param <ID> 主键类型
 * @description JPA的常用接口方法封装（@FunctionalInterface：显示声明函数式接口，只能有一个抽象方法）
 */
@FunctionalInterface
public interface JpaBaseService<E, ID extends Serializable> {

    /**
     * 接口方法，获得JpaRepository的实例
     * @return
     */
    JpaRepository<E, ID> getRepository();

    /**
     * 从主键查找
     * @param id 主键
     * @return 查找的对象
     */
    default E findById(ID id) {
        return getRepository().getOne(id);
    }

    /**
     * 分页查询
     * @param pageable 分页，排序信息
     * @return 分页信息
     */
    default Page<E> findAll(Pageable pageable) {
        return getRepository().findAll(pageable);
    }

    /**
     * 查询所有数据
     * @return 数据库中所有数据,返回List
     */
    default List<E> findAll() {
        return getRepository().findAll();
    }

    /**
     * 保存或修改（有ID修改，无ID保存）
     * @param entity 要保存的对象
     */
    @Transactional(rollbackFor = Exception.class)
    default void saveInfo(E entity) {
        getRepository().save(entity);
    }

    /**
     * 删除
     * @param id 主键
     */
    @Transactional(rollbackFor = Exception.class)
    default void deleteById(ID id) {
        getRepository().deleteById(id);
    }

    /**
     * 批量删除
     * @param idList 主键集合
     */
    @Transactional(rollbackFor = Exception.class)
    default void deleteByIds(List<ID> idList) {
        Optional.ofNullable(idList).ifPresent(ids -> ids.forEach(id -> getRepository().deleteById(id)));
    }

}