package com.google.android.gms.internal;

import android.os.Bundle;

final class zzbx$1 extends zzbx<Boolean>
{
  zzbx$1(String paramString, Boolean paramBoolean)
  {
    super(paramString, paramBoolean, null);
  }

  public Boolean zzb(Bundle paramBundle)
  {
    return Boolean.valueOf(paramBundle.getBoolean(getKey(), ((Boolean)zzbY()).booleanValue()));
  }

  public zzki<Boolean> zzbZ()
  {
    return zzki.zzg(getKey(), ((Boolean)zzbY()).booleanValue());
  }
}