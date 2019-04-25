package com.xsupport.system.websocket;

import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * @author lxc
 * @date 2019/4/17
 * @description
 */
@Component
@ServerEndpoint(value = "/websocket")
public class MyWebsocket {

    //concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
    private static CopyOnWriteArraySet<Session> sessionSet = new CopyOnWriteArraySet<>();

    @OnOpen
    public void onOpen(Session session) {
        sessionSet.add(session);
    }

    @OnMessage
    public void onMessage(Session session, String message) {
        System.out.println(session.getId() + " -> " + message);
    }

    @OnClose
    public void onClose(Session session) {
        sessionSet.remove(session);
    }

    @OnError
    public void onError(Session session, Throwable error) throws IOException {
        session.close();
        sessionSet.remove(session);
        error.printStackTrace();
    }

    public void sendMessageForAllClient(String obj) {
        sessionSet.forEach(session -> {
            try {
                session.getBasicRemote().sendText(obj);
            } catch (Exception e) {
                e.printStackTrace();
            }
        });
    }
}
