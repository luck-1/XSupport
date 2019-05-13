package com.xsupport.jpa.measure;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.measure.DisplacementEvery;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集单个记录
 */
public interface DisplacementEveryMapper extends MyBaseJpaDao<DisplacementEvery,String> {

    DisplacementEvery findDisplacementEveryByGroupIdAndPoint(String groupId,Integer point);
}