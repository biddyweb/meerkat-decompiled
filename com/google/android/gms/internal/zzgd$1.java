package com.google.android.gms.internal;

class zzgd$1
  implements Runnable
{
  zzgd$1(zzgd paramzzgd)
  {
  }

  public void run()
  {
    synchronized (this.zzvS.zznh)
    {
      if (this.zzvS.zzvO.errorCode != -2)
        return;
      this.zzvS.zzmu.zzeG().zza(this.zzvS);
      this.zzvS.zzdG();
      zzhx.zzab("Loading HTML in WebView.");
      this.zzvS.zzmu.loadDataWithBaseURL(zzab.zzaM().zzS(this.zzvS.zzvO.zzus), this.zzvS.zzvO.zzwG, "text/html", "UTF-8", null);
      return;
    }
  }
}