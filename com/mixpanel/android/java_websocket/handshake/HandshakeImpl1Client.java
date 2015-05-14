package com.mixpanel.android.java_websocket.handshake;

public class HandshakeImpl1Client extends HandshakedataImpl1
  implements ClientHandshakeBuilder
{
  private String resourceDescriptor = "*";

  public String getResourceDescriptor()
  {
    return this.resourceDescriptor;
  }

  public void setResourceDescriptor(String paramString)
    throws IllegalArgumentException
  {
    if (paramString == null)
      throw new IllegalArgumentException("http resource descriptor must not be null");
    this.resourceDescriptor = paramString;
  }
}