package com.google.android.gms.internal;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.util.concurrent.Callable;

class zzht$2
  implements Callable<T>
{
  zzht$2(zzht paramzzht, String paramString, zzht.zza paramzza)
  {
  }

  public T call()
  {
    HttpURLConnection localHttpURLConnection = null;
    try
    {
      localHttpURLConnection = this.zzzE.zzW(this.zzzC);
      localHttpURLConnection.connect();
      int i = localHttpURLConnection.getResponseCode();
      if ((i >= 200) && (i <= 299))
      {
        Object localObject2 = this.zzzD.zzb(localHttpURLConnection.getInputStream());
        return localObject2;
      }
      return this.zzzD.zzdQ();
    }
    catch (MalformedURLException localMalformedURLException)
    {
      while (true)
      {
        zzhx.zzd("Error making HTTP request.", localMalformedURLException);
        if (localHttpURLConnection != null)
          localHttpURLConnection.disconnect();
      }
    }
    catch (IOException localIOException)
    {
      while (true)
      {
        zzhx.zzd("Error making HTTP request.", localIOException);
        if (localHttpURLConnection != null)
          localHttpURLConnection.disconnect();
      }
    }
    finally
    {
      if (localHttpURLConnection != null)
        localHttpURLConnection.disconnect();
    }
  }
}