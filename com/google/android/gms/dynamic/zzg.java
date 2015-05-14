package com.google.android.gms.dynamic;

import android.content.Context;
import android.os.IBinder;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.internal.zzx;

public abstract class zzg<T>
{
  private final String zzYb;
  private T zzYc;

  protected zzg(String paramString)
  {
    this.zzYb = paramString;
  }

  protected final T zzS(Context paramContext)
    throws zzg.zza
  {
    ClassLoader localClassLoader;
    if (this.zzYc == null)
    {
      zzx.zzl(paramContext);
      Context localContext = GooglePlayServicesUtil.getRemoteContext(paramContext);
      if (localContext == null)
        throw new zza("Could not get remote context.");
      localClassLoader = localContext.getClassLoader();
    }
    try
    {
      this.zzYc = zzd((IBinder)localClassLoader.loadClass(this.zzYb).newInstance());
      return this.zzYc;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      throw new zza("Could not load creator class.", localClassNotFoundException);
    }
    catch (InstantiationException localInstantiationException)
    {
      throw new zza("Could not instantiate creator.", localInstantiationException);
    }
    catch (IllegalAccessException localIllegalAccessException)
    {
      throw new zza("Could not access creator.", localIllegalAccessException);
    }
  }

  protected abstract T zzd(IBinder paramIBinder);

  public static class zza extends Exception
  {
    public zza(String paramString)
    {
      super();
    }

    public zza(String paramString, Throwable paramThrowable)
    {
      super(paramThrowable);
    }
  }
}