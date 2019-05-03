package com.xsupport.service.measure;

import org.springframework.stereotype.Component;
import com.xsupport.service.Service;
import com.xsupport.model.measure.Gas;;
import java.util.List;

/**
 * @author lxc
 * @date 2019/4/30
 * @description 有毒气体
 */
@Component
public interface GasService extends Service<Gas> {

    List<Gas> findNewestData(Integer bigType);

}