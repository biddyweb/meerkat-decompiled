package com.google.android.gms.security;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
import android.util.Log;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.zzx;
import java.lang.reflect.Method;

public class ProviderInstaller
{
  public static final String PROVIDER_NAME = "GmsCore_OpenSSL";
  private static Method zzawM = null;
  private static final Object zzmz = new Object();

  public static void installIfNeeded(Context paramContext)
    throws GooglePlayServicesRepairableException, GooglePlayServicesNotAvailableException
  {
    zzx.zzb(paramContext, "Context must not be null");
    GooglePlayServicesUtil.zzI(paramContext);
    Context localContext = GooglePlayServicesUtil.getRemoteContext(paramContext);
    if (localContext == null)
    {
      Log.e("ProviderInstaller", "Failed to get remote context");
      throw new GooglePlayServicesNotAvailableException(8);
    }
    synchronized (zzmz)
    {
      try
      {
        if (zzawM == null)
          zzai(localContext);
        zzawM.invoke(null, new Object[] { localContext });
        return;
      }
      catch (Exception localException)
      {
        Log.e("ProviderInstaller", "Failed to install provider: " + localException.getMessage());
        throw new GooglePlayServicesNotAvailableException(8);
      }
    }
  }

  public static void installIfNeededAsync(Context paramContext, final ProviderInstallListener paramProviderInstallListener)
  {
    zzx.zzb(paramContext, "Context must not be null");
    zzx.zzb(paramProviderInstallListener, "Listener must not be null");
    zzx.zzbd("Must be called on the UI thread");
    new AsyncTask()
    {
      protected Integer zzb(Void[] paramAnonymousArrayOfVoid)
      {
        try
        {
          ProviderInstaller.installIfNeeded(this.zznK);
          return Integer.valueOf(0);
        }
        catch (GooglePlayServicesRepairableException localGooglePlayServicesRepairableException)
        {
          return Integer.valueOf(localGooglePlayServicesRepairableException.getConnectionStatusCode());
        }
        catch (GooglePlayServicesNotAvailableException localGooglePlayServicesNotAvailableException)
        {
          return Integer.valueOf(localGooglePlayServicesNotAvailableException.errorCode);
        }
      }

      protected void zze(Integer paramAnonymousInteger)
      {
        if (paramAnonymousInteger.intValue() == 0)
        {
          paramProviderInstallListener.onProviderInstalled();
          return;
        }
        Intent localIntent = GooglePlayServicesUtil.zzan(paramAnonymousInteger.intValue());
        paramProviderInstallListener.onProviderInstallFailed(paramAnonymousInteger.intValue(), localIntent);
      }
    }
    .execute(new Void[0]);
  }

  private static void zzai(Context paramContext)
    throws ClassNotFoundException, NoSuchMethodException
  {
    zzawM = paramContext.getClassLoader().loadClass("com.google.android.gms.common.security.ProviderInstallerImpl").getMethod("insertProvider", new Class[] { Context.class });
  }

  public static abstract interface ProviderInstallListener
  {
    public abstract void onProviderInstallFailed(int paramInt, Intent paramIntent);

    public abstract void onProviderInstalled();
  }
}