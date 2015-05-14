package com.mixpanel.android.java_websocket.handshake;

public abstract interface ClientHandshakeBuilder extends HandshakeBuilder, ClientHandshake
{
  public abstract void setResourceDescriptor(String paramString);
}