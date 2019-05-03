package com.xsupport.controller.measure;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.measure.Soak;
import com.xsupport.service.measure.SoakService;
import com.xsupport.system.returncode.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 浸润测量
 */
@RestController
@RequestMapping("soak")
@Api(description = "浸润测量")
public class  SoakController {

    @Resource
    private SoakService soakService;

    @GetMapping("findNewestData")
    @ApiOperation(value = "查询所有")
    public ReturnCode findNewestData() {
        Soak soak= soakService.findNewestData();
        return new ReturnCode.Builder().object(soak).success().msg("查询成功").build();
    }

}