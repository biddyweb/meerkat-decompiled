package com.google.android.gms.ads.doubleclick;

import android.location.Location;
import android.os.Bundle;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.common.internal.zzv;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzbo.zza;
import java.util.Date;
import java.util.List;

public final class PublisherAdRequest$Builder
{
  private final zzbo.zza zzlh = new zzbo.zza();

  public Builder addCategoryExclusion(String paramString)
  {
    this.zzlh.zzx(paramString);
    return this;
  }

  public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
  {
    this.zzlh.zzb(paramClass, paramBundle);
    return this;
  }

  public Builder addCustomTargeting(String paramString1, String paramString2)
  {
    this.zzlh.zzc(paramString1, paramString2);
    return this;
  }

  public Builder addCustomTargeting(String paramString, List<String> paramList)
  {
    if (paramList != null)
      this.zzlh.zzc(paramString, zzv.zzbm(",").zza(paramList));
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
    return this;
  }

  public Builder addTestDevice(String paramString)
  {
    this.zzlh.zzs(paramString);
    return this;
  }

  public PublisherAdRequest build()
  {
    return new PublisherAdRequest(this, null);
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

  public Builder setManualImpressionsEnabled(boolean paramBoolean)
  {
    this.zzlh.zzj(paramBoolean);
    return this;
  }

  public Builder setPublisherProvidedId(String paramString)
  {
    this.zzlh.zzv(paramString);
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