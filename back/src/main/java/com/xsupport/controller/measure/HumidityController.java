package com.xsupport.controller.measure;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.measure.Humidity;
import com.xsupport.service.measure.HumidityService;
import com.xsupport.system.returncode.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/29
 * @description 湿度监控
 */
@RestController
@RequestMapping("humidity")
@Api(description = "湿度监控")
public class  HumidityController {

    @Resource
    private HumidityService humidityService;

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<Humidity> list = humidityService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

}