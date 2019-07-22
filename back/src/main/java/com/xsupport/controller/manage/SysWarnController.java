package com.xsupport.controller.manage;

import java.util.List;
import javax.annotation.Resource;
import javax.validation.Valid;

import com.xsupport.model.http.ExceptionStateParam;
import com.xsupport.model.http.UpdateRemarkParam;
import org.springframework.validation.BindingResult;
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
import com.xsupport.model.manage.SysWarn;
import com.xsupport.service.manage.SysWarnService;
import com.xsupport.system.result.ReturnCode;

/**
 * @author lxc
 * @date 2019/5/1
 * @description 系统异常
 */
@RestController
@RequestMapping("sysWarn")
@Api(tags = {"系统异常"})
public class  SysWarnController {

    @Resource
    private SysWarnService sysWarnService;

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<SysWarn> list = sysWarnService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

    @PostMapping("changeState")
    @ApiOperation(value = "修改状态")
    public ReturnCode changeState(@RequestBody ExceptionStateParam exceptionStateParam) {
        String id = exceptionStateParam.getId();
        if (id == null || "".equals(id)) {
            return new ReturnCode.Builder().failed().msg("异常ID不能为空").build();
        }
        Integer state = exceptionStateParam.getState();
        if (state == null || state > 3 || state < 0) {
            return new ReturnCode.Builder().failed().msg("状态不规范").build();
        }
        String userId = exceptionStateParam.getUserId();
        if (userId == null || "".equals(userId)) {
            return new ReturnCode.Builder().failed().msg("操作用户不能为空").build();
        }
        sysWarnService.changeState(id,state,userId);
        return new ReturnCode.Builder().success().msg("查询成功").build();
    }

    @PutMapping("updateRemark")
    @ApiOperation(value = "修改备注")
    public ReturnCode updateRemark(@RequestBody @Valid UpdateRemarkParam updateRemarkParam, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        sysWarnService.updateRemark(updateRemarkParam.getId(),updateRemarkParam.getRemark());
        return new ReturnCode.Builder().success().msg("查询成功").build();
    }

}