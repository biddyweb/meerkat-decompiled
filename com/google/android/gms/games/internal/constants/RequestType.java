package com.google.android.gms.games.internal.constants;

import com.google.android.gms.games.internal.GamesLog;

public final class RequestType
{
  public static String zzeJ(int paramInt)
  {
    switch (paramInt)
    {
    default:
      GamesLog.zzs("RequestType", "Unknown request type: " + paramInt);
      return "UNKNOWN_TYPE";
    case 1:
      return "GIFT";
    case 2:
    }
    return "WISH";
  }
}