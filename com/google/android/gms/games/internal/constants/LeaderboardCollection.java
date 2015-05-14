package com.google.android.gms.games.internal.constants;

public final class LeaderboardCollection
{
  public static String zzeJ(int paramInt)
  {
    switch (paramInt)
    {
    default:
      throw new IllegalArgumentException("Unknown leaderboard collection: " + paramInt);
    case 0:
      return "PUBLIC";
    case 1:
    }
    return "SOCIAL";
  }
}