package com.mixpanel.android.java_websocket.client;

import com.mixpanel.android.java_websocket.AbstractWrappedByteChannel;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.channels.ByteChannel;

public abstract class AbstractClientProxyChannel extends AbstractWrappedByteChannel
{
  protected final ByteBuffer proxyHandshake;

  public AbstractClientProxyChannel(ByteChannel paramByteChannel)
  {
    super(paramByteChannel);
    try
    {
      this.proxyHandshake = ByteBuffer.wrap(buildHandShake().getBytes("ASCII"));
      return;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new RuntimeException(localUnsupportedEncodingException);
    }
  }

  public abstract String buildHandShake();

  public int write(ByteBuffer paramByteBuffer)
    throws IOException
  {
    if (!this.proxyHandshake.hasRemaining())
      return super.write(paramByteBuffer);
    return super.write(this.proxyHandshake);
  }
}