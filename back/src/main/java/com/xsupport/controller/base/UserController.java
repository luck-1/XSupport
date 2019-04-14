package com.xsupport.controller.base;

import java.util.List;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.xsupport.model.http.PasswordParam;
import com.xsupport.model.http.LoginParam;
import com.xsupport.system.returncode.ReturnCode;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.xsupport.model.base.User;
import com.xsupport.service.base.UserService;

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
public class  UserController {

    @Resource
    private UserService userService;

    @PostMapping("login")
    @ApiOperation(value = "登录")
    public ReturnCode update(@RequestBody @Valid LoginParam loginParam, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        User user = userService.login( loginParam);
        return new ReturnCode.Builder().object(user).success().msg("登录成功").build();
    }

    @PutMapping("changePassword")
    @ApiOperation(value = "修改密码")
    public ReturnCode changePassword(@RequestBody @Valid PasswordParam passwordParam, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        userService.changePassword(passwordParam);
        return new ReturnCode.Builder().success().msg("登录成功").build();
    }

    @PostMapping("saveInfo")
    @ApiOperation(value = "添加/修改")
    public ReturnCode saveInfo(@RequestBody @Valid User user, BindingResult bindingResult) {
        if (bindingResult.hasErrors()){
            return new ReturnCode.Builder().failed().msg(bindingResult.getFieldError().getDefaultMessage()).build();
        }
        userService.saveInfo(user);
        return new ReturnCode.Builder().success().msg("添加成功").build();
    }

    @DeleteMapping("delete")
    @ApiOperation(value = "删除")
    public ReturnCode delete(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    userService.deleteById(id);
	  	return new ReturnCode.Builder().success().msg("删除成功").build();
    }

    @GetMapping("getOne")
    @ApiOperation(value = "查询单个")
	public ReturnCode detail(@RequestParam String id) {
        if(id == null || "".equals(id)){
            return new ReturnCode.Builder().failed().msg("输入为空").build();
        }
	    User user = userService.findById(id);
	    return new ReturnCode.Builder().object(user).success().msg("查询成功").build();
	}

    @PostMapping("list")
    @ApiOperation(value = "查询所有")
    public ReturnCode list(@RequestParam(defaultValue = "0") Integer page,
                           @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<User> list = userService.findAll();
        PageInfo pageInfo = new PageInfo(list);
        return new ReturnCode.Builder().object(pageInfo).success().msg("查询成功").build();
    }

}