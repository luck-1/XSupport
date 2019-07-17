package com.xsupport.controller;

import com.xsupport.service.JpaBaseService;
import com.xsupport.system.result.ReturnCode;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.io.Serializable;
import java.util.List;
import java.util.Optional;

/**
 * @author joker
 * @date 2019/7/17 10:12
 * @description TODO
 */
public class JpaBaseController<E, ID extends Serializable> {

    @Autowired
    private JpaBaseService<E, ID> jpaBaseService;

    @PostMapping("saveInfo")
    @ApiOperation(value = "新增/更新")
    public ReturnCode add(@RequestBody @Valid E entity, BindingResult bindingResult) {
        if (entity == null) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        if (bindingResult.hasErrors()) {
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        jpaBaseService.saveInfo(entity);
        return new ReturnCode.Builder().success().msg("保存成功").build();
    }

    @DeleteMapping("deleteById")
    @ApiOperation(value = "删除")
    public ReturnCode deleteById(@RequestParam ID id) {
        if (StringUtils.isEmpty(id)) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        jpaBaseService.deleteById(id);
        return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @PostMapping("deleteByIds")
    @ApiOperation(value = "批量删除")
    public ReturnCode deleteByIdList(@RequestBody List<ID> idList) {
        if (idList == null || idList.size() == 0) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        jpaBaseService.deleteByIds(idList);
        return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @GetMapping("findById")
    @ApiOperation(value = "查询")
    public ReturnCode findById(@RequestParam ID id) {
        if (StringUtils.isEmpty(id)) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        E e = jpaBaseService.findById(id);
        return new ReturnCode.Builder().object(e).success().msg("查询成功").build();
    }

    @GetMapping("findAll")
    @ApiOperation(value = "分页查询")
    public ReturnCode findAll(@RequestParam(defaultValue = "1") Integer page,
                              @RequestParam(defaultValue = "10") Integer size) {
        Pageable pageable = PageRequest.of(page - 1, size);
        Page<E> pageInfo = jpaBaseService.findAll(pageable);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }
}