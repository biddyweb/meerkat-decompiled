package com.crashlytics.android.internal.models;

public class SignalData
{
  public final String code;
  public final long faultAddress;
  public final String name;

  public SignalData(String paramString1, String paramString2, long paramLong)
  {
    this.name = paramString1;
    this.code = paramString2;
    this.faultAddress = paramLong;
  }
}