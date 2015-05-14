package com.google.android.gms.internal;

class zzga$1
  implements Runnable
{
  zzga$1(zzga paramzzga, zzfz paramzzfz)
  {
  }

  public void run()
  {
    synchronized (this.zzvK.zznh)
    {
      if (this.zzvK.zzvO.errorCode != -2)
        return;
      this.zzvK.zzmu.zzeG().zza(this.zzvK);
      this.zzvJ.zza(this.zzvK.zzvO);
      return;
    }
  }
}