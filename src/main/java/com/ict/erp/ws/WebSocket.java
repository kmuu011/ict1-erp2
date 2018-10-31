package com.ict.erp.ws;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ict.erp.HomeController;


@ServerEndpoint(value="/wstest")
public class WebSocket {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	private final static List<Session> SS_LIST = Collections.synchronizedList(new ArrayList<Session>());
	
	@OnOpen
	public void onOpen(Session ss) throws IOException {
		SS_LIST.add(ss);
		logger.info("OPEN WebSocket ss id : {}", ss.getId());
		ss.getBasicRemote().sendText("ㅎㅇㅎㅇ");
	}
	
	@OnClose
	public void onClose(Session ss) {
		SS_LIST.remove(ss);
		logger.info("close WEBSOCKET id : {}",ss.getId());
	}
	
	@OnError
	public void onError(Throwable e) {
		
	}
	
	@OnMessage
	public void onMessage(Session ss, String msg) throws IOException {
		for(Session s:SS_LIST) {
			if(s!=ss) {
				s.getBasicRemote().sendText(msg);
			}
		}
		
	}

}
