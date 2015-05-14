package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.android.gms.ads.purchase.InAppPurchase;

@zzgi
public class zzfw
  implements InAppPurchase
{
  private final zzfn zzvi;

  public zzfw(zzfn paramzzfn)
  {
    this.zzvi = paramzzfn;
  }

  public String getProductId()
  {
    try
    {
      String str = this.zzvi.getProductId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward getProductId to InAppPurchase", localRemoteException);
    }
    return null;
  }

  public void recordPlayBillingResolution(int paramInt)
  {
    try
    {
      this.zzvi.recordPlayBillingResolution(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward recordPlayBillingResolution to InAppPurchase", localRemoteException);
    }
  }

  public void recordResolution(int paramInt)
  {
    try
    {
      this.zzvi.recordResolution(paramInt);
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward recordResolution to InAppPurchase", localRemoteException);
    }
  }
}