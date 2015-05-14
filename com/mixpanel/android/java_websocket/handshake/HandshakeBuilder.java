package com.mixpanel.android.java_websocket.handshake;

public abstract interface HandshakeBuilder extends Handshakedata
{
  public abstract void put(String paramString1, String paramString2);

  public abstract void setContent(byte[] paramArrayOfByte);
}