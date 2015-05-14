package com.google.android.gms.internal;

@zzgi
public final class zzdm extends zzdt.zza
{
  private final Object zznh = new Object();
  private zzdo.zza zzsA;
  private zzdl zzsB;

  public void onAdClicked()
  {
    synchronized (this.zznh)
    {
      if (this.zzsB != null)
        this.zzsB.zzah();
      return;
    }
  }

  public void onAdClosed()
  {
    synchronized (this.zznh)
    {
      if (this.zzsB != null)
        this.zzsB.zzai();
      return;
    }
  }

  public void onAdFailedToLoad(int paramInt)
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        if (this.zzsA != null)
        {
          if (paramInt == 3)
          {
            i = 1;
            this.zzsA.zzm(i);
            this.zzsA = null;
          }
        }
        else
          return;
      }
      int i = 2;
    }
  }

  public void onAdLeftApplication()
  {
    synchronized (this.zznh)
    {
      if (this.zzsB != null)
        this.zzsB.zzaj();
      return;
    }
  }

  public void onAdLoaded()
  {
    synchronized (this.zznh)
    {
      if (this.zzsA != null)
      {
        this.zzsA.zzm(0);
        this.zzsA = null;
        return;
      }
      if (this.zzsB != null)
        this.zzsB.zzal();
      return;
    }
  }

  public void onAdOpened()
  {
    synchronized (this.zznh)
    {
      if (this.zzsB != null)
        this.zzsB.zzak();
      return;
    }
  }

  public void zza(zzdl paramzzdl)
  {
    synchronized (this.zznh)
    {
      this.zzsB = paramzzdl;
      return;
    }
  }

  public void zza(zzdo.zza paramzza)
  {
    synchronized (this.zznh)
    {
      this.zzsA = paramzza;
      return;
    }
  }
}