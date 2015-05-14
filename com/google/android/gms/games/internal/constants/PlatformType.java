package com.google.android.gms.games.internal.constants;

public final class PlatformType
{
  public static String zzeJ(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Unknown platform type: " + paramInt);
    case 0:
      return "ANDROID";
    case 1:
      return "IOS";
    case 2:
    }
    return "WEB_APP";
  }
}