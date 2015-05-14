package com.google.android.gms.internal;

import android.os.Process;
import java.util.concurrent.Callable;

final class zzhn$3
  implements Callable<T>
{
  zzhn$3(Callable paramCallable)
  {
  }

  public T call()
    throws Exception
  {
    try
    {
      Process.setThreadPriority(10);
      Object localObject = this.zzzo.call();
      return localObject;
    }
    catch (Exception localException)
    {
      zzab.zzaP().zze(localException);
      throw localException;
    }
  }
}