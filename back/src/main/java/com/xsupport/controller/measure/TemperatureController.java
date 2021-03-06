package com.xsupport.controller.measure;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.web.bind.annotation.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.measure.Temperature;
import com.xsupport.service.measure.TemperatureService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/28
 * @description 温度监控
 */
@RestController
@RequestMapping("temperature")
@Api(description = "温度监控")
public class  TemperatureController {

    @Resource
    private TemperatureService temperatureService;

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<Temperature> list = temperatureService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

    @GetMapping("findAll1")
    @ApiOperation(value = "查询所有1")
    public ReturnCode page(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        Pageable pageable = PageRequest.of(page,size);
        Page page1 = temperatureService.findAll(pageable);
        return new ReturnCode.Builder().object(page1).success().msg("查询成功").build();
    }

}