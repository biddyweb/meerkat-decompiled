package com.twitter.sdk.android.core;

import io.fabric.sdk.android.Fabric;
import io.fabric.sdk.android.Logger;
import java.io.IOException;
import java.net.HttpURLConnection;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLSocketFactory;
import retrofit.client.Client;
import retrofit.client.OkClient;
import retrofit.client.Request;
import retrofit.client.Response;
import retrofit.client.UrlConnectionClient;

public class DefaultClient
  implements Client
{
  final SSLSocketFactory sslSocketFactory;
  final Client wrappedClient;

  public DefaultClient(SSLSocketFactory paramSSLSocketFactory)
  {
    this.sslSocketFactory = paramSSLSocketFactory;
    if (hasOkHttpOnClasspath())
    {
      this.wrappedClient = new OkClient()
      {
        protected HttpURLConnection openConnection(Request paramAnonymousRequest)
          throws IOException
        {
          return DefaultClient.this.openSslConnection(super.openConnection(paramAnonymousRequest));
        }
      };
      return;
    }
    this.wrappedClient = new UrlConnectionClient()
    {
      protected HttpURLConnection openConnection(Request paramAnonymousRequest)
        throws IOException
      {
        return DefaultClient.this.openSslConnection(super.openConnection(paramAnonymousRequest));
      }
    };
  }

  private boolean hasOkHttpOnClasspath()
  {
    try
    {
      Class.forName("com.squareup.okhttp.OkUrlFactory");
      i = 1;
      try
      {
        Class.forName("com.squareup.okhttp.OkHttpClient");
        bool = true;
        if (bool != i)
        {
          Fabric.getLogger().d("Twitter", "Retrofit detected an unsupported OkHttp on the classpath.\nTo use OkHttp with this version of Retrofit, you'll need:\n1. com.squareup.okhttp:okhttp:1.6.0 (or newer)\n2. com.squareup.okhttp:okhttp-urlconnection:1.6.0 (or newer)\nNote that OkHttp 2.0.0+ is supported!");
          bool = false;
        }
        return bool;
      }
      catch (ClassNotFoundException localClassNotFoundException2)
      {
        while (true)
          boolean bool = false;
      }
    }
    catch (ClassNotFoundException localClassNotFoundException1)
    {
      while (true)
        int i = 0;
    }
  }

  public Response execute(Request paramRequest)
    throws IOException
  {
    return this.wrappedClient.execute(paramRequest);
  }

  HttpURLConnection openSslConnection(HttpURLConnection paramHttpURLConnection)
  {
    if ((this.sslSocketFactory != null) && ((paramHttpURLConnection instanceof HttpsURLConnection)))
      ((HttpsURLConnection)paramHttpURLConnection).setSSLSocketFactory(this.sslSocketFactory);
    return paramHttpURLConnection;
  }
}