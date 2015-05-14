package com.mixpanel.android.mpmetrics;

public abstract interface ResourceIds
{
  public abstract int idFromName(String paramString);

  public abstract boolean knownIdName(String paramString);

  public abstract String nameForId(int paramInt);
}