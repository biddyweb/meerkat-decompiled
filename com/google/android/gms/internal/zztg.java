package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;

public class zztg
{
  private final ArrayList<zza> zzatP = new ArrayList();
  private int zzatQ;

  public zztg()
  {
    this(100);
  }

  public zztg(int paramInt)
  {
    this.zzatQ = paramInt;
  }

  private void zzrH()
  {
    while (getSize() > getCapacity())
      this.zzatP.remove(0);
  }

  public void clear()
  {
    this.zzatP.clear();
  }

  public int getCapacity()
  {
    return this.zzatQ;
  }

  public int getSize()
  {
    return this.zzatP.size();
  }

  public boolean isEmpty()
  {
    return this.zzatP.isEmpty();
  }

  public void zza(zztj paramzztj, zztf paramzztf)
  {
    this.zzatP.add(new zza(paramzztj, paramzztf, null));
    zzrH();
  }

  public ArrayList<zza> zzrG()
  {
    return this.zzatP;
  }

  public static class zza
  {
    public final zztj zzatR;
    public final zztf zzatS;
    public final zzxf.zzd zzatT;

    private zza(zztj paramzztj, zztf paramzztf)
    {
      this.zzatR = ((zztj)zzx.zzl(paramzztj));
      this.zzatS = ((zztf)zzx.zzl(paramzztf));
      this.zzatT = null;
    }
  }
}