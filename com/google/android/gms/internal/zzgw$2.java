package com.google.android.gms.internal;

import android.content.Context;
import android.webkit.WebView;

final class zzgw$2
  implements Runnable
{
  zzgw$2(Context paramContext, zzgo paramzzgo, zzgy paramzzgy, zzcf paramzzcf, zzce paramzzce, String paramString, zzbv paramzzbv)
  {
  }

  public void run()
  {
    zzic localzzic = zzab.zzaN().zza(this.zznK, new zzba(), false, false, null, this.zzxq.zzlP);
    if (zzab.zzaP().zzem())
      localzzic.getWebView().clearCache(true);
    localzzic.setWillNotDraw(true);
    this.zzxk.zza(localzzic);
    this.zzxl.zza(this.zzxm, new String[] { "rwc" });
    zzce localzzce = this.zzxl.zzcq();
    zzid.zza localzza = zzgw.zzb(this.zzxn, this.zzxl, localzzce);
    zzid localzzid = localzzic.zzeG();
    localzzid.zza("/invalidRequest", this.zzxk.zzxz);
    localzzid.zza("/loadAdURL", this.zzxk.zzxA);
    localzzid.zza("/log", zzcu.zzrG);
    localzzid.zza(localzza);
    zzhx.zzY("Loading the JS library.");
    localzzic.loadUrl(this.zzxr.zzbV());
  }
}