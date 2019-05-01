package com.xsupport.controller.measure;

import com.alibaba.fastjson.JSON;
import com.xsupport.model.http.SendTextParam;
import com.xsupport.system.returncode.ReturnCode;
import com.xsupport.system.websocket.WebsocketUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;

/**
 * @author lxc
 * @date 2019/4/26
 * @description
 */
@RestController
@RequestMapping("webSocket")
@Api(description = "webSocket")
public class WebSocketController {

    @Resource
    private WebsocketUtil websocketUtil;

    @PostMapping("temperature")
    @ApiOperation(value = "修改状态")
    public ReturnCode sendTemperatureData() {

        String value = String.valueOf((Math.random() - 0.5 ) * 200);

        SendTextParam sendTextParam = new SendTextParam(value,0);

        websocketUtil.sendMessageForAllClient(JSON.toJSONString(sendTextParam));

        return new ReturnCode.Builder().object(JSON.toJSONString(sendTextParam)).success().msg("发送成功").build();
    }

}
