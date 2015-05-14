package com.google.android.gms.ads.search;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.internal.zzbo;

public final class SearchAdRequest
{
  public static final int BORDER_TYPE_DASHED = 1;
  public static final int BORDER_TYPE_DOTTED = 2;
  public static final int BORDER_TYPE_NONE = 0;
  public static final int BORDER_TYPE_SOLID = 3;
  public static final int CALL_BUTTON_COLOR_DARK = 2;
  public static final int CALL_BUTTON_COLOR_LIGHT = 0;
  public static final int CALL_BUTTON_COLOR_MEDIUM = 1;
  public static final String DEVICE_ID_EMULATOR = zzbo.DEVICE_ID_EMULATOR;
  public static final int ERROR_CODE_INTERNAL_ERROR = 0;
  public static final int ERROR_CODE_INVALID_REQUEST = 1;
  public static final int ERROR_CODE_NETWORK_ERROR = 2;
  public static final int ERROR_CODE_NO_FILL = 3;
  private final int zzAA;
  private final int zzAB;
  private final int zzAC;
  private final int zzAD;
  private final int zzAE;
  private final int zzAF;
  private final String zzAG;
  private final int zzAH;
  private final String zzAI;
  private final int zzAJ;
  private final int zzAK;
  private final String zzAL;
  private final int zzAy;
  private final int zzAz;
  private final zzbo zzlg;

  private SearchAdRequest(SearchAdRequest.Builder paramBuilder)
  {
    this.zzAy = SearchAdRequest.Builder.zza(paramBuilder);
    this.zzAz = SearchAdRequest.Builder.zzb(paramBuilder);
    this.zzAA = SearchAdRequest.Builder.zzc(paramBuilder);
    this.zzAB = SearchAdRequest.Builder.zzd(paramBuilder);
    this.zzAC = SearchAdRequest.Builder.zze(paramBuilder);
    this.zzAD = SearchAdRequest.Builder.zzf(paramBuilder);
    this.zzAE = SearchAdRequest.Builder.zzg(paramBuilder);
    this.zzAF = SearchAdRequest.Builder.zzh(paramBuilder);
    this.zzAG = SearchAdRequest.Builder.zzi(paramBuilder);
    this.zzAH = SearchAdRequest.Builder.zzj(paramBuilder);
    this.zzAI = SearchAdRequest.Builder.zzk(paramBuilder);
    this.zzAJ = SearchAdRequest.Builder.zzl(paramBuilder);
    this.zzAK = SearchAdRequest.Builder.zzm(paramBuilder);
    this.zzAL = SearchAdRequest.Builder.zzn(paramBuilder);
    this.zzlg = new zzbo(SearchAdRequest.Builder.zzo(paramBuilder), this);
  }

  public int getAnchorTextColor()
  {
    return this.zzAy;
  }

  public int getBackgroundColor()
  {
    return this.zzAz;
  }

  public int getBackgroundGradientBottom()
  {
    return this.zzAA;
  }

  public int getBackgroundGradientTop()
  {
    return this.zzAB;
  }

  public int getBorderColor()
  {
    return this.zzAC;
  }

  public int getBorderThickness()
  {
    return this.zzAD;
  }

  public int getBorderType()
  {
    return this.zzAE;
  }

  public int getCallButtonColor()
  {
    return this.zzAF;
  }

  public String getCustomChannels()
  {
    return this.zzAG;
  }

  public <T extends CustomEvent> Bundle getCustomEventExtrasBundle(Class<T> paramClass)
  {
    return this.zzlg.getCustomEventExtrasBundle(paramClass);
  }

  public int getDescriptionTextColor()
  {
    return this.zzAH;
  }

  public String getFontFace()
  {
    return this.zzAI;
  }

  public int getHeaderTextColor()
  {
    return this.zzAJ;
  }

  public int getHeaderTextSize()
  {
    return this.zzAK;
  }

  public Location getLocation()
  {
    return this.zzlg.getLocation();
  }

  @Deprecated
  public <T extends NetworkExtras> T getNetworkExtras(Class<T> paramClass)
  {
    return this.zzlg.getNetworkExtras(paramClass);
  }

  public <T extends MediationAdapter> Bundle getNetworkExtrasBundle(Class<T> paramClass)
  {
    return this.zzlg.getNetworkExtrasBundle(paramClass);
  }

  public String getQuery()
  {
    return this.zzAL;
  }

  public boolean isTestDevice(Context paramContext)
  {
    return this.zzlg.isTestDevice(paramContext);
  }

  zzbo zzY()
  {
    return this.zzlg;
  }
}