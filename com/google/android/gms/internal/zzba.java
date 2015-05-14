package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.os.Parcel;
import android.util.DisplayMetrics;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.zza;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

@zzgi
public final class zzba
  implements SafeParcelable
{
  public static final zzbb CREATOR = new zzbb();
  public final int height;
  public final int heightPixels;
  public final int versionCode;
  public final int width;
  public final int widthPixels;
  public final String zzpa;
  public final boolean zzpb;
  public final zzba[] zzpc;

  public zzba()
  {
    this(2, "interstitial_mb", 0, 0, true, 0, 0, null);
  }

  zzba(int paramInt1, String paramString, int paramInt2, int paramInt3, boolean paramBoolean, int paramInt4, int paramInt5, zzba[] paramArrayOfzzba)
  {
    this.versionCode = paramInt1;
    this.zzpa = paramString;
    this.height = paramInt2;
    this.heightPixels = paramInt3;
    this.zzpb = paramBoolean;
    this.width = paramInt4;
    this.widthPixels = paramInt5;
    this.zzpc = paramArrayOfzzba;
  }

  public zzba(Context paramContext, AdSize paramAdSize)
  {
    this(paramContext, new AdSize[] { paramAdSize });
  }

  public zzba(Context paramContext, AdSize[] paramArrayOfAdSize)
  {
    AdSize localAdSize = paramArrayOfAdSize[0];
    this.versionCode = 2;
    this.zzpb = false;
    this.width = localAdSize.getWidth();
    this.height = localAdSize.getHeight();
    int j;
    int k;
    label62: DisplayMetrics localDisplayMetrics;
    int n;
    label99: int i1;
    if (this.width == -1)
    {
      j = 1;
      if (this.height != -2)
        break label219;
      k = 1;
      localDisplayMetrics = paramContext.getResources().getDisplayMetrics();
      if (j == 0)
        break label225;
      this.widthPixels = zza(localDisplayMetrics);
      n = (int)(this.widthPixels / localDisplayMetrics.density);
      if (k == 0)
        break label254;
      i1 = zzc(localDisplayMetrics);
      label111: this.heightPixels = zzbe.zzbD().zza(localDisplayMetrics, i1);
      if ((j == 0) && (k == 0))
        break label263;
    }
    label263: for (this.zzpa = (n + "x" + i1 + "_as"); ; this.zzpa = localAdSize.toString())
    {
      if (paramArrayOfAdSize.length <= 1)
        break label275;
      this.zzpc = new zzba[paramArrayOfAdSize.length];
      while (i < paramArrayOfAdSize.length)
      {
        this.zzpc[i] = new zzba(paramContext, paramArrayOfAdSize[i]);
        i++;
      }
      j = 0;
      break;
      label219: k = 0;
      break label62;
      label225: int m = this.width;
      this.widthPixels = zzbe.zzbD().zza(localDisplayMetrics, this.width);
      n = m;
      break label99;
      label254: i1 = this.height;
      break label111;
    }
    label275: this.zzpc = null;
  }

  public zzba(zzba paramzzba, zzba[] paramArrayOfzzba)
  {
    this(2, paramzzba.zzpa, paramzzba.height, paramzzba.heightPixels, paramzzba.zzpb, paramzzba.width, paramzzba.widthPixels, paramArrayOfzzba);
  }

  public static int zza(DisplayMetrics paramDisplayMetrics)
  {
    return paramDisplayMetrics.widthPixels;
  }

  public static int zzb(DisplayMetrics paramDisplayMetrics)
  {
    return (int)(zzc(paramDisplayMetrics) * paramDisplayMetrics.density);
  }

  private static int zzc(DisplayMetrics paramDisplayMetrics)
  {
    int i = (int)(paramDisplayMetrics.heightPixels / paramDisplayMetrics.density);
    if (i <= 400)
      return 32;
    if (i <= 720)
      return 50;
    return 90;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzbb.zza(this, paramParcel, paramInt);
  }

  public AdSize zzbB()
  {
    return zza.zza(this.width, this.height, this.zzpa);
  }
}