package com.xsupport.service.impl.base;

import com.alibaba.fastjson.JSON;
import com.xsupport.model.http.MapParam;
import com.xsupport.model.http.SendTextParam;
import com.xsupport.system.config.HttpAspect;
import com.xsupport.system.websocket.WebsocketUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/26
 * @description
 */
@Service
@EnableScheduling
public class WebsocketServiceImpl {

    @Resource
    private WebsocketUtil websocketUtil;

//    private static final Logger log = LoggerFactory.getLogger(HttpAspect.class);

    @Scheduled(fixedDelay = 1000L * 10)
    public void sendTemperatureData() {
        String value = String.valueOf(Math.round((Math.random() - 0.5) * 200));
        sendDataUtil(value, 0);
    }

    @Scheduled(fixedDelay = 1000L * 10)
    public void sendSoakData() {
        String value = getRandNum();
        sendDataUtil(value, 2);
    }

    @Scheduled(fixedDelay = 1000L * 10)
    public void sendGasData() {

        List<MapParam> list = new ArrayList<>();

        list.add(new MapParam("CO", getRandNum()));
        list.add(new MapParam("SO 2", getRandNum()));
        list.add(new MapParam("NO x", getRandNum()));
        list.add(new MapParam("HCl", getRandNum()));
        list.add(new MapParam("ClO 2", getRandNum()));

        sendDataUtil(list, 3);
    }

    @Scheduled(fixedDelay = 1000L * 10)
    public void sendMetalData() {

        List<MapParam> list = new ArrayList<>();

        list.add(new MapParam("铜", getRandNum()));
        list.add(new MapParam("铅", getRandNum()));
        list.add(new MapParam("锌", getRandNum()));
        list.add(new MapParam("锡", getRandNum()));
        list.add(new MapParam("镍", getRandNum()));
        list.add(new MapParam("钴", getRandNum()));
        list.add(new MapParam("锑", getRandNum()));
        list.add(new MapParam("镉", getRandNum()));

        sendDataUtil(list, 4);
    }

    private <T> void sendDataUtil(T value, Integer type) {
        String sendData = JSON.toJSONString(new SendTextParam(value, type));
        websocketUtil.sendMessageForAllClient(sendData);
        String str = "";
        switch (type) {
            case 0:
                str = "温度";
                break;
            case 2:
                str = "浸润";
                break;
            case 3:
                str = "气体";
                break;
            case 4:
                str = "金属";
                break;
        }
        System.out.println(str + "：" + sendData);
    }

    private String getRandNum() {
        return String.valueOf(Math.round(Math.random() * 100));
    }
}