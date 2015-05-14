package com.mixpanel.android.java_websocket.handshake;

import java.util.Iterator;

public abstract interface Handshakedata
{
  public abstract byte[] getContent();

  public abstract String getFieldValue(String paramString);

  public abstract boolean hasFieldValue(String paramString);

  public abstract Iterator<String> iterateHttpFields();
}