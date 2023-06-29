package com.multi.matchingBoard;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

//https://dev-gorany.tistory.com/235
@Configuration
@EnableWebSocketMessageBroker //WebSocket�޽���ó���� Ȱ��ȭ ��Ŵ
public class WebSocketConfig  implements WebSocketMessageBrokerConfigurer{ //extends AbstractWebSocketMessageBrokerConfigurer {

    @Override
    public void configureMessageBroker(MessageBrokerRegistry config) {
        config.enableSimpleBroker("/topic");
        config.setApplicationDestinationPrefixes("/app");
        //�޽��� ������ �ٿ����ϴ� prefix�� /app���� ������
    }

    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
         registry.addEndpoint("/chat").setAllowedOrigins("*");
         registry.addEndpoint("/chat").withSockJS();
    }
}