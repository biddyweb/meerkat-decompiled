package com.google.android.gms.internal;

@zzgi
public abstract class zzhl
{
  private final Runnable zzmG = new zzhl.1(this);
  private volatile Thread zzzi;

  public final void cancel()
  {
    onStop();
    if (this.zzzi != null)
      this.zzzi.interrupt();
  }

  public abstract void onStop();

  public final void start()
  {
    zzhn.zzb(this.zzmG);
  }

  public abstract void zzdw();

  public final void zzeq()
  {
    zzhn.zza(1, this.zzmG);
  }
}