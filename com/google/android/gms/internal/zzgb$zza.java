package com.google.android.gms.internal;

public final class zzgb$zza extends Exception
{
  private final int zzvR;

  public zzgb$zza(String paramString, int paramInt)
  {
    super(paramString);
    this.zzvR = paramInt;
  }

  public int getErrorCode()
  {
    return this.zzvR;
  }
}