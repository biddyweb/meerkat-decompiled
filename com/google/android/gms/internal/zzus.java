package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api.ApiOptions.Optional;
import com.google.android.gms.common.api.GoogleApiClient.ServerAuthCodeCallbacks;
import com.google.android.gms.common.internal.zzx;

public final class zzus
  implements Api.ApiOptions.Optional
{
  public static final zzus zzawP = new zza().zzsy();
  private final boolean zzawQ;
  private final boolean zzawR;
  private final String zzawS;
  private final GoogleApiClient.ServerAuthCodeCallbacks zzawT;

  private zzus(boolean paramBoolean1, boolean paramBoolean2, String paramString, GoogleApiClient.ServerAuthCodeCallbacks paramServerAuthCodeCallbacks)
  {
    this.zzawQ = paramBoolean1;
    this.zzawR = paramBoolean2;
    this.zzawS = paramString;
    this.zzawT = paramServerAuthCodeCallbacks;
  }

  public String zzrN()
  {
    return this.zzawS;
  }

  public boolean zzsv()
  {
    return this.zzawQ;
  }

  public boolean zzsw()
  {
    return this.zzawR;
  }

  public GoogleApiClient.ServerAuthCodeCallbacks zzsx()
  {
    return this.zzawT;
  }

  public static final class zza
  {
    private String zzauh;
    private boolean zzawU;
    private boolean zzawV;
    private GoogleApiClient.ServerAuthCodeCallbacks zzawW;

    private String zzcH(String paramString)
    {
      zzx.zzl(paramString);
      if ((this.zzauh == null) || (this.zzauh.equals(paramString)));
      for (boolean bool = true; ; bool = false)
      {
        zzx.zzb(bool, "two different server client ids provided");
        return paramString;
      }
    }

    public zza zza(String paramString, GoogleApiClient.ServerAuthCodeCallbacks paramServerAuthCodeCallbacks)
    {
      this.zzawU = true;
      this.zzawV = true;
      this.zzauh = zzcH(paramString);
      this.zzawW = ((GoogleApiClient.ServerAuthCodeCallbacks)zzx.zzl(paramServerAuthCodeCallbacks));
      return this;
    }

    public zzus zzsy()
    {
      return new zzus(this.zzawU, this.zzawV, this.zzauh, this.zzawW, null);
    }
  }
}