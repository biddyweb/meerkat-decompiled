package com.google.android.gms.internal;

import android.os.Bundle;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

@zzgi
public abstract class zzbx<T>
  implements zzbw
{
  private final String zzqd;
  private final T zzqe;

  private zzbx(String paramString, T paramT)
  {
    this.zzqd = paramString;
    this.zzqe = paramT;
    zzab.zzaS().zza(this);
  }

  public static zzbx<String> zzA(String paramString)
  {
    zzbx.4 local4 = new zzbx.4(paramString, null);
    zzab.zzaS().zza(local4);
    return local4;
  }

  public static zzbx<Integer> zza(String paramString, int paramInt)
  {
    return new zzbx.2(paramString, Integer.valueOf(paramInt));
  }

  public static zzbx<Boolean> zza(String paramString, Boolean paramBoolean)
  {
    return new zzbx.1(paramString, paramBoolean);
  }

  private static String zza(Bundle paramBundle, String paramString1, String paramString2)
  {
    String str = paramBundle.getString(paramString1);
    if (str == null)
      return paramString2;
    return str;
  }

  public static zzbx<String> zzd(String paramString1, String paramString2)
  {
    return new zzbx.3(paramString1, paramString2);
  }

  public T get()
  {
    Future localFuture = zzab.zzaT().zzcc();
    if (!localFuture.isDone())
      return this.zzqe;
    try
    {
      Object localObject = zza((Bundle)localFuture.get());
      return localObject;
    }
    catch (InterruptedException localInterruptedException)
    {
      return this.zzqe;
    }
    catch (ExecutionException localExecutionException)
    {
      break label41;
    }
    catch (CancellationException localCancellationException)
    {
      label41: break label41;
    }
  }

  public String getKey()
  {
    return this.zzqd;
  }

  protected abstract T zza(Bundle paramBundle);

  public T zzbY()
  {
    return this.zzqe;
  }

  public abstract zzki<T> zzbZ();
}