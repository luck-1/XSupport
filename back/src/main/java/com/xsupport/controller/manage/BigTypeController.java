package com.xsupport.controller.manage;

import java.util.List;
import javax.annotation.Resource;

import com.xsupport.model.manage.BigType;
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
import com.xsupport.service.manage.BigTypeService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 类型
 */
@RestController
@RequestMapping("bigType")
@Api(description = "类型")
public class  BigTypeController {

    @Resource
    private BigTypeService bigTypeService;

    @PostMapping("add")
    @ApiOperation(value = "添加")
    public ReturnCode add(@RequestBody BigType bigType) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        bigTypeService.save(bigType);
        return new ReturnCode.Builder().success().msg("添加成功").build();
    }

    @DeleteMapping("delete")
    @ApiOperation(value = "删除")
    public ReturnCode delete(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    bigTypeService.deleteById(id);
	  	return new ReturnCode.Builder().success().msg("删除成功").build();
    }

 	@PutMapping("update")
 	@ApiOperation(value = "更新")
    public ReturnCode update(@RequestBody BigType bigType) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    bigTypeService.update(bigType);
	 	return new ReturnCode.Builder().success().msg("更新成功").build();
    }

    @GetMapping("findOne")
    @ApiOperation(value = "查询单个")
	public ReturnCode detail(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    BigType bigType = bigTypeService.findById(id);
	    return new ReturnCode.Builder().object(bigType).success().msg("查询成功").build();
	}

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<BigType> list = bigTypeService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

}