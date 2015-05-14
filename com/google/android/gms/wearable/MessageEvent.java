package com.google.android.gms.wearable;

public abstract interface MessageEvent
{
  public abstract byte[] getData();

  public abstract String getPath();

  public abstract int getRequestId();

  public abstract String getSourceNodeId();
}