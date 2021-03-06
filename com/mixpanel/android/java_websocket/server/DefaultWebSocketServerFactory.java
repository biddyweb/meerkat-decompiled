package com.mixpanel.android.java_websocket.server;

import com.mixpanel.android.java_websocket.WebSocketAdapter;
import com.mixpanel.android.java_websocket.WebSocketImpl;
import com.mixpanel.android.java_websocket.drafts.Draft;
import java.net.Socket;
import java.nio.channels.SelectionKey;
import java.nio.channels.SocketChannel;
import java.util.List;

public class DefaultWebSocketServerFactory
  implements WebSocketServer.WebSocketServerFactory
{
  public WebSocketImpl createWebSocket(WebSocketAdapter paramWebSocketAdapter, Draft paramDraft, Socket paramSocket)
  {
    return new WebSocketImpl(paramWebSocketAdapter, paramDraft);
  }

  public WebSocketImpl createWebSocket(WebSocketAdapter paramWebSocketAdapter, List<Draft> paramList, Socket paramSocket)
  {
    return new WebSocketImpl(paramWebSocketAdapter, paramList);
  }

  public SocketChannel wrapChannel(SocketChannel paramSocketChannel, SelectionKey paramSelectionKey)
  {
    return paramSocketChannel;
  }
}