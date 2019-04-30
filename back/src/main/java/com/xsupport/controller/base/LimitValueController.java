package com.xsupport.controller.base;

import java.util.List;
import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.base.LimitValue;
import com.xsupport.service.base.LimitValueService;
import com.xsupport.system.returncode.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 阈值
 */
@RestController
@RequestMapping("limitValue")
@Api(description = "阈值")
public class  LimitValueController {

    @Resource
    private LimitValueService limitValueService;

    @PostMapping("saveInfo")
    @ApiOperation(value = "保存")
    public ReturnCode saveInfo(@RequestBody @Valid LimitValue limitValue, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        limitValueService.saveInfo(limitValue);
        return new ReturnCode.Builder().success().msg("保存成功").build();
    }

    @GetMapping("findById")
    @ApiOperation(value = "查询单个")
	public ReturnCode detail(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    LimitValue limitValue = limitValueService.findById(id);
	    return new ReturnCode.Builder().object(limitValue).success().msg("查询成功").build();
	}

}