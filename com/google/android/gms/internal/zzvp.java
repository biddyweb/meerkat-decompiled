package com.google.android.gms.internal;

import com.google.android.gms.tagmanager.zzbf;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;

class zzvp
  implements zzvr
{
  private HttpClient zzaCE;

  private InputStream zza(HttpClient paramHttpClient, HttpResponse paramHttpResponse)
    throws IOException
  {
    int i = paramHttpResponse.getStatusLine().getStatusCode();
    if (i == 200)
    {
      zzbf.zzab("Success response");
      return paramHttpResponse.getEntity().getContent();
    }
    String str = "Bad response: " + i;
    if (i == 404)
      throw new FileNotFoundException(str);
    throw new IOException(str);
  }

  private void zza(HttpClient paramHttpClient)
  {
    if ((paramHttpClient != null) && (paramHttpClient.getConnectionManager() != null))
      paramHttpClient.getConnectionManager().shutdown();
  }

  public void close()
  {
    zza(this.zzaCE);
  }

  public InputStream zzdG(String paramString)
    throws IOException
  {
    this.zzaCE = zzuN();
    HttpResponse localHttpResponse = this.zzaCE.execute(new HttpGet(paramString));
    return zza(this.zzaCE, localHttpResponse);
  }

  HttpClient zzuN()
  {
    BasicHttpParams localBasicHttpParams = new BasicHttpParams();
    HttpConnectionParams.setConnectionTimeout(localBasicHttpParams, 20000);
    HttpConnectionParams.setSoTimeout(localBasicHttpParams, 20000);
    return new DefaultHttpClient(localBasicHttpParams);
  }
}