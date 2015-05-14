package com.google.android.gms.drive.internal;

import com.google.android.gms.internal.zzwq;
import com.google.android.gms.internal.zzwr;
import com.google.android.gms.internal.zzws;
import java.io.IOException;

public final class zzam extends zzws<zzam>
{
  public int versionCode;
  public long zzUF;
  public long zzUG;
  public long zzUH;

  public zzam()
  {
    zzkJ();
  }

  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if (paramObject == this)
      bool2 = true;
    zzam localzzam;
    boolean bool5;
    do
    {
      boolean bool4;
      do
      {
        boolean bool3;
        do
        {
          int i;
          int j;
          do
          {
            boolean bool1;
            do
            {
              return bool2;
              bool1 = paramObject instanceof zzam;
              bool2 = false;
            }
            while (!bool1);
            localzzam = (zzam)paramObject;
            i = this.versionCode;
            j = localzzam.versionCode;
            bool2 = false;
          }
          while (i != j);
          bool3 = this.zzUF < localzzam.zzUF;
          bool2 = false;
        }
        while (bool3);
        bool4 = this.zzUG < localzzam.zzUG;
        bool2 = false;
      }
      while (bool4);
      bool5 = this.zzUH < localzzam.zzUH;
      bool2 = false;
    }
    while (bool5);
    return zza(localzzam);
  }

  public int hashCode()
  {
    return 31 * (31 * (31 * (31 * (527 + this.versionCode) + (int)(this.zzUF ^ this.zzUF >>> 32)) + (int)(this.zzUG ^ this.zzUG >>> 32)) + (int)(this.zzUH ^ this.zzUH >>> 32)) + zzvL();
  }

  public void zza(zzwr paramzzwr)
    throws IOException
  {
    paramzzwr.zzy(1, this.versionCode);
    paramzzwr.zzc(2, this.zzUF);
    paramzzwr.zzc(3, this.zzUG);
    paramzzwr.zzc(4, this.zzUH);
    super.zza(paramzzwr);
  }

  protected int zzc()
  {
    return super.zzc() + zzwr.zzA(1, this.versionCode) + zzwr.zze(2, this.zzUF) + zzwr.zze(3, this.zzUG) + zzwr.zze(4, this.zzUH);
  }

  public zzam zzkJ()
  {
    this.versionCode = 1;
    this.zzUF = -1L;
    this.zzUG = -1L;
    this.zzUH = -1L;
    this.zzaHB = null;
    this.zzaHM = -1;
    return this;
  }

  public zzam zzm(zzwq paramzzwq)
    throws IOException
  {
    while (true)
    {
      int i = paramzzwq.zzvu();
      switch (i)
      {
      default:
        if (zza(paramzzwq, i))
          continue;
      case 0:
        return this;
      case 8:
        this.versionCode = paramzzwq.zzvx();
        break;
      case 16:
        this.zzUF = paramzzwq.zzvA();
        break;
      case 24:
        this.zzUG = paramzzwq.zzvA();
        break;
      case 32:
      }
      this.zzUH = paramzzwq.zzvA();
    }
  }
}