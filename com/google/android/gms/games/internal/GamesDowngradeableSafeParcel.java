package com.google.android.gms.games.internal;

import com.google.android.gms.common.internal.zzh;
import com.google.android.gms.internal.zzly;

public abstract class GamesDowngradeableSafeParcel extends zzh
{
  protected static boolean zzd(Integer paramInteger)
  {
    if (paramInteger == null)
      return false;
    return zzly.zzbe(paramInteger.intValue());
  }
}