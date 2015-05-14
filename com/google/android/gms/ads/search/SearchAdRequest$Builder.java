package com.google.android.gms.ads.search;

import android.graphics.Color;
import android.location.Location;
import android.os.Bundle;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.internal.zzbo.zza;

public final class SearchAdRequest$Builder
{
  private int zzAA;
  private int zzAB;
  private int zzAC;
  private int zzAD;
  private int zzAE = 0;
  private int zzAF;
  private String zzAG;
  private int zzAH;
  private String zzAI;
  private int zzAJ;
  private int zzAK;
  private String zzAL;
  private int zzAy;
  private int zzAz;
  private final zzbo.zza zzlh = new zzbo.zza();

  public Builder addCustomEventExtrasBundle(Class<? extends CustomEvent> paramClass, Bundle paramBundle)
  {
    this.zzlh.zzb(paramClass, paramBundle);
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

  public SearchAdRequest build()
  {
    return new SearchAdRequest(this, null);
  }

  public Builder setAnchorTextColor(int paramInt)
  {
    this.zzAy = paramInt;
    return this;
  }

  public Builder setBackgroundColor(int paramInt)
  {
    this.zzAz = paramInt;
    this.zzAA = Color.argb(0, 0, 0, 0);
    this.zzAB = Color.argb(0, 0, 0, 0);
    return this;
  }

  public Builder setBackgroundGradient(int paramInt1, int paramInt2)
  {
    this.zzAz = Color.argb(0, 0, 0, 0);
    this.zzAA = paramInt2;
    this.zzAB = paramInt1;
    return this;
  }

  public Builder setBorderColor(int paramInt)
  {
    this.zzAC = paramInt;
    return this;
  }

  public Builder setBorderThickness(int paramInt)
  {
    this.zzAD = paramInt;
    return this;
  }

  public Builder setBorderType(int paramInt)
  {
    this.zzAE = paramInt;
    return this;
  }

  public Builder setCallButtonColor(int paramInt)
  {
    this.zzAF = paramInt;
    return this;
  }

  public Builder setCustomChannels(String paramString)
  {
    this.zzAG = paramString;
    return this;
  }

  public Builder setDescriptionTextColor(int paramInt)
  {
    this.zzAH = paramInt;
    return this;
  }

  public Builder setFontFace(String paramString)
  {
    this.zzAI = paramString;
    return this;
  }

  public Builder setHeaderTextColor(int paramInt)
  {
    this.zzAJ = paramInt;
    return this;
  }

  public Builder setHeaderTextSize(int paramInt)
  {
    this.zzAK = paramInt;
    return this;
  }

  public Builder setLocation(Location paramLocation)
  {
    this.zzlh.zza(paramLocation);
    return this;
  }

  public Builder setQuery(String paramString)
  {
    this.zzAL = paramString;
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