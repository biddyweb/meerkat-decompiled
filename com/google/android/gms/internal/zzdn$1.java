package com.google.android.gms.internal;

class zzdn$1
  implements Runnable
{
  zzdn$1(zzdn paramzzdn, zzdm paramzzdm)
  {
  }

  public void run()
  {
    synchronized (zzdn.zza(this.zzsJ))
    {
      if (zzdn.zzb(this.zzsJ) != -2)
        return;
      zzdn.zza(this.zzsJ, zzdn.zzc(this.zzsJ));
      if (zzdn.zzd(this.zzsJ) == null)
      {
        this.zzsJ.zzm(4);
        return;
      }
    }
    this.zzsI.zza(this.zzsJ);
    zzdn.zza(this.zzsJ, this.zzsI);
  }
}