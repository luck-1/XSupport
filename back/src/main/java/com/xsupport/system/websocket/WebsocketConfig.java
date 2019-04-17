package com.xsupport.system.websocket;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

/**
 * @author lxc
 * @date 2019/4/17
 * @description websocket配置
 */
@Configuration
public class WebsocketConfig {

    @Bean
    public ServerEndpointExporter serverEndpointExporter(){return new ServerEndpointExporter();}
}
