package com.google.android.gms.internal;

public final class zzta
{
  private final String zzFr;
  private final boolean zzatB;
  private final boolean zzatC;
  private final String zzatD;

  private zzta(zza paramzza)
  {
    this.zzatD = zza.zza(paramzza);
    this.zzatB = zza.zzb(paramzza);
    this.zzatC = zza.zzc(paramzza);
    this.zzFr = zza.zzd(paramzza);
  }

  public String zzgL()
  {
    return this.zzFr;
  }

  public String zzrx()
  {
    return this.zzatD;
  }

  public boolean zzry()
  {
    return this.zzatB;
  }

  public boolean zzrz()
  {
    return this.zzatC;
  }

  public static final class zza
  {
    private String zzFr;
    private boolean zzatB = true;
    private boolean zzatC = false;
    private final String zzatD;

    public zza(String paramString)
    {
      this.zzatD = paramString;
    }

    public zza zzab(boolean paramBoolean)
    {
      this.zzatB = paramBoolean;
      return this;
    }

    public zza zzac(boolean paramBoolean)
    {
      this.zzatC = paramBoolean;
      return this;
    }

    public zza zzcA(String paramString)
    {
      this.zzFr = paramString;
      return this;
    }

    public zzta zzrA()
    {
      return new zzta(this, null);
    }
  }
}