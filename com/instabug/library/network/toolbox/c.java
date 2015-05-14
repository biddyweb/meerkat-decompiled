package com.instabug.library.network.toolbox;

import android.content.Context;
import android.content.res.Resources;
import android.util.Log;
import com.android.volley.toolbox.HurlStack;
import java.io.InputStream;
import java.security.KeyStore;
import java.security.SecureRandom;
import javax.net.ssl.KeyManagerFactory;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManagerFactory;

final class c
  implements Runnable
{
  c(Context paramContext, b.a parama)
  {
  }

  public final void run()
  {
    try
    {
      InputStream localInputStream = this.a.getResources().openRawResource(this.a.getResources().getIdentifier("rawres", "raw", this.a.getPackageName()));
      KeyStore localKeyStore = KeyStore.getInstance(KeyStore.getDefaultType());
      localKeyStore.load(localInputStream, "ib@wsecc7".toCharArray());
      localInputStream.close();
      TrustManagerFactory localTrustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
      localTrustManagerFactory.init(localKeyStore);
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      KeyManagerFactory localKeyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
      localKeyManagerFactory.init(localKeyStore, "ib@wsecc7".toCharArray());
      localSSLContext.init(localKeyManagerFactory.getKeyManagers(), localTrustManagerFactory.getTrustManagers(), new SecureRandom());
      HurlStack localHurlStack = new HurlStack(null, localSSLContext.getSocketFactory());
      this.b.a(localHurlStack);
      return;
    }
    catch (Exception localException)
    {
      Log.e("com.library.instabug", "Error establishing a secure connection to Instabug", localException);
    }
  }
}