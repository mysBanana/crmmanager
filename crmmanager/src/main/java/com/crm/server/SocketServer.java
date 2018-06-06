package com.crm.server;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@ServerEndpoint(value = "/socketServer/{id}")
@Component
public class SocketServer {
    private Session session;
    private static Map<String,Session> sessionMap=new HashMap<>();
    @OnOpen
    public void open(Session session,@PathParam("id") String id){
        this.session=session;
        sessionMap.put(id,session);
    }
    @OnMessage
    public void onMessage(String message){
        System.out.println("当前发送人sessionId为"+session.getId()+"发送内容为:"+message);
    }
    @OnClose
    public void onClose(){
       // System.out.println("关闭");
    }
    @OnError
    public void onError(Session session,Throwable error){
        error.printStackTrace();
    }
    public static void sendMessage(Object message,String id){
        Session s=sessionMap.get(id);
        if(s!=null && s.isOpen()){
            try {
                ObjectMapper mapper = new ObjectMapper();
                s.getBasicRemote().sendText(mapper.writeValueAsString(message));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
