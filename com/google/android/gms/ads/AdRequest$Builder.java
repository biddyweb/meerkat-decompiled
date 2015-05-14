package com.google.android.gms.ads;

import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzbo.zza;
import java.util.Date;

public final class AdRequest$Builder
{
  private final zzbo.zza zzlh = new zzbo.zza();

  public AdRequest$Builder()
  {
    this.zzlh.zzs(AdRequest.DEVICE_ID_EMULATOR);
  }

  public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
  {
    this.zzlh.zzb(paramClass, paramBundle);
    return this;
  }

  public Builder addKeyword(String paramString)
  {
    this.zzlh.zzr(paramString);
    return this;
  }

  public Builder addNetworkExtras(NetworkExtras paramNetworkExtras)
  {
    this.zzlh.zza(paramNetworkExtras);
    return this;
  }

  public Builder addNetworkExtrasBundle(Class<? extends MediationAdapter> paramClass, Bundle paramBundle)
  {
    this.zzlh.zza(paramClass, paramBundle);
    if ((paramClass.equals(AdMobAdapter.class)) && (paramBundle.getBoolean("_emulatorLiveAds")))
      this.zzlh.zzt(AdRequest.DEVICE_ID_EMULATOR);
    return this;
  }

  public Builder addTestDevice(String paramString)
  {
    this.zzlh.zzs(paramString);
    return this;
  }

  public AdRequest build()
  {
    return new AdRequest(this, null);
  }

  public Builder setBirthday(Date paramDate)
  {
    this.zzlh.zza(paramDate);
    return this;
  }

  public Builder setContentUrl(String paramString)
  {
    zzx.zzb(paramString, "Content URL must be non-null.");
    zzx.zzb(paramString, "Content URL must be non-empty.");
    if (paramString.length() <= 512);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(512);
      arrayOfObject[1] = Integer.valueOf(paramString.length());
      zzx.zzb(bool, "Content URL must not exceed %d in length.  Provided length was %d.", arrayOfObject);
      this.zzlh.zzu(paramString);
      return this;
    }
  }

  public Builder setGender(int paramInt)
  {
    this.zzlh.zzh(paramInt);
    return this;
  }

  public Builder setLocation(Location paramLocation)
  {
    this.zzlh.zza(paramLocation);
    return this;
  }

  public Builder setRequestAgent(String paramString)
  {
    this.zzlh.zzw(paramString);
    return this;
  }

  public Builder tagForChildDirectedTreatment(boolean paramBoolean)
  {
    this.zzlh.zzk(paramBoolean);
    return this;
  }
}