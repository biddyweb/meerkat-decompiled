package com.google.android.gms.internal;

import java.io.IOException;

public abstract class zzws<M extends zzws<M>> extends zzwy
{
  protected zzwu zzaHB;

  public final <T> T zza(zzwt<M, T> paramzzwt)
  {
    if (this.zzaHB == null);
    zzwv localzzwv;
    do
    {
      return null;
      localzzwv = this.zzaHB.zziE(zzxb.zziI(paramzzwt.tag));
    }
    while (localzzwv == null);
    return localzzwv.zzb(paramzzwt);
  }

  public void zza(zzwr paramzzwr)
    throws IOException
  {
    if (this.zzaHB == null);
    while (true)
    {
      return;
      for (int i = 0; i < this.zzaHB.size(); i++)
        this.zzaHB.zziF(i).zza(paramzzwr);
    }
  }

  protected final boolean zza(zzwq paramzzwq, int paramInt)
    throws IOException
  {
    int i = paramzzwq.getPosition();
    if (!paramzzwq.zzin(paramInt))
      return false;
    int j = zzxb.zziI(paramInt);
    zzxa localzzxa = new zzxa(paramInt, paramzzwq.zzx(i, paramzzwq.getPosition() - i));
    zzwv localzzwv = null;
    if (this.zzaHB == null)
      this.zzaHB = new zzwu();
    while (true)
    {
      if (localzzwv == null)
      {
        localzzwv = new zzwv();
        this.zzaHB.zza(j, localzzwv);
      }
      localzzwv.zza(localzzxa);
      return true;
      localzzwv = this.zzaHB.zziE(j);
    }
  }

  protected final boolean zza(M paramM)
  {
    if ((this.zzaHB == null) || (this.zzaHB.isEmpty()))
      return (paramM.zzaHB == null) || (paramM.zzaHB.isEmpty());
    return this.zzaHB.equals(paramM.zzaHB);
  }

  protected int zzc()
  {
    int i = 0;
    if (this.zzaHB != null)
    {
      j = 0;
      while (i < this.zzaHB.size())
      {
        j += this.zzaHB.zziF(i).zzc();
        i++;
      }
    }
    int j = 0;
    return j;
  }

  protected final int zzvL()
  {
    if ((this.zzaHB == null) || (this.zzaHB.isEmpty()))
      return 0;
    return this.zzaHB.hashCode();
  }

  public M zzvM()
    throws CloneNotSupportedException
  {
    zzws localzzws = (zzws)super.zzvN();
    zzww.zza(this, localzzws);
    return localzzws;
  }
}