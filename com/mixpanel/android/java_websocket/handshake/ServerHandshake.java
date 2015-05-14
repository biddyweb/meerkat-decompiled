package com.mixpanel.android.java_websocket.handshake;

public abstract interface ServerHandshake extends Handshakedata
{
  public abstract short getHttpStatus();

  public abstract String getHttpStatusMessage();
}