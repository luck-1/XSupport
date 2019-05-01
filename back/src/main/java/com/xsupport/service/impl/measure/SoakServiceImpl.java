package com.xsupport.service.impl.measure;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.xsupport.service.AbstractService;
import com.xsupport.service.measure.SoakService;
import com.xsupport.dao.measure.SoakDao;
import com.xsupport.jpa.measure.SoakMapper;
import com.xsupport.model.base.Soak;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 浸润测量
 */
@Service
public class SoakServiceImpl extends AbstractService<Soak> implements SoakService  {

	@Resource
	private SoakDao soakDao;

    @Resource
    private SoakMapper soakMapper;


    @Override
    public Soak findNewestData(){
        return soakDao.findNewestData();
    }
	
}