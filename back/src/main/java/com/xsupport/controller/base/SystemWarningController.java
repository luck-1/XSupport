package com.xsupport.controller.base;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.xsupport.model.http.ExceptionStateParam;
import com.xsupport.model.http.SendTextParam;
import com.xsupport.system.websocket.MyWebsocket;
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
import com.xsupport.model.base.SystemWarning;
import com.xsupport.service.base.SystemWarningService;
import com.xsupport.system.returncode.ReturnCode;

/**
 * @author lxc
 * @date 2019/4/21
 * @description 系统异常
 */
@RestController
@RequestMapping("systemWarning")
@Api(description = "系统异常")
public class SystemWarningController {
    @Resource
    private MyWebsocket myWebsocket;

    @Resource
    private SystemWarningService systemWarningService;

    @PostMapping("add")
    @ApiOperation(value = "添加")
    public ReturnCode add(@RequestBody SystemWarning systemWarning) {
        if (systemWarning == null) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        systemWarningService.save(systemWarning);
        return new ReturnCode.Builder().success().msg("添加成功").build();
    }

    @DeleteMapping("delete")
    @ApiOperation(value = "删除")
    public ReturnCode delete(@RequestParam String id) {
        if (id == null || "".equals(id)) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        systemWarningService.deleteById(id);
        return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @PutMapping("update")
    @ApiOperation(value = "更新")
    public ReturnCode update(@RequestBody SystemWarning systemWarning) {
        if (systemWarning == null) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        systemWarningService.update(systemWarning);
        return new ReturnCode.Builder().success().msg("更新成功").build();
    }

    @GetMapping("findOne")
    @ApiOperation(value = "查询单个")
    public ReturnCode detail(@RequestParam String id) {
        if (id == null || "".equals(id)) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        SystemWarning systemWarning = systemWarningService.findById(id);
        return new ReturnCode.Builder().object(systemWarning).success().msg("查询成功").build();
    }

    @GetMapping("findAll")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<SystemWarning> list = systemWarningService.findAll();
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
        systemWarningService.changeState(id,state,userId);
        return new ReturnCode.Builder().success().msg("查询成功").build();
    }

    @PostMapping("sendData")
    @ApiOperation(value = "修改状态")
    public ReturnCode sendData() {
        SendTextParam sendTextParam = new SendTextParam();
        sendTextParam.setTime(new Date());
        sendTextParam.setValue("88");
        String json= JSON.toJSONString(sendTextParam);
        myWebsocket.sendMessageForAllClient(json);
        return new ReturnCode.Builder().success().msg("查询成功").build();
    }


}