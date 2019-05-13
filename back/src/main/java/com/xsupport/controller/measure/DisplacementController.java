package com.xsupport.controller.measure;

import javax.annotation.Resource;
import com.xsupport.model.measure.Displacement;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.service.measure.DisplacementService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@RestController
@RequestMapping("displacement")
@Api(description = "位移采集汇总记录")
public class DisplacementController {

    @Resource
    private DisplacementService displacementService;

    @GetMapping("findNewestData")
    @ApiOperation(value = "获得最新数据")
	public ReturnCode findNewestData() {

	    Displacement displacement = displacementService.findNewestData();

	    return new ReturnCode.Builder().object(displacement).success().msg("查询成功").build();
	}

}