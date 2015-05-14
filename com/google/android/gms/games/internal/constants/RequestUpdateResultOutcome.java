package com.google.android.gms.games.internal.constants;

public final class RequestUpdateResultOutcome
{
  public static boolean isValid(int paramInt)
  {
    switch (paramInt)
    {
    default:
      return false;
    case 0:
    case 1:
    case 2:
    case 3:
    }
    return true;
  }
}