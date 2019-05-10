package com.xsupport.jpa.measure;

import com.xsupport.jpa.MyBaseJpaDao;
import com.xsupport.model.measure.DisplacementGroup;
import org.springframework.data.jpa.repository.Query;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
public interface DisplacementGroupMapper extends MyBaseJpaDao<DisplacementGroup,String> {

    DisplacementGroup findNewestData();
}