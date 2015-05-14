package com.google.android.gms.internal;

import android.content.Context;
import android.webkit.WebSettings;

class zzhp$zzd extends zzhp.zzf
{
  public String getDefaultUserAgent(Context paramContext)
  {
    return WebSettings.getDefaultUserAgent(paramContext);
  }

  public boolean zza(Context paramContext, WebSettings paramWebSettings)
  {
    super.zza(paramContext, paramWebSettings);
    paramWebSettings.setMediaPlaybackRequiresUserGesture(false);
    return true;
  }
}