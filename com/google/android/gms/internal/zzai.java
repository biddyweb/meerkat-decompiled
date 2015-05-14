package com.google.android.gms.internal;

import android.content.Context;
import android.os.Handler;
import java.util.concurrent.Future;

@zzgi
public class zzai
{
  protected zzah zza(Context paramContext, zzhy paramzzhy, zzhq<zzah> paramzzhq)
  {
    zzaj localzzaj = new zzaj(paramContext, paramzzhy);
    localzzaj.zza(new zzai.2(this, paramzzhq, localzzaj));
    return localzzaj;
  }

  public Future<zzah> zza(Context paramContext, zzhy paramzzhy, String paramString)
  {
    zzhq localzzhq = new zzhq();
    zzhw.zzzG.post(new zzai.1(this, paramContext, paramzzhy, localzzhq, paramString));
    return localzzhq;
  }
}