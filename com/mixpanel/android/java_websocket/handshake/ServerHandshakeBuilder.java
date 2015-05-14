package com.mixpanel.android.java_websocket.handshake;

public abstract interface ServerHandshakeBuilder extends HandshakeBuilder, ServerHandshake
{
  public abstract void setHttpStatus(short paramShort);

  public abstract void setHttpStatusMessage(String paramString);
}