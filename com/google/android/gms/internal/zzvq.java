package com.google.android.gms.internal;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;

class zzvq
  implements zzvr
{
  private HttpURLConnection zzaCF;

  private InputStream zza(HttpURLConnection paramHttpURLConnection)
    throws IOException
  {
    int i = paramHttpURLConnection.getResponseCode();
    if (i == 200)
      return paramHttpURLConnection.getInputStream();
    String str = "Bad response: " + i;
    if (i == 404)
      throw new FileNotFoundException(str);
    throw new IOException(str);
  }

  private void zzb(HttpURLConnection paramHttpURLConnection)
  {
    if (paramHttpURLConnection != null)
      paramHttpURLConnection.disconnect();
  }

  public void close()
  {
    zzb(this.zzaCF);
  }

  public InputStream zzdG(String paramString)
    throws IOException
  {
    this.zzaCF = zzdH(paramString);
    return zza(this.zzaCF);
  }

  HttpURLConnection zzdH(String paramString)
    throws IOException
  {
    HttpURLConnection localHttpURLConnection = (HttpURLConnection)new URL(paramString).openConnection();
    localHttpURLConnection.setReadTimeout(20000);
    localHttpURLConnection.setConnectTimeout(20000);
    return localHttpURLConnection;
  }
}