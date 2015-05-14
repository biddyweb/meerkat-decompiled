package com.crashlytics.android.internal.models;

public class BinaryImageData
{
  public final long baseAddress;
  public final String id;
  public final String path;
  public final long size;

  public BinaryImageData(long paramLong1, long paramLong2, String paramString1, String paramString2)
  {
    this.baseAddress = paramLong1;
    this.size = paramLong2;
    this.path = paramString1;
    this.id = paramString2;
  }
}