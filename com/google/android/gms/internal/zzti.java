package com.google.android.gms.internal;

import android.os.Bundle;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;

public class zzti
  implements GoogleApiClient.ConnectionCallbacks, GoogleApiClient.OnConnectionFailedListener
{
  private zztl zzatK;
  private final zztd.zza zzatU;
  private boolean zzatV;

  public zzti(zztd.zza paramzza)
  {
    this.zzatU = paramzza;
    this.zzatK = null;
    this.zzatV = true;
  }

  public void onConnected(Bundle paramBundle)
  {
    this.zzatK.zzae(false);
    if ((this.zzatV) && (this.zzatU != null))
      this.zzatU.zzrE();
    this.zzatV = false;
  }

  public void onConnectionFailed(ConnectionResult paramConnectionResult)
  {
    this.zzatK.zzae(true);
    if ((this.zzatV) && (this.zzatU != null))
    {
      if (!paramConnectionResult.hasResolution())
        break label48;
      this.zzatU.zzf(paramConnectionResult.getResolution());
    }
    while (true)
    {
      this.zzatV = false;
      return;
      label48: this.zzatU.zzrF();
    }
  }

  public void onConnectionSuspended(int paramInt)
  {
    this.zzatK.zzae(true);
  }

  public void zza(zztl paramzztl)
  {
    this.zzatK = paramzztl;
  }

  public void zzad(boolean paramBoolean)
  {
    this.zzatV = paramBoolean;
  }
}