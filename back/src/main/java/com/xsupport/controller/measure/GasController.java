package com.xsupport.controller.measure;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.measure.Gas;;
import com.xsupport.service.measure.GasService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
@RestController
@RequestMapping("gas")
@Api(description = "有毒气体")
public class  GasController {

    @Resource
    private GasService gasService;

    @GetMapping("findNewestData")
    @ApiOperation(value = "查询最新数据")
    public ReturnCode findNewestData(@RequestParam Integer bigType) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("查询成功").build();
        }
        List<Gas> gsaList = gasService.findNewestData(bigType);
        return new ReturnCode.Builder().object(gsaList).success().msg("查询成功").build();
    }

}