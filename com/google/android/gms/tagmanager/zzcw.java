package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Build.VERSION;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;

class zzcw
  implements zzab
{
  private final String zzaAM;
  private final HttpClient zzaAN;
  private zza zzaAO;
  private final Context zzaAv;

  zzcw(HttpClient paramHttpClient, Context paramContext, zza paramzza)
  {
    this.zzaAv = paramContext.getApplicationContext();
    this.zzaAM = zza("GoogleTagManager", "4.00", Build.VERSION.RELEASE, zzc(Locale.getDefault()), Build.MODEL, Build.ID);
    this.zzaAN = paramHttpClient;
    this.zzaAO = paramzza;
  }

  // ERROR //
  private HttpEntityEnclosingRequest zza(URL paramURL)
  {
    // Byte code:
    //   0: new 69\011org/apache/http/message/BasicHttpEntityEnclosingRequest
    //   3: dup
    //   4: ldc 71
    //   6: aload_1
    //   7: invokevirtual 77\011java/net/URL:toURI\011()Ljava/net/URI;
    //   10: invokevirtual 83\011java/net/URI:toString\011()Ljava/lang/String;
    //   13: invokespecial 86\011org/apache/http/message/BasicHttpEntityEnclosingRequest:<init>\011(Ljava/lang/String;Ljava/lang/String;)V
    //   16: astore_2
    //   17: aload_2
    //   18: ldc 88
    //   20: aload_0
    //   21: getfield 60\011com/google/android/gms/tagmanager/zzcw:zzaAM\011Ljava/lang/String;
    //   24: invokeinterface 93 3 0
    //   29: aload_2
    //   30: areturn
    //   31: astore 4
    //   33: aconst_null
    //   34: astore_2
    //   35: aload 4
    //   37: astore_3
    //   38: new 95\011java/lang/StringBuilder
    //   41: dup
    //   42: invokespecial 96\011java/lang/StringBuilder:<init>\011()V
    //   45: ldc 98
    //   47: invokevirtual 102\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   50: aload_3
    //   51: invokevirtual 106\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   54: invokevirtual 111\011java/lang/Class:getSimpleName\011()Ljava/lang/String;
    //   57: invokevirtual 102\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   60: invokevirtual 112\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   63: invokestatic 118\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   66: aload_3
    //   67: invokevirtual 121\011java/net/URISyntaxException:getMessage\011()Ljava/lang/String;
    //   70: invokestatic 118\011com/google/android/gms/tagmanager/zzbf:zzac\011(Ljava/lang/String;)V
    //   73: aload_2
    //   74: areturn
    //   75: astore_3
    //   76: goto -38 -> 38
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\01117\01131\011java/net/URISyntaxException
    //   17\01129\01175\011java/net/URISyntaxException
  }

  private void zza(HttpEntityEnclosingRequest paramHttpEntityEnclosingRequest)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    Header[] arrayOfHeader = paramHttpEntityEnclosingRequest.getAllHeaders();
    int i = arrayOfHeader.length;
    for (int j = 0; j < i; j++)
      localStringBuffer.append(arrayOfHeader[j].toString()).append("\n");
    localStringBuffer.append(paramHttpEntityEnclosingRequest.getRequestLine().toString()).append("\n");
    if (paramHttpEntityEnclosingRequest.getEntity() != null);
    try
    {
      InputStream localInputStream = paramHttpEntityEnclosingRequest.getEntity().getContent();
      if (localInputStream != null)
      {
        int k = localInputStream.available();
        if (k > 0)
        {
          byte[] arrayOfByte = new byte[k];
          localInputStream.read(arrayOfByte);
          localStringBuffer.append("POST:\n");
          localStringBuffer.append(new String(arrayOfByte)).append("\n");
        }
      }
      zzbf.zzab(localStringBuffer.toString());
      return;
    }
    catch (IOException localIOException)
    {
      while (true)
        zzbf.zzab("Error Writing hit to log...");
    }
  }

  static String zzc(Locale paramLocale)
  {
    if (paramLocale == null);
    while ((paramLocale.getLanguage() == null) || (paramLocale.getLanguage().length() == 0))
      return null;
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append(paramLocale.getLanguage().toLowerCase());
    if ((paramLocale.getCountry() != null) && (paramLocale.getCountry().length() != 0))
      localStringBuilder.append("-").append(paramLocale.getCountry().toLowerCase());
    return localStringBuilder.toString();
  }

  String zza(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    return String.format("%s/%s (Linux; U; Android %s; %s; %s Build/%s)", new Object[] { paramString1, paramString2, paramString3, paramString4, paramString5, paramString6 });
  }

  URL zzd(zzap paramzzap)
  {
    String str = paramzzap.zztk();
    try
    {
      URL localURL = new URL(str);
      return localURL;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      zzbf.zzZ("Error trying to parse the GTM url.");
    }
    return null;
  }

  public boolean zzfk()
  {
    NetworkInfo localNetworkInfo = ((ConnectivityManager)this.zzaAv.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected()))
    {
      zzbf.zzab("...no network connectivity");
      return false;
    }
    return true;
  }

  public void zzt(List<zzap> paramList)
  {
    int i = Math.min(paramList.size(), 40);
    int j = 1;
    int k = 0;
    zzap localzzap;
    URL localURL;
    int m;
    if (k < i)
    {
      localzzap = (zzap)paramList.get(k);
      localURL = zzd(localzzap);
      if (localURL == null)
      {
        zzbf.zzac("No destination: discarding hit.");
        this.zzaAO.zzb(localzzap);
        m = j;
      }
    }
    while (true)
    {
      k++;
      j = m;
      break;
      HttpEntityEnclosingRequest localHttpEntityEnclosingRequest = zza(localURL);
      if (localHttpEntityEnclosingRequest == null)
      {
        this.zzaAO.zzb(localzzap);
        m = j;
      }
      else
      {
        HttpHost localHttpHost = new HttpHost(localURL.getHost(), localURL.getPort(), localURL.getProtocol());
        localHttpEntityEnclosingRequest.addHeader("Host", localHttpHost.toHostString());
        zza(localHttpEntityEnclosingRequest);
        if (j != 0);
        try
        {
          zzbk.zzan(this.zzaAv);
          j = 0;
          HttpResponse localHttpResponse = this.zzaAN.execute(localHttpHost, localHttpEntityEnclosingRequest);
          int n = localHttpResponse.getStatusLine().getStatusCode();
          HttpEntity localHttpEntity = localHttpResponse.getEntity();
          if (localHttpEntity != null)
            localHttpEntity.consumeContent();
          if (n != 200)
          {
            zzbf.zzac("Bad response: " + localHttpResponse.getStatusLine().getStatusCode());
            this.zzaAO.zzc(localzzap);
          }
          else
          {
            this.zzaAO.zza(localzzap);
          }
        }
        catch (ClientProtocolException localClientProtocolException)
        {
          zzbf.zzac("ClientProtocolException sending hit; discarding hit...");
          this.zzaAO.zzb(localzzap);
          m = j;
          continue;
        }
        catch (IOException localIOException)
        {
          zzbf.zzac("Exception sending hit: " + localIOException.getClass().getSimpleName());
          zzbf.zzac(localIOException.getMessage());
          this.zzaAO.zzc(localzzap);
          m = j;
        }
        continue;
        return;
        m = j;
      }
    }
  }

  public static abstract interface zza
  {
    public abstract void zza(zzap paramzzap);

    public abstract void zzb(zzap paramzzap);

    public abstract void zzc(zzap paramzzap);
  }
}