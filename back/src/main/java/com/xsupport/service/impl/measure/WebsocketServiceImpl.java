package com.xsupport.service.impl.measure;

import com.alibaba.fastjson.JSON;
import com.xsupport.dao.measure.DisplacementGroupDao;
import com.xsupport.jpa.manage.SysWarnMapper;
import com.xsupport.jpa.manage.TypeMapper;
import com.xsupport.jpa.measure.*;
import com.xsupport.model.measure.*;
import com.xsupport.model.http.SendTextParam;
import com.xsupport.model.manage.SysWarn;
import com.xsupport.model.manage.Type;
import com.xsupport.system.websocket.WebsocketUtil;
import com.xsupport.util.SysUtil;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
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
    private DisplacementPointEnumMapper displacementPointEnumMapper;

    @Resource
    private DisplacementEveryMapper displacementEveryMapper;

    @Resource
    private DisplacementGroupMapper displacementGroupMapper;

    @Resource
    private DisplacementGroupDao displacementGroupDao;

    @Resource
    private DisplacementValueMapper displacementValueMapper;

    private static final Random random = new Random();

    @Scheduled(fixedDelay = 1000L * 5)
    public void sendData() {

        Integer bigType = 5;
//        Integer bigType = random.nextInt(5);
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
            case 5:
                getInstance();
                return;
        }
        String sendData = JSON.toJSONString(new SendTextParam(bigType, subIndex, value));
        websocketUtil.sendMessageForAllClient(sendData);
        System.out.println(type.getName() + "：" + sendData);
        if (value >= type.getLimitValue()) {
            SysWarn sysWarn = new SysWarn(bigType,subIndex,value,type.getLimitValue());
            sysWarnMapper.save(sysWarn);
        }
    }


    private void getInstance(){

        DisplacementGroup beforeDisplacementGroup = displacementGroupDao.findNewestData();

        String beforeGroupId = beforeDisplacementGroup == null ? createDefaultValue() : beforeDisplacementGroup.getId();

        String groupId = SysUtil.getUUID();
        DisplacementGroup displacementGroup = new DisplacementGroup(groupId);
        displacementGroupMapper.save(displacementGroup);

        displacementPointEnumMapper.findAll().forEach(pointEnum -> {

            Integer line = pointEnum.getLine();
            Integer point = pointEnum.getPoint();

            DisplacementEvery beforeEvery = displacementEveryMapper.findDisplacementEveryByGroupIdAndLineAndPoint(beforeGroupId,line,point);

            String thisValueId = SysUtil.getUUID();

            DisplacementEvery displacementEvery = new DisplacementEvery(groupId,line,point,thisValueId,beforeEvery.getBeforeValue());
            displacementEveryMapper.save(displacementEvery);

            Float x = beforeEvery.getBeforeValueData().getX() + getDifference();
            Float y = beforeEvery.getBeforeValueData().getY() + getDifference();
            Float z = beforeEvery.getBeforeValueData().getZ() + getDifference();

            DisplacementValue displacementValue = new DisplacementValue(thisValueId,x,y,z);
            displacementValueMapper.save(displacementValue);
        });
    }

    private Float getDifference(){
        return random.nextFloat() * 0.01f;
    }

    private String createDefaultValue(){
        String groupId = SysUtil.getUUID();
        displacementGroupMapper.save(new DisplacementGroup(groupId));

        displacementPointEnumMapper.findAll().forEach(pointEnum -> {

            String thisValueId = SysUtil.getUUID();

            displacementEveryMapper.save(new DisplacementEvery(groupId,pointEnum.getLine(),pointEnum.getPoint(),thisValueId,"0"));
            displacementValueMapper.save(new DisplacementValue(thisValueId,0f,0f,0f));

        });
        return groupId;
    }
}