package com.google.android.gms.internal;

import android.os.RemoteException;
import android.view.View;
import com.google.android.gms.ads.doubleclick.CustomRenderedAd;
import com.google.android.gms.dynamic.zzd;
import com.google.android.gms.dynamic.zze;

@zzgi
public class zzch
  implements CustomRenderedAd
{
  private final zzci zzrj;

  public zzch(zzci paramzzci)
  {
    this.zzrj = paramzzci;
  }

  public String getBaseUrl()
  {
    try
    {
      String str = this.zzrj.zzcv();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not delegate getBaseURL to CustomRenderedAd", localRemoteException);
    }
    return null;
  }

  public String getContent()
  {
    try
    {
      String str = this.zzrj.getContent();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not delegate getContent to CustomRenderedAd", localRemoteException);
    }
    return null;
  }

  public void onAdRendered(View paramView)
  {
    try
    {
      zzci localzzci = this.zzrj;
      if (paramView != null);
      for (zzd localzzd = zze.zzn(paramView); ; localzzd = null)
      {
        localzzci.zza(localzzd);
        return;
      }
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not delegate onAdRendered to CustomRenderedAd", localRemoteException);
    }
  }

  public void recordClick()
  {
    try
    {
      this.zzrj.recordClick();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not delegate recordClick to CustomRenderedAd", localRemoteException);
    }
  }

  public void recordImpression()
  {
    try
    {
      this.zzrj.recordImpression();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not delegate recordImpression to CustomRenderedAd", localRemoteException);
    }
  }
}