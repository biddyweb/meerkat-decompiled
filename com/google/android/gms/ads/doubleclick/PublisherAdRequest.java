package com.google.android.gms.ads.doubleclick;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.android.gms.ads.mediation.MediationAdapter;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import com.google.android.gms.internal.zzbo;
import java.util.Date;
import java.util.Set;

public final class PublisherAdRequest
{
  public static final String DEVICE_ID_EMULATOR = zzbo.DEVICE_ID_EMULATOR;
  public static final int ERROR_CODE_INTERNAL_ERROR = 0;
  public static final int ERROR_CODE_INVALID_REQUEST = 1;
  public static final int ERROR_CODE_NETWORK_ERROR = 2;
  public static final int ERROR_CODE_NO_FILL = 3;
  public static final int GENDER_FEMALE = 2;
  public static final int GENDER_MALE = 1;
  public static final int GENDER_UNKNOWN;
  private final zzbo zzlg;

  private PublisherAdRequest(PublisherAdRequest.Builder paramBuilder)
  {
    this.zzlg = new zzbo(PublisherAdRequest.Builder.zza(paramBuilder));
  }

  public static void updateCorrelator()
  {
    zzbo.updateCorrelator();
  }

  public Date getBirthday()
  {
    return this.zzlg.getBirthday();
  }

  public String getContentUrl()
  {
    return this.zzlg.getContentUrl();
  }

  public <T extends CustomEvent> Bundle getCustomEventExtrasBundle(Class<T> paramClass)
  {
    return this.zzlg.getCustomEventExtrasBundle(paramClass);
  }

  public Bundle getCustomTargeting()
  {
    return this.zzlg.getCustomTargeting();
  }

  public int getGender()
  {
    return this.zzlg.getGender();
  }

  public Set<String> getKeywords()
  {
    return this.zzlg.getKeywords();
  }

  public Location getLocation()
  {
    return this.zzlg.getLocation();
  }

  public boolean getManualImpressionsEnabled()
  {
    return this.zzlg.getManualImpressionsEnabled();
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

  public String getPublisherProvidedId()
  {
    return this.zzlg.getPublisherProvidedId();
  }

  public boolean isTestDevice(Context paramContext)
  {
    return this.zzlg.isTestDevice(paramContext);
  }

  public zzbo zzY()
  {
    return this.zzlg;
  }
}