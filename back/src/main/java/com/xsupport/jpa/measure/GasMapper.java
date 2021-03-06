package com.xsupport.jpa.measure;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.measure.Gas;

import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
public interface GasMapper extends MyBaseJpaDao<Gas, String> {

    List<Gas> findGasesByBigType(Integer bigType);

}