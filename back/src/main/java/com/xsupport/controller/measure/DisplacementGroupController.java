package com.xsupport.controller.measure;

import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.measure.DisplacementGroup;
import com.xsupport.service.measure.DisplacementGroupService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@RestController
@RequestMapping("displacementGroup")
@Api(description = "位移采集汇总记录")
public class  DisplacementGroupController {

    @Resource
    private DisplacementGroupService displacementGroupService;

    @GetMapping("findNewestData")
    @ApiOperation(value = "获得最新数据")
	public ReturnCode detail() {

	    DisplacementGroup displacementGroup = displacementGroupService.findNewestData();

	    return new ReturnCode.Builder().object(displacementGroup).success().msg("查询成功").build();
	}

}