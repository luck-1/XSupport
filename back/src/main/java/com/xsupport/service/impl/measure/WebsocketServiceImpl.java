package com.xsupport.service.impl.measure;

import com.alibaba.fastjson.JSON;
import com.xsupport.dao.measure.DisplacementEveryDao;
import com.xsupport.dao.measure.DisplacementDao;
import com.xsupport.jpa.manage.SysWarnMapper;
import com.xsupport.jpa.manage.TypeMapper;
import com.xsupport.jpa.measure.*;
import com.xsupport.model.measure.*;
import com.xsupport.model.http.SendTextParam;
import com.xsupport.model.manage.SysWarn;
import com.xsupport.model.manage.Type;
import com.xsupport.system.websocket.WebsocketUtil;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.sql.*;
import java.util.Random;

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

    @Resource
    private SysWarnMapper sysWarnMapper;

    @Resource
    private PointEnumMapper pointEnumMapper;

    @Resource
    private DisplacementEveryMapper displacementEveryMapper;

    @Resource
    private DisplacementEveryDao displacementEveryDao;

    @Resource
    private DisplacementMapper displacementMapper;

    @Resource
    private DisplacementDao displacementDao;

    @Resource
    private DisplacementValueMapper displacementValueMapper;

    private static Random random = new Random();

    private static final Float DEFAULT_X = 0F;

    private static final Float DEFAULT_Y = 0F;

    private static final Float DEFAULT_Z = 0F;

    @Scheduled(fixedDelay = 1000L * 3)
    @Transactional(rollbackFor = Exception.class)
    public void sendData() {

        Integer bigType = random.nextInt(5);
        Integer subIndex = 0;
        Float value = 0f;
        Type type = null;
        switch (bigType) {
            case 0:
                value = (float) (random.nextFloat() - 0.5) * 200;
                type = typeMapper.findTypeByBigTypeAndSubIndex(bigType, subIndex);
                temperatureMapper.save(new Temperature(value, type.getLimitValue()));
                break;
            case 1:
                value = random.nextFloat() * 100;
                type = typeMapper.findTypeByBigTypeAndSubIndex(bigType, subIndex);
                humidityMapper.save(new Humidity(value, type.getLimitValue()));
                break;
            case 2:
                value = random.nextFloat() * 100;
                type = typeMapper.findTypeByBigTypeAndSubIndex(bigType, subIndex);
                soakMapper.save(new Soak(value, type.getLimitValue()));
                break;
            case 3:
                subIndex = random.nextInt(5);
                value = random.nextFloat();
                type = typeMapper.findTypeByBigTypeAndSubIndex(bigType, subIndex);
                gasMapper.save(new Gas(bigType, subIndex, value, type.getLimitValue()));
                break;
            case 4:
                subIndex = random.nextInt(8);
                value = random.nextFloat();
                type = typeMapper.findTypeByBigTypeAndSubIndex(bigType, subIndex);
                gasMapper.save(new Gas(bigType, subIndex, value, type.getLimitValue()));
                break;
            default:
        }

        String sendData = JSON.toJSONString(new SendTextParam(bigType, subIndex, value));
        websocketUtil.sendMessageForAllClient(sendData);

        System.out.println(type.getName() + "：" + sendData);
        if (value >= type.getLimitValue()) {

            SysWarn sysWarn = new SysWarn(bigType, subIndex, value, type.getLimitValue());
            sysWarnMapper.save(sysWarn);
        }
    }

    @Scheduled(fixedDelay = 1000L * 10)
    @Transactional(rollbackFor = Exception.class)
    public void sendDisplacementData() {

        String groupId = createNewDisplacement();

        Displacement displacement = displacementDao.findNewestData();

        String sendData = JSON.toJSONString(new SendTextParam(5, displacement));

        websocketUtil.sendMessageForAllClient(sendData);

        System.out.println("位移：" + sendData);
    }

    private String createNewDisplacement() {

        Displacement beforeDisplacement = displacementDao.findNewestData();

        String beforeGroupId = beforeDisplacement == null ? "" : beforeDisplacement.getId();

        String groupId = displacementMapper.save(new Displacement()).getId();

        pointEnumMapper.findAll().forEach(pointEnum -> {

            DisplacementEvery beforeEvery = displacementEveryDao.findByGroupIdAndPoint(beforeGroupId, pointEnum.getCode());

            if (beforeEvery == null) {
                beforeEvery = new DisplacementEvery(new DisplacementValue(DEFAULT_X, DEFAULT_Y, DEFAULT_Z));
            }

            Float x = getDifference(beforeEvery.getThisValueData().getX());
            Float y = getDifference(beforeEvery.getThisValueData().getY());
            Float z = getDifference(beforeEvery.getThisValueData().getZ());

            String thisValueId = displacementValueMapper.save(new DisplacementValue(x, y, z)).getId();
            displacementEveryMapper.save(new DisplacementEvery(groupId, pointEnum.getCode(), thisValueId, beforeEvery.getThisValue()));
        });
        return groupId;
    }

    private Float getDifference(Float beforeValue) {
        return beforeValue + (random.nextFloat() - 0.5f) * 0.2f;
    }
}