package com.mixpanel.android.java_websocket;

import com.mixpanel.android.java_websocket.drafts.Draft;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;
import java.util.concurrent.BlockingQueue;

public class SocketChannelIOHelper
{
  public static boolean batch(WebSocketImpl paramWebSocketImpl, ByteChannel paramByteChannel)
    throws IOException
  {
    ByteBuffer localByteBuffer = (ByteBuffer)paramWebSocketImpl.outQueue.peek();
    WrappedByteChannel localWrappedByteChannel;
    if (localByteBuffer == null)
    {
      boolean bool = paramByteChannel instanceof WrappedByteChannel;
      localWrappedByteChannel = null;
      if (bool)
      {
        localWrappedByteChannel = (WrappedByteChannel)paramByteChannel;
        if (localWrappedByteChannel.isNeedWrite())
          localWrappedByteChannel.writeMore();
      }
    }
    while (true)
    {
      if ((paramWebSocketImpl.outQueue.isEmpty()) && (paramWebSocketImpl.isFlushAndClose()) && (paramWebSocketImpl.getDraft().getRole() == WebSocket.Role.SERVER));
      try
      {
        paramWebSocketImpl.closeConnection();
        if ((localWrappedByteChannel == null) || (!((WrappedByteChannel)paramByteChannel).isNeedWrite()))
        {
          return true;
          do
          {
            paramByteChannel.write(localByteBuffer);
            if (localByteBuffer.remaining() > 0)
              return false;
            paramWebSocketImpl.outQueue.poll();
            localByteBuffer = (ByteBuffer)paramWebSocketImpl.outQueue.peek();
          }
          while (localByteBuffer != null);
          localWrappedByteChannel = null;
        }
      }
      finally
      {
      }
    }
    return false;
  }

  public static boolean read(ByteBuffer paramByteBuffer, WebSocketImpl paramWebSocketImpl, ByteChannel paramByteChannel)
    throws IOException
  {
    paramByteBuffer.clear();
    int i = paramByteChannel.read(paramByteBuffer);
    paramByteBuffer.flip();
    if (i == -1)
      paramWebSocketImpl.eot();
    while (i == 0)
      return false;
    return true;
  }

  public static boolean readMore(ByteBuffer paramByteBuffer, WebSocketImpl paramWebSocketImpl, WrappedByteChannel paramWrappedByteChannel)
    throws IOException
  {
    paramByteBuffer.clear();
    int i = paramWrappedByteChannel.readMore(paramByteBuffer);
    paramByteBuffer.flip();
    if (i == -1)
    {
      paramWebSocketImpl.eot();
      return false;
    }
    return paramWrappedByteChannel.isNeedRead();
  }
}