package com.google.android.gms.internal;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.concurrent.Future;

@zzgi
public class zzht
{
  public static final zzht.zza<Void> zzzB = new zzht.1();

  protected HttpURLConnection zzW(String paramString)
    throws MalformedURLException, IOException
  {
    return (HttpURLConnection)new URL(paramString).openConnection();
  }

  public <T> Future<T> zza(String paramString, zzht.zza<T> paramzza)
  {
    return zzhn.submit(new zzht.2(this, paramString, paramzza));
  }
}