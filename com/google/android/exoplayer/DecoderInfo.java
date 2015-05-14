package com.google.android.exoplayer;

public final class DecoderInfo
{
  public final boolean adaptive;
  public final String name;

  DecoderInfo(String paramString, boolean paramBoolean)
  {
    this.name = paramString;
    this.adaptive = paramBoolean;
  }
}