package com.xsupport.system.config;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.web.context.WebServerInitializedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

/**
 * @author lxc
 * @date 2019/3/5
 * @description 项目启动完成执行
 */
@Component
@Order(value=1)
public class StartupRunner implements CommandLineRunner, ApplicationListener<WebServerInitializedEvent> {

    private int serverPort;

    @Override
    public void onApplicationEvent(WebServerInitializedEvent webServerInitializedEvent) {
        serverPort = webServerInitializedEvent.getWebServer().getPort();
    }

    @Override
    public void run(String... args){
        System.out.println("Your application is running here: http://localhost:" + serverPort);
        System.out.println("Your druid page  is running here: http://localhost:" + serverPort + "/druid");
        System.out.println("Your swagger-ui  is running here: http://localhost:" + serverPort + "/swagger-ui.html");
    }
}