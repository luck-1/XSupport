package com.xsupport.controller.manage;

import com.xsupport.model.manage.BigType;
import com.xsupport.service.manage.BigTypeBaseService;
import com.xsupport.system.result.ReturnCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 类型
 */
@RestController
@RequestMapping("bigType1111111111111111111111")
@Api(description = "类型")
public class  BigTypeController {

    @Resource
    private BigTypeBaseService bigTypeService;

    @PostMapping("saveInfo")
    @ApiOperation(value = "保存数据")
    public ReturnCode add(@RequestBody BigType bigType) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        bigTypeService.saveInfo(bigType);
        return new ReturnCode.Builder().success().msg("保存成功").build();
    }

    @DeleteMapping("deleteById")
    @ApiOperation(value = "单个删除")
    public ReturnCode deleteById(@RequestParam String id) {
        if(StringUtils.isEmpty(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    bigTypeService.deleteById(id);
	  	return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @PostMapping("deleteByIds")
    @ApiOperation(value = "批量删除")
    public ReturnCode deleteByIdList(@RequestBody List<String> idList) {
        if(idList == null || idList.size() == 0){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    bigTypeService.deleteByIds(idList);
	  	return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @GetMapping("findById")
    @ApiOperation(value = "查询单个")
	public ReturnCode findById(@RequestParam String id) {
        if(StringUtils.isEmpty(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    BigType bigType = bigTypeService.findById(id);
	    return new ReturnCode.Builder().object(bigType).success().msg("查询成功").build();
	}

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode findAll(@RequestParam(defaultValue = "0") Integer page,
                              @RequestParam(defaultValue = "0") Integer size) {
        Pageable pageable = PageRequest.of(page - 1,size);
        Page pageInfo = bigTypeService.findAll(pageable);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

}