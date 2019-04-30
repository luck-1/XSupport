package com.xsupport.system.config;

import com.xsupport.jpa.base.LimitValueMapper;
import com.xsupport.jpa.base.TemperatureMapper;
import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

/**
 * 启动结束执行
 */
@Component
@Order(value = 1)
public class StartupRunner implements CommandLineRunner {

    @Override
    public void run(String... args) {

        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  服务启动执行，执行加载数据等操作  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");
    }

}
