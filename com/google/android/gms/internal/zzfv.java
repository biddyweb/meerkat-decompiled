package com.google.android.gms.internal;

import android.content.Intent;
import android.os.RemoteException;
import com.google.android.gms.ads.purchase.InAppPurchaseResult;

@zzgi
public class zzfv
  implements InAppPurchaseResult
{
  private final zzfr zzvx;

  public zzfv(zzfr paramzzfr)
  {
    this.zzvx = paramzzfr;
  }

  public void finishPurchase()
  {
    try
    {
      this.zzvx.finishPurchase();
      return;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward finishPurchase to InAppPurchaseResult", localRemoteException);
    }
  }

  public String getProductId()
  {
    try
    {
      String str = this.zzvx.getProductId();
      return str;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward getProductId to InAppPurchaseResult", localRemoteException);
    }
    return null;
  }

  public Intent getPurchaseData()
  {
    try
    {
      Intent localIntent = this.zzvx.getPurchaseData();
      return localIntent;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward getPurchaseData to InAppPurchaseResult", localRemoteException);
    }
    return null;
  }

  public int getResultCode()
  {
    try
    {
      int i = this.zzvx.getResultCode();
      return i;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward getPurchaseData to InAppPurchaseResult", localRemoteException);
    }
    return 0;
  }

  public boolean isVerified()
  {
    try
    {
      boolean bool = this.zzvx.isVerified();
      return bool;
    }
    catch (RemoteException localRemoteException)
    {
      zzhx.zzd("Could not forward isVerified to InAppPurchaseResult", localRemoteException);
    }
    return false;
  }
}