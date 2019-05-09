package com.xsupport.controller.measure;

import java.util.List;
import javax.annotation.Resource;
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
import com.xsupport.model.measure.DisplacementEvery;
import com.xsupport.service.measure.DisplacementEveryService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集单个记录
 */
@RestController
@RequestMapping("displacementEvery")
@Api(description = "位移采集单个记录")
public class  DisplacementEveryController {

    @Resource
    private DisplacementEveryService displacementEveryService;

    @PostMapping("add")
    @ApiOperation(value = "添加")
    public ReturnCode add(@RequestBody DisplacementEvery displacementEvery) {
        if(displacementEvery == null){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        displacementEveryService.save(displacementEvery);
        return new ReturnCode.Builder().success().msg("添加成功").build();
    }

    @DeleteMapping("delete")
    @ApiOperation(value = "删除")
    public ReturnCode delete(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    displacementEveryService.deleteById(id);
	  	return new ReturnCode.Builder().success().msg("删除成功").build();
    }

/*
    @DeleteMapping("deleteByIds")
    @ApiOperation(value = "批量删除")
    public ReturnCode deleteBySelect(@RequestParam List<String> ids) {
        if(ids == null || ids.size == 0)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        displacementEveryService.deleteByIds(ids);
        return new ReturnCode.Builder().success().msg("删除成功").build();
    }
*/

 	@PutMapping("update")
 	@ApiOperation(value = "更新")
    public ReturnCode update(@RequestBody DisplacementEvery displacementEvery) {
        if(displacementEvery == null){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    displacementEveryService.update(displacementEvery);
	 	return new ReturnCode.Builder().success().msg("更新成功").build();
    }

    @GetMapping("findOne")
    @ApiOperation(value = "查询单个")
	public ReturnCode detail(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    DisplacementEvery displacementEvery = displacementEveryService.findById(id);
	    return new ReturnCode.Builder().object(displacementEvery).success().msg("查询成功").build();
	}

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<DisplacementEvery> list = displacementEveryService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

}