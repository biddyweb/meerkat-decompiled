package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;

public class zzmr
{
  public static boolean zzV(Context paramContext)
  {
    return (0xF & paramContext.getResources().getConfiguration().uiMode) == 6;
  }
}