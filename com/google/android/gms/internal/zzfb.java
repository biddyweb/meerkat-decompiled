package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.dynamic.zze;

@zzgi
public final class zzfb
  implements SafeParcelable
{
  public static final zzfa CREATOR = new zzfa();
  public final int versionCode;
  public final zzfl zzmg;
  public final zzfn zzuS;
  public final Context zzuT;
  public final zzfk zzuU;

  zzfb(int paramInt, IBinder paramIBinder1, IBinder paramIBinder2, IBinder paramIBinder3, IBinder paramIBinder4)
  {
    this.versionCode = paramInt;
    this.zzmg = ((zzfl)zze.zzf(zzd.zza.zzau(paramIBinder1)));
    this.zzuS = ((zzfn)zze.zzf(zzd.zza.zzau(paramIBinder2)));
    this.zzuT = ((Context)zze.zzf(zzd.zza.zzau(paramIBinder3)));
    this.zzuU = ((zzfk)zze.zzf(zzd.zza.zzau(paramIBinder4)));
  }

  public zzfb(Context paramContext, zzfl paramzzfl, zzfn paramzzfn, zzfk paramzzfk)
  {
    this.versionCode = 2;
    this.zzuT = paramContext;
    this.zzmg = paramzzfl;
    this.zzuS = paramzzfn;
    this.zzuU = paramzzfk;
  }

  public static void zza(Intent paramIntent, zzfb paramzzfb)
  {
    Bundle localBundle = new Bundle(1);
    localBundle.putParcelable("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo", paramzzfb);
    paramIntent.putExtra("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo", localBundle);
  }

  public static zzfb zzc(Intent paramIntent)
  {
    try
    {
      Bundle localBundle = paramIntent.getBundleExtra("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo");
      localBundle.setClassLoader(zzfb.class.getClassLoader());
      zzfb localzzfb = (zzfb)localBundle.getParcelable("com.google.android.gms.ads.internal.purchase.InAppPurchaseManagerInfo");
      return localzzfb;
    }
    catch (Exception localException)
    {
    }
    return null;
  }

  public int describeContents()
  {
    return 0;
  }

  public void writeToParcel(Parcel paramParcel, int paramInt)
  {
    zzfa.zza(this, paramParcel, paramInt);
  }

  IBinder zzds()
  {
    return zze.zzn(this.zzuU).asBinder();
  }

  IBinder zzdt()
  {
    return zze.zzn(this.zzmg).asBinder();
  }

  IBinder zzdu()
  {
    return zze.zzn(this.zzuS).asBinder();
  }

  IBinder zzdv()
  {
    return zze.zzn(this.zzuT).asBinder();
  }
}