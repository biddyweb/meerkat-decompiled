package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.mediation.MediationServerParameters;
import com.google.android.gms.ads.mediation.customevent.CustomEvent;
import java.util.Map;

@zzgi
public final class zzdq extends zzdr.zza
{
  private Map<Class<? extends com.google.android.gms.ads.mediation.NetworkExtras>, com.google.android.gms.ads.mediation.NetworkExtras> zzsP;

  private <NETWORK_EXTRAS extends com.google.ads.mediation.NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> zzds zzD(String paramString)
    throws RemoteException
  {
    try
    {
      Class localClass = Class.forName(paramString, false, zzdq.class.getClassLoader());
      if (com.google.ads.mediation.MediationAdapter.class.isAssignableFrom(localClass))
      {
        com.google.ads.mediation.MediationAdapter localMediationAdapter = (com.google.ads.mediation.MediationAdapter)localClass.newInstance();
        return new zzdx(localMediationAdapter, (com.google.ads.mediation.NetworkExtras)this.zzsP.get(localMediationAdapter.getAdditionalParametersType()));
      }
      if (com.google.android.gms.ads.mediation.MediationAdapter.class.isAssignableFrom(localClass))
        return new zzdv((com.google.android.gms.ads.mediation.MediationAdapter)localClass.newInstance());
      zzhx.zzac("Could not instantiate mediation adapter: " + paramString + " (not a valid adapter).");
      throw new RemoteException();
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzac("Could not instantiate mediation adapter: " + paramString + ". " + localThrowable.getMessage());
    }
    throw new RemoteException();
  }

  public zzds zzB(String paramString)
    throws RemoteException
  {
    return zzD(paramString);
  }

  public boolean zzC(String paramString)
    throws RemoteException
  {
    try
    {
      boolean bool = CustomEvent.class.isAssignableFrom(Class.forName(paramString, false, zzdq.class.getClassLoader()));
      return bool;
    }
    catch (Throwable localThrowable)
    {
      zzhx.zzac("Could not load custom event implementation class: " + paramString + ", assuming old implementation.");
    }
    return false;
  }

  public void zze(Map<Class<? extends com.google.android.gms.ads.mediation.NetworkExtras>, com.google.android.gms.ads.mediation.NetworkExtras> paramMap)
  {
    this.zzsP = paramMap;
  }
}