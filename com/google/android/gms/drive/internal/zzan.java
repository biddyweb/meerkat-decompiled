package com.google.android.gms.drive.internal;

import com.google.android.gms.internal.zzwq;
import com.google.android.gms.internal.zzwr;
import com.google.android.gms.internal.zzws;
import com.google.android.gms.internal.zzwx;
import com.google.android.gms.internal.zzwy;
import java.io.IOException;

public final class zzan extends zzws<zzan>
{
  public int versionCode;
  public long zzUG;
  public String zzUI;
  public long zzUJ;
  public int zzUK;

  public zzan()
  {
    zzkK();
  }

  public static zzan zzh(byte[] paramArrayOfByte)
    throws zzwx
  {
    return (zzan)zzwy.zza(new zzan(), paramArrayOfByte);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool2;
    if (paramObject == this)
      bool2 = true;
    zzan localzzan;
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
          bool1 = paramObject instanceof zzan;
          bool2 = false;
        }
        while (!bool1);
        localzzan = (zzan)paramObject;
        i = this.versionCode;
        j = localzzan.versionCode;
        bool2 = false;
      }
      while (i != j);
      if (this.zzUI != null)
        break;
      str = localzzan.zzUI;
      bool2 = false;
    }
    while (str != null);
    while (this.zzUI.equals(localzzan.zzUI))
    {
      String str;
      boolean bool3 = this.zzUJ < localzzan.zzUJ;
      bool2 = false;
      if (bool3)
        break;
      boolean bool4 = this.zzUG < localzzan.zzUG;
      bool2 = false;
      if (bool4)
        break;
      int k = this.zzUK;
      int m = localzzan.zzUK;
      bool2 = false;
      if (k != m)
        break;
      return zza(localzzan);
    }
    return false;
  }

  public int hashCode()
  {
    int i = 31 * (527 + this.versionCode);
    if (this.zzUI == null);
    for (int j = 0; ; j = this.zzUI.hashCode())
      return 31 * (31 * (31 * (31 * (j + i) + (int)(this.zzUJ ^ this.zzUJ >>> 32)) + (int)(this.zzUG ^ this.zzUG >>> 32)) + this.zzUK) + zzvL();
  }

  public void zza(zzwr paramzzwr)
    throws IOException
  {
    paramzzwr.zzy(1, this.versionCode);
    paramzzwr.zzb(2, this.zzUI);
    paramzzwr.zzc(3, this.zzUJ);
    paramzzwr.zzc(4, this.zzUG);
    if (this.zzUK != -1)
      paramzzwr.zzy(5, this.zzUK);
    super.zza(paramzzwr);
  }

  protected int zzc()
  {
    int i = super.zzc() + zzwr.zzA(1, this.versionCode) + zzwr.zzj(2, this.zzUI) + zzwr.zze(3, this.zzUJ) + zzwr.zze(4, this.zzUG);
    if (this.zzUK != -1)
      i += zzwr.zzA(5, this.zzUK);
    return i;
  }

  public zzan zzkK()
  {
    this.versionCode = 1;
    this.zzUI = "";
    this.zzUJ = -1L;
    this.zzUG = -1L;
    this.zzUK = -1;
    this.zzaHB = null;
    this.zzaHM = -1;
    return this;
  }

  public zzan zzn(zzwq paramzzwq)
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
      case 18:
        this.zzUI = paramzzwq.readString();
        break;
      case 24:
        this.zzUJ = paramzzwq.zzvA();
        break;
      case 32:
        this.zzUG = paramzzwq.zzvA();
        break;
      case 40:
      }
      this.zzUK = paramzzwq.zzvx();
    }
  }
}