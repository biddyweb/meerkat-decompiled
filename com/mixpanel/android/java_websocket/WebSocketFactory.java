package com.mixpanel.android.java_websocket;

import com.mixpanel.android.java_websocket.drafts.Draft;
import java.net.Socket;
import java.util.List;

public abstract interface WebSocketFactory
{
  public abstract WebSocket createWebSocket(WebSocketAdapter paramWebSocketAdapter, Draft paramDraft, Socket paramSocket);

  public abstract WebSocket createWebSocket(WebSocketAdapter paramWebSocketAdapter, List<Draft> paramList, Socket paramSocket);
}