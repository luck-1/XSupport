package com.xsupport.controller.manage;

import javax.annotation.Resource;
import javax.validation.Valid;
import com.xsupport.model.manage.Type;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.service.manage.TypeService;
import com.xsupport.system.result.ReturnCode;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 各类型信息
 */
@RestController
@RequestMapping("type")
@Api(description = "各类型信息")
public class  TypeController {

    @Resource
    private TypeService typeService;

    @PostMapping("updateLimitValue")
    @ApiOperation(value = "保存")
    public ReturnCode updateLimitValue(@RequestBody @Valid Type type, BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        typeService.updateLimitValue(type);
        return new ReturnCode.Builder().success().msg("保存成功").build();
    }

    @GetMapping("findByBigTypeAndSubIndex")
    @ApiOperation(value = "查询")
    public ReturnCode findByBigTypeAndSubIndex(@RequestParam Integer bigType,@RequestParam Integer subIndex) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("大类型不能为空").build();
        }
        if(subIndex == null){
            return new ReturnCode.Builder().failed().msg("子类型不能为空").build();
        }
        Type type = typeService.findTypeByBigTypeAndSubIndex(bigType,subIndex);
        return new ReturnCode.Builder().object(type).success().msg("查询成功").build();
    }

    @GetMapping("findTypes")
    @ApiOperation(value = "查询所有子类型")
    public ReturnCode findTypes(@RequestParam Integer bigType) {
        if(bigType == null){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        List<Type> typeList = typeService.findTypesByBigType(bigType);
        return new ReturnCode.Builder().object(typeList).success().msg("查询成功").build();
    }

}