package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.impl.AbstractService;
import com.xsupport.service.measure.DisplacementService;
import com.xsupport.dao.measure.DisplacementDao;
import com.xsupport.jpa.measure.DisplacementMapper;
import com.xsupport.model.measure.Displacement;

/**
 * @author lxc
 * @date 2019/5/9
 * @description 位移采集汇总记录
 */
@Service
public class DisplacementServiceImpl extends AbstractService<Displacement> implements DisplacementService {

	@Resource
	private DisplacementDao displacementDao;

    @Resource
    private DisplacementMapper displacementMapper;

    @Override
    public Displacement findNewestData(){
        Displacement displacement = displacementDao.findNewestData();
        if(displacement == null){
            displacement = new Displacement();
        }
        return displacement;
    }
	
}