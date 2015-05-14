package com.google.android.gms.common.data;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.common.internal.zzw;
import com.google.android.gms.common.internal.zzx;

public abstract class zzd
{
  protected final DataHolder zzMd;
  protected int zzNQ;
  private int zzNR;

  public zzd(DataHolder paramDataHolder, int paramInt)
  {
    this.zzMd = ((DataHolder)zzx.zzl(paramDataHolder));
    zzav(paramInt);
  }

  public boolean equals(Object paramObject)
  {
    boolean bool1 = paramObject instanceof zzd;
    boolean bool2 = false;
    if (bool1)
    {
      zzd localzzd = (zzd)paramObject;
      boolean bool3 = zzw.equal(Integer.valueOf(localzzd.zzNQ), Integer.valueOf(this.zzNQ));
      bool2 = false;
      if (bool3)
      {
        boolean bool4 = zzw.equal(Integer.valueOf(localzzd.zzNR), Integer.valueOf(this.zzNR));
        bool2 = false;
        if (bool4)
        {
          DataHolder localDataHolder1 = localzzd.zzMd;
          DataHolder localDataHolder2 = this.zzMd;
          bool2 = false;
          if (localDataHolder1 == localDataHolder2)
            bool2 = true;
        }
      }
    }
    return bool2;
  }

  protected boolean getBoolean(String paramString)
  {
    return this.zzMd.zzd(paramString, this.zzNQ, this.zzNR);
  }

  protected byte[] getByteArray(String paramString)
  {
    return this.zzMd.zzf(paramString, this.zzNQ, this.zzNR);
  }

  protected float getFloat(String paramString)
  {
    return this.zzMd.zze(paramString, this.zzNQ, this.zzNR);
  }

  protected int getInteger(String paramString)
  {
    return this.zzMd.zzb(paramString, this.zzNQ, this.zzNR);
  }

  protected long getLong(String paramString)
  {
    return this.zzMd.zza(paramString, this.zzNQ, this.zzNR);
  }

  protected String getString(String paramString)
  {
    return this.zzMd.zzc(paramString, this.zzNQ, this.zzNR);
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[3];
    arrayOfObject[0] = Integer.valueOf(this.zzNQ);
    arrayOfObject[1] = Integer.valueOf(this.zzNR);
    arrayOfObject[2] = this.zzMd;
    return zzw.hashCode(arrayOfObject);
  }

  public boolean isDataValid()
  {
    return !this.zzMd.isClosed();
  }

  protected void zza(String paramString, CharArrayBuffer paramCharArrayBuffer)
  {
    this.zzMd.zza(paramString, this.zzNQ, this.zzNR, paramCharArrayBuffer);
  }

  protected void zzav(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt < this.zzMd.getCount()));
    for (boolean bool = true; ; bool = false)
    {
      zzx.zzN(bool);
      this.zzNQ = paramInt;
      this.zzNR = this.zzMd.zzax(this.zzNQ);
      return;
    }
  }

  public boolean zzba(String paramString)
  {
    return this.zzMd.zzba(paramString);
  }

  protected Uri zzbb(String paramString)
  {
    return this.zzMd.zzg(paramString, this.zzNQ, this.zzNR);
  }

  protected boolean zzbc(String paramString)
  {
    return this.zzMd.zzh(paramString, this.zzNQ, this.zzNR);
  }

  protected int zzix()
  {
    return this.zzNQ;
  }
}