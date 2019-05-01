package com.xsupport.controller.manage;

import java.util.List;
import com.github.pagehelper.PageInfo;
import com.xsupport.model.http.FindUserParam;
import com.xsupport.model.http.PasswordParam;
import com.xsupport.model.http.LoginParam;
import com.xsupport.system.returncode.ReturnCode;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.base.User;
import com.xsupport.service.manage.UserService;
import javax.annotation.Resource;
import javax.validation.Valid;

/**
 * @author lxc
 * @date 2019/4/10
 * @description 用户
 */
@RestController
@RequestMapping("user")
@Api(description = "用户")
public class UserController {

    @Resource
    private UserService userService;

    @PostMapping("login")
    @ApiOperation(value = "登录")
    public ReturnCode update(@RequestBody @Valid LoginParam loginParam, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        User user = userService.login(loginParam);
        return new ReturnCode.Builder().object(user).success().msg("登录成功").build();
    }

    @PutMapping("changePassword")
    @ApiOperation(value = "修改密码")
    public ReturnCode changePassword(@RequestBody @Valid PasswordParam passwordParam, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        userService.changePassword(passwordParam);
        return new ReturnCode.Builder().success().msg("密码修改成功").build();
    }

    @PostMapping("saveInfo")
    @ApiOperation(value = "添加/修改")
    public ReturnCode saveInfo(@RequestBody @Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        userService.saveInfo(user);
        return new ReturnCode.Builder().success().msg("保存成功").build();
    }

    @DeleteMapping("deleteOne")
    @ApiOperation(value = "删除")
    public ReturnCode delete(@RequestParam String id) {
        if (id == null || "".equals(id)) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        userService.deleteById(id);
        return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @PostMapping("deleteList")
    @ApiOperation(value = "删除")
    public ReturnCode deleteList(@RequestBody List<String> ids) {
        if (ids == null || ids.size() == 0) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        userService.deleteUsersById(ids);
        return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @PostMapping("findByCondition")
    @ApiOperation(value = "条件查询")
    public ReturnCode findByCondition(@RequestBody @Valid FindUserParam findUserParam,BindingResult bindingResult) {
        if(bindingResult.hasErrors()){
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        PageInfo pageInfo = userService.findByCondition(findUserParam);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

    @GetMapping("changeForbiddenState")
    @ApiOperation(value = "禁用 、启用 用户")
    public ReturnCode changeForbiddenState(@RequestParam String id) {
        if (id == null || "".equals(id)) {
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
        String str = userService.changeForbiddenState(id);
        return new ReturnCode.Builder().success().msg(str).build();
    }
}