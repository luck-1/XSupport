package com.xsupport.controller.export;

import com.xsupport.service.export.ExportService;
import com.xsupport.system.returncode.ReturnCode;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.annotation.Resource;

/**
 * @author lxc
 * @date 2019/5/3
 * @description
 */
@RestController
@RequestMapping(value = "export")
@Api(description = "导出")
public class ExportController {

    @Resource
    private ExportService exportService;

    @GetMapping("exportExcel/{bigType}")
    @ApiOperation(value = "导出excel")
    public ReturnCode detail(@PathVariable(value = "bigType") Integer bigType) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("导出类型不能为空").build();
        }
        try {
            exportService.exportExcel(bigType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ReturnCode.Builder().success().msg("导出成功").build();
    }

}