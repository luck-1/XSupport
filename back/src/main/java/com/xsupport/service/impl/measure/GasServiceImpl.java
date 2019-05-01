package com.xsupport.service.impl.measure;

import javax.annotation.Resource;

import com.xsupport.jpa.base.TypeMapper;
import com.xsupport.model.base.Type;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.measure.GasService;
import com.xsupport.dao.measure.GasDao;
import com.xsupport.jpa.measure.GasMapper;
import com.xsupport.model.base.Gas;

import java.util.ArrayList;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
@Service
public class GasServiceImpl extends AbstractService<Gas> implements GasService {

    @Resource
    private GasDao gasDao;

    @Resource
    private GasMapper gasMapper;

    @Resource
    private TypeMapper typeMapper;

    @Override
    public List<Gas> findNewestData(Integer bigType) {

        List<Gas> gasList = new ArrayList<>();

        List<Type> typeList = typeMapper.findTypesByBigType(bigType);

        typeList.forEach(type -> gasList.add(gasDao.findNewestData(bigType, type.getSubIndex())));

        return gasList;
    }


}