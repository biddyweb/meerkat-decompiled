package com.google.android.gms.internal;

import android.content.Intent;
import android.os.Bundle;
import android.os.IBinder;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zzd.zza;
import com.google.android.gms.dynamic.zze;

@zzgi
public final class zzeo
  implements SafeParcelable
{
  public static final zzen CREATOR = new zzen();
  public final int orientation;
  public final int versionCode;
  public final zzhy zzlP;
  public final String zztR;
  public final zzek zzun;
  public final zzat zzuo;
  public final zzep zzup;
  public final zzic zzuq;
  public final zzct zzur;
  public final String zzus;
  public final boolean zzut;
  public final String zzuu;
  public final zzes zzuv;
  public final int zzuw;
  public final zzcw zzux;
  public final String zzuy;
  public final zzx zzuz;

  zzeo(int paramInt1, zzek paramzzek, IBinder paramIBinder1, IBinder paramIBinder2, IBinder paramIBinder3, IBinder paramIBinder4, String paramString1, boolean paramBoolean, String paramString2, IBinder paramIBinder5, int paramInt2, int paramInt3, String paramString3, zzhy paramzzhy, IBinder paramIBinder6, String paramString4, zzx paramzzx)
  {
    this.versionCode = paramInt1;
    this.zzun = paramzzek;
    this.zzuo = ((zzat)zze.zzf(zzd.zza.zzau(paramIBinder1)));
    this.zzup = ((zzep)zze.zzf(zzd.zza.zzau(paramIBinder2)));
    this.zzuq = ((zzic)zze.zzf(zzd.zza.zzau(paramIBinder3)));
    this.zzur = ((zzct)zze.zzf(zzd.zza.zzau(paramIBinder4)));
    this.zzus = paramString1;
    this.zzut = paramBoolean;
    this.zzuu = paramString2;
    this.zzuv = ((zzes)zze.zzf(zzd.zza.zzau(paramIBinder5)));
    this.orientation = paramInt2;
    this.zzuw = paramInt3;
    this.zztR = paramString3;
    this.zzlP = paramzzhy;
    this.zzux = ((zzcw)zze.zzf(zzd.zza.zzau(paramIBinder6)));
    this.zzuy = paramString4;
    this.zzuz = paramzzx;
  }

  public zzeo(zzat paramzzat, zzep paramzzep, zzct paramzzct, zzes paramzzes, zzic paramzzic, boolean paramBoolean, int paramInt, String paramString, zzhy paramzzhy, zzcw paramzzcw)
  {
    this.versionCode = 4;
    this.zzun = null;
    this.zzuo = paramzzat;
    this.zzup = paramzzep;
    this.zzuq = paramzzic;
    this.zzur = paramzzct;
    this.zzus = null;
    this.zzut = paramBoolean;
    this.zzuu = null;
    this.zzuv = paramzzes;
    this.orientation = paramInt;
    this.zzuw = 3;
    this.zztR = paramString;
    this.zzlP = paramzzhy;
    this.zzux = paramzzcw;
    this.zzuy = null;
    this.zzuz = null;
  }

  public zzeo(zzat paramzzat, zzep paramzzep, zzct paramzzct, zzes paramzzes, zzic paramzzic, boolean paramBoolean, int paramInt, String paramString1, String paramString2, zzhy paramzzhy, zzcw paramzzcw)
  {
    this.versionCode = 4;
    this.zzun = null;
    this.zzuo = paramzzat;
    this.zzup = paramzzep;
    this.zzuq = paramzzic;
    this.zzur = paramzzct;
    this.zzus = paramString2;
    this.zzut = paramBoolean;
    this.zzuu = paramString1;
    this.zzuv = paramzzes;
    this.orientation = paramInt;
    this.zzuw = 3;
    this.zztR = null;
    this.zzlP = paramzzhy;
    this.zzux = paramzzcw;
    this.zzuy = null;
    this.zzuz = null;
  }

  public zzeo(zzat paramzzat, zzep paramzzep, zzes paramzzes, zzic paramzzic, int paramInt, zzhy paramzzhy, String paramString, zzx paramzzx)
  {
    this.versionCode = 4;
    this.zzun = null;
    this.zzuo = paramzzat;
    this.zzup = paramzzep;
    this.zzuq = paramzzic;
    this.zzur = null;
    this.zzus = null;
    this.zzut = false;
    this.zzuu = null;
    this.zzuv = paramzzes;
    this.orientation = paramInt;
    this.zzuw = 1;
    this.zztR = null;
    this.zzlP = paramzzhy;
    this.zzux = null;
    this.zzuy = paramString;
    this.zzuz = paramzzx;
  }

  public zzeo(zzat paramzzat, zzep paramzzep, zzes paramzzes, zzic paramzzic, boolean paramBoolean, int paramInt, zzhy paramzzhy)
  {
    this.versionCode = 4;
    this.zzun = null;
    this.zzuo = paramzzat;
    this.zzup = paramzzep;
    this.zzuq = paramzzic;
    this.zzur = null;
    this.zzus = null;
    this.zzut = paramBoolean;
    this.zzuu = null;
    this.zzuv = paramzzes;
    this.orientation = paramInt;
    this.zzuw = 2;
    this.zztR = null;
    this.zzlP = paramzzhy;
    this.zzux = null;
    this.zzuy = null;
    this.zzuz = null;
  }

  public zzeo(zzek paramzzek, zzat paramzzat, zzep paramzzep, zzes paramzzes, zzhy paramzzhy)
  {
    this.versionCode = 4;
    this.zzun = paramzzek;
    this.zzuo = paramzzat;
    this.zzup = paramzzep;
    this.zzuq = null;
    this.zzur = null;
    this.zzus = null;
    this.zzut = false;
    this.zzuu = null;
    this.zzuv = paramzzes;
    this.orientation = -1;
    this.zzuw = 4;
    this.zztR = null;
    this.zzlP = paramzzhy;
    this.zzux = null;
    this.zzuy = null;
    this.zzuz = null;
  }

  public static void zza(Intent paramIntent, zzeo paramzzeo)
  {
    Bundle localBundle = new Bundle(1);
    localBundle.putParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", paramzzeo);
    paramIntent.putExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo", localBundle);
  }

  public static zzeo zzb(Intent paramIntent)
  {
    try
    {
      Bundle localBundle = paramIntent.getBundleExtra("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
      localBundle.setClassLoader(zzeo.class.getClassLoader());
      zzeo localzzeo = (zzeo)localBundle.getParcelable("com.google.android.gms.ads.inernal.overlay.AdOverlayInfo");
      return localzzeo;
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
    zzen.zza(this, paramParcel, paramInt);
  }

  IBinder zzdi()
  {
    return zze.zzn(this.zzuo).asBinder();
  }

  IBinder zzdj()
  {
    return zze.zzn(this.zzup).asBinder();
  }

  IBinder zzdk()
  {
    return zze.zzn(this.zzuq).asBinder();
  }

  IBinder zzdl()
  {
    return zze.zzn(this.zzur).asBinder();
  }

  IBinder zzdm()
  {
    return zze.zzn(this.zzux).asBinder();
  }

  IBinder zzdn()
  {
    return zze.zzn(this.zzuv).asBinder();
  }
}