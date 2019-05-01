package com.xsupport.service.impl.measure;

import com.alibaba.fastjson.JSON;
import com.xsupport.jpa.manage.TypeMapper;
import com.xsupport.jpa.measure.GasMapper;
import com.xsupport.jpa.measure.HumidityMapper;
import com.xsupport.jpa.measure.SoakMapper;
import com.xsupport.jpa.measure.TemperatureMapper;
import com.xsupport.model.base.Gas;
import com.xsupport.model.base.Humidity;
import com.xsupport.model.base.Soak;
import com.xsupport.model.base.Temperature;
import com.xsupport.model.http.GasParam;
import com.xsupport.model.http.SendTextParam;
import com.xsupport.system.websocket.WebsocketUtil;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

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

    @Resource
    private TemperatureMapper temperatureMapper;

    @Resource
    private HumidityMapper humidityMapper;

    @Resource
    private SoakMapper soakMapper;

    @Resource
    private GasMapper gasMapper;

    @Resource
    private TypeMapper typeMapper;

    //    @Scheduled(fixedDelay = 1000L * 10)
    public void sendTemperatureData() {

        Integer value = Math.toIntExact(Math.round((Math.random() - 0.5) * 200));

        Float limit = typeMapper.findTypeById("0").getLimitValue();

        sendDataUtil(value, 0);

        temperatureMapper.save(new Temperature(value, limit));

    }

    //    @Scheduled(fixedDelay = 1000L * 10)
    public void sendHumidityData() {

        Integer value = Math.toIntExact(Math.round(Math.random() * 100));

        Float limit = typeMapper.findTypeById("1").getLimitValue();

        sendDataUtil(value, 1);

        humidityMapper.save(new Humidity(value, limit));
    }

    //    @Scheduled(fixedDelay = 1000L * 10)
    public void sendSoakData() {

        Integer value = Math.toIntExact(Math.round(Math.random() * 100));

        Float limit = typeMapper.findTypeById("2").getLimitValue();

        sendDataUtil(value, 2);

        soakMapper.save(new Soak(value, limit));
    }

//    @Scheduled(fixedDelay = 1000L * 10)
    public void sendGasData() {

//        Integer subIndex = Math.round()

        Float limit = typeMapper.findTypeByBigTypeAndSubIndex(3,0).getLimitValue();

        Float value = getRandNum();

        GasParam gasParam = new GasParam(0, value);

        sendDataUtil(gasParam, 3);

        gasMapper.save(new Gas(3,0,value,limit));
    }

    //    @Scheduled(fixedDelay = 1000L * 10)
    public void sendMetalData() {

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

    private Float getRandNum() {
        return (float)(Math.random() * 100);
    }
}