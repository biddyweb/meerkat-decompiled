package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

public class zzem
{
  public void zza(Context paramContext, zzeo paramzzeo)
  {
    zza(paramContext, paramzzeo, true);
  }

  public void zza(Context paramContext, zzeo paramzzeo, boolean paramBoolean)
  {
    if ((paramzzeo.zzuw == 4) && (paramzzeo.zzup == null))
    {
      if (paramzzeo.zzuo != null)
        paramzzeo.zzuo.onAdClicked();
      zzab.zzaJ().zza(paramContext, paramzzeo.zzun, paramzzeo.zzuv);
      return;
    }
    Intent localIntent = new Intent();
    localIntent.setClassName(paramContext, "com.google.android.gms.ads.AdActivity");
    localIntent.putExtra("com.google.android.gms.ads.internal.overlay.useClientJar", paramzzeo.zzlP.zzzK);
    localIntent.putExtra("shouldCallOnOverlayOpened", paramBoolean);
    zzeo.zza(localIntent, paramzzeo);
    if (!zzme.zzkk())
      localIntent.addFlags(524288);
    if (!(paramContext instanceof Activity))
      localIntent.addFlags(268435456);
    paramContext.startActivity(localIntent);
  }
}