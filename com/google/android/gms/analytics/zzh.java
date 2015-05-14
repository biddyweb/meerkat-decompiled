package com.google.android.gms.analytics;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import android.os.Build.VERSION;
import android.text.TextUtils;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.zip.GZIPOutputStream;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.RequestLine;
import org.apache.http.StatusLine;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.entity.ByteArrayEntity;
import org.apache.http.entity.StringEntity;
import org.apache.http.message.BasicHttpEntityEnclosingRequest;

public class zzh
  implements zzr
{
  private final Context mContext;
  private final HttpClient zzBe;
  private URL zzBf;
  private int zzBg;
  private int zzBh;
  private int zzBi;
  private String zzBj;
  private String zzBk;
  private zzi zzBl;
  private zzl zzBm;
  private Set<Integer> zzBn = new HashSet();
  private boolean zzBo = false;
  private long zzBp;
  private long zzBq;
  private zzo zzBr;
  private volatile boolean zzBs = false;
  private final String zzyW;

  zzh(HttpClient paramHttpClient, Context paramContext, zzo paramzzo)
  {
    this.mContext = paramContext.getApplicationContext();
    this.zzBr = paramzzo;
    this.zzyW = zza("GoogleAnalytics", "4.0.6", Build.VERSION.RELEASE, zzan.zza(Locale.getDefault()), Build.MODEL, Build.ID);
    this.zzBe = paramHttpClient;
  }

  private String zza(zzab paramzzab, List<String> paramList, zzi paramzzi)
  {
    if (paramzzi == zzi.zzBv)
    {
      if ((paramzzab.zzgr() == null) || (paramzzab.zzgr().length() == 0));
      long l;
      for (String str3 = ""; ; str3 = paramzzab.zzgr())
      {
        l = System.currentTimeMillis();
        if (!TextUtils.isEmpty(str3))
          break;
        return "";
      }
      return zzac.zza(paramzzab, l);
    }
    String str1 = "";
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
    {
      String str2 = (String)localIterator.next();
      if (str2.length() != 0)
      {
        if (str1.length() != 0)
          str1 = str1 + "\n";
        str1 = str1 + str2;
      }
    }
    return str1;
  }

  private URL zza(zzab paramzzab)
  {
    if (this.zzBf != null)
      return this.zzBf;
    String str1 = paramzzab.zzgu();
    while (true)
    {
      try
      {
        if ("http:".equals(str1))
        {
          str2 = "http://www.google-analytics.com/collect";
          URL localURL = new URL(str2);
          return localURL;
        }
      }
      catch (MalformedURLException localMalformedURLException)
      {
        zzae.zzZ("Error trying to parse the hardcoded host url. This really shouldn't happen.");
        return null;
      }
      String str2 = "https://ssl.google-analytics.com/collect";
    }
  }

  private void zza(zzaf paramzzaf, HttpHost paramHttpHost, zzi paramzzi, zzl paramzzl)
  {
    paramzzaf.zzk("_bs", paramzzi.toString());
    paramzzaf.zzk("_cs", paramzzl.toString());
    String str = paramzzaf.zzgx();
    if (TextUtils.isEmpty(str))
      return;
    if (paramHttpHost == null);
    while (true)
    {
      try
      {
        URL localURL = new URL("https://ssl.google-analytics.com");
        localHttpHost = new HttpHost(localURL.getHost(), localURL.getPort(), localURL.getProtocol());
        zza(str, localHttpHost, 1, paramzzaf, zzl.zzBF);
        return;
      }
      catch (MalformedURLException localMalformedURLException)
      {
        return;
      }
      HttpHost localHttpHost = paramHttpHost;
    }
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
      zzae.zzaa(localStringBuffer.toString());
      return;
    }
    catch (IOException localIOException)
    {
      while (true)
        zzae.zzac("Error Writing hit to log...");
    }
  }

  private boolean zza(String paramString, HttpHost paramHttpHost, int paramInt, zzaf paramzzaf, zzl paramzzl)
  {
    boolean bool;
    if (paramInt > 1)
    {
      bool = true;
      if ((paramString.getBytes().length <= this.zzBi) && (paramString.getBytes().length <= this.zzBh))
        break label79;
      zzae.zzac("Request too long (> " + Math.min(this.zzBh, this.zzBi) + " bytes)--not sent");
    }
    while (true)
    {
      return true;
      bool = false;
      break;
      label79: if (this.zzBs)
      {
        zzae.zzaa("Dry run enabled. Hit not actually sent.");
        return true;
      }
      HttpEntityEnclosingRequest localHttpEntityEnclosingRequest = zzc(paramString, bool);
      if (localHttpEntityEnclosingRequest != null)
      {
        int j;
        int i;
        if (localHttpEntityEnclosingRequest.getRequestLine().getMethod().equals("GET"))
        {
          j = paramString.getBytes().length;
          i = paramString.getBytes().length;
          localHttpEntityEnclosingRequest.addHeader("Host", paramHttpHost.toHostString());
          if (zzae.zzgw())
            zza(localHttpEntityEnclosingRequest);
        }
        try
        {
          HttpResponse localHttpResponse;
          while (true)
          {
            localHttpResponse = this.zzBe.execute(paramHttpHost, localHttpEntityEnclosingRequest);
            paramzzaf.zze("_td", j);
            paramzzaf.zze("_cd", i);
            int k = localHttpResponse.getStatusLine().getStatusCode();
            HttpEntity localHttpEntity = localHttpResponse.getEntity();
            if (localHttpEntity != null)
              localHttpEntity.consumeContent();
            if (k == 200)
              break;
            if ((bool) && (this.zzBn.contains(Integer.valueOf(k))))
            {
              zzae.zzaa("Falling back to single hit per request mode.");
              this.zzBo = true;
              this.zzBp = System.currentTimeMillis();
              return false;
              try
              {
                switch (1.zzBt[paramzzl.ordinal()])
                {
                default:
                  i = paramString.getBytes().length;
                  localHttpEntityEnclosingRequest.setEntity(new StringEntity(paramString));
                case 1:
                }
                while (true)
                {
                  j = paramString.getBytes().length;
                  break;
                  ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
                  GZIPOutputStream localGZIPOutputStream = new GZIPOutputStream(localByteArrayOutputStream);
                  localGZIPOutputStream.write(paramString.getBytes());
                  localGZIPOutputStream.close();
                  byte[] arrayOfByte = localByteArrayOutputStream.toByteArray();
                  i = 0 + arrayOfByte.length;
                  localHttpEntityEnclosingRequest.setEntity(new ByteArrayEntity(arrayOfByte));
                  localHttpEntityEnclosingRequest.addHeader("Content-Encoding", "gzip");
                }
              }
              catch (UnsupportedEncodingException localUnsupportedEncodingException)
              {
                zzae.zzZ("Encoding error, hit will be discarded");
                return true;
              }
              catch (IOException localIOException1)
              {
                zzae.zzZ("Unexpected IOException: " + localIOException1.getMessage());
                zzae.zzZ("Request will be discarded");
                return true;
              }
            }
          }
          zzae.zzac("Bad response: " + localHttpResponse.getStatusLine().getStatusCode());
          return true;
        }
        catch (ClientProtocolException localClientProtocolException)
        {
          zzae.zzac("ClientProtocolException sending hit; discarding hit...");
          return true;
        }
        catch (IOException localIOException2)
        {
          zzae.zzac("Exception sending hit: " + localIOException2.getClass().getSimpleName());
          zzae.zzac(localIOException2.getMessage());
        }
      }
    }
    return false;
  }

  private HttpEntityEnclosingRequest zzc(String paramString, boolean paramBoolean)
  {
    if (TextUtils.isEmpty(paramString))
    {
      System.out.println("Empty hit, discarding.");
      return null;
    }
    String str = this.zzBj + "?" + paramString;
    BasicHttpEntityEnclosingRequest localBasicHttpEntityEnclosingRequest;
    if ((str.length() < this.zzBg) && (!paramBoolean))
      localBasicHttpEntityEnclosingRequest = new BasicHttpEntityEnclosingRequest("GET", str);
    while (true)
    {
      localBasicHttpEntityEnclosingRequest.addHeader("User-Agent", this.zzyW);
      return localBasicHttpEntityEnclosingRequest;
      if (paramBoolean)
        localBasicHttpEntityEnclosingRequest = new BasicHttpEntityEnclosingRequest("POST", this.zzBk);
      else
        localBasicHttpEntityEnclosingRequest = new BasicHttpEntityEnclosingRequest("POST", this.zzBj);
    }
  }

  public void setDryRun(boolean paramBoolean)
  {
    this.zzBs = paramBoolean;
  }

  int zza(List<zzab> paramList, int paramInt)
  {
    if (paramList.isEmpty())
    {
      j = 0;
      return j;
    }
    if (paramInt > paramList.size())
      paramInt = paramList.size();
    int i = paramInt - 1;
    long l1 = 0L;
    int j = paramInt;
    label42: long l4;
    if (i > 0)
    {
      zzab localzzab1 = (zzab)paramList.get(i - 1);
      zzab localzzab2 = (zzab)paramList.get(i);
      long l2 = localzzab1.zzgt();
      long l3 = localzzab2.zzgt();
      if ((l2 == 0L) || (l3 == 0L) || (l3 - l2 <= l1))
        break label135;
      l4 = l3 - l2;
    }
    for (int k = i; ; k = j)
    {
      i--;
      j = k;
      l1 = l4;
      break label42;
      break;
      label135: l4 = l1;
    }
  }

  public int zza(List<zzab> paramList, zzaf paramzzaf, boolean paramBoolean)
  {
    this.zzBg = this.zzBr.zzfl();
    this.zzBh = this.zzBr.zzfm();
    this.zzBi = this.zzBr.zzfn();
    int i = this.zzBr.zzfo();
    this.zzBj = this.zzBr.zzfq();
    this.zzBk = this.zzBr.zzfr();
    this.zzBl = this.zzBr.zzfs();
    this.zzBm = this.zzBr.zzft();
    this.zzBn.clear();
    this.zzBn.addAll(this.zzBr.zzfu());
    this.zzBq = this.zzBr.zzfp();
    if ((!this.zzBo) && (this.zzBn.isEmpty()))
    {
      this.zzBo = true;
      this.zzBp = System.currentTimeMillis();
    }
    if ((this.zzBo) && (System.currentTimeMillis() - this.zzBp > 1000L * this.zzBq))
      this.zzBo = false;
    zzl localzzl;
    Object localObject1;
    int j;
    int k;
    long l1;
    ArrayList localArrayList1;
    ArrayList localArrayList2;
    long l2;
    int n;
    label301: zzab localzzab2;
    String str2;
    label338: int i11;
    label389: int i9;
    label430: int m;
    if (this.zzBo)
    {
      zzi localzzi2 = zzi.zzBv;
      localzzl = zzl.zzBF;
      localObject1 = localzzi2;
      j = 0;
      k = Math.min(paramList.size(), i);
      paramzzaf.zze("_hr", paramList.size());
      l1 = System.currentTimeMillis();
      localArrayList1 = new ArrayList();
      localArrayList2 = new ArrayList();
      l2 = 0L;
      if (localObject1 == zzi.zzBv)
        break label1083;
      Iterator localIterator2 = paramList.iterator();
      n = 0;
      if (!localIterator2.hasNext())
        break label1077;
      localzzab2 = (zzab)localIterator2.next();
      if (!TextUtils.isEmpty(localzzab2.zzgr()))
        break label501;
      str2 = "";
      if (str2.getBytes().length > this.zzBh)
        str2 = "";
      localArrayList1.add(str2);
      if (!TextUtils.isEmpty(str2))
      {
        int i10 = str2.getBytes().length;
        if (n != 0)
          break label513;
        i11 = 0;
        l2 += i11 + i10;
      }
      localArrayList2.add(Long.valueOf(l2));
      if (l2 > this.zzBi)
        break label1070;
      i9 = n + 1;
      if (i9 != k)
        break label519;
      n = i9;
      m = 1;
    }
    while (true)
    {
      if ((n > 1) && (((Long)localArrayList2.get(n - 1)).longValue() > this.zzBi))
      {
        n--;
        continue;
        zzi localzzi1 = this.zzBl;
        localzzl = this.zzBm;
        localObject1 = localzzi1;
        break;
        label501: str2 = zzac.zza(localzzab2, l1);
        break label338;
        label513: i11 = 1;
        break label389;
        label519: n = i9;
        break label301;
      }
      int i7;
      if (l2 > this.zzBi)
        switch (1.zzBu[localObject1.ordinal()])
        {
        default:
          zzae.zzac("Unexpected batching strategy encountered; sending a single hit.");
          String str1 = (String)localArrayList1.get(0);
          localArrayList1.clear();
          localArrayList1.add(str1);
          i7 = 1;
          if (i7 >= localArrayList1.size())
            break;
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        }
      for (Object localObject2 = localArrayList1.subList(0, i7); ; localObject2 = localArrayList1)
      {
        int i1 = 0;
        HttpHost localHttpHost = null;
        int i2 = 0;
        int i3;
        int i4;
        int i5;
        while (true)
          if (i2 < m)
          {
            zzab localzzab1 = (zzab)paramList.get(i2);
            URL localURL = zza(localzzab1);
            i3 = Math.max(1, ((List)localObject2).size());
            if (localURL == null)
            {
              zzae.zzac("No destination: discarding hit.");
              i4 = i1 + i3;
              i5 = j + i3;
              i2++;
              i1 = i4;
              j = i5;
              continue;
              i7 = localArrayList1.size() / 2;
              if (n > i7)
                break;
              i7 = n;
              break;
              i7 = zza(paramList, n);
              break;
              i7 = zzb(paramList, n);
              break;
              if (l2 < 2 * this.zzBi)
              {
                for (int i8 = -1 + localArrayList2.size(); (i8 > 0) && (((Long)localArrayList2.get(i8)).longValue() > l2 / 2L); i8--);
                i7 = i8;
                break;
              }
              i7 = n;
              break;
              i7 = n;
              break;
            }
            localHttpHost = new HttpHost(localURL.getHost(), localURL.getPort(), localURL.getProtocol());
            if (!zza(zza(localzzab1, (List)localObject2, (zzi)localObject1), localHttpHost, i3, paramzzaf, localzzl))
            {
              paramzzaf.zze("_de", 1);
              paramzzaf.zze("_hd", i1);
              paramzzaf.zze("_hs", j);
              zza(paramzzaf, localHttpHost, (zzi)localObject1, localzzl);
              return j;
            }
            Iterator localIterator1 = ((List)localObject2).iterator();
            i4 = i1;
            label963: if (localIterator1.hasNext())
              if (!TextUtils.isEmpty((String)localIterator1.next()))
                break label1056;
          }
        label1056: for (int i6 = i4 + 1; ; i6 = i4)
        {
          i4 = i6;
          break label963;
          paramzzaf.zze("_rs", 1);
          i5 = j + i3;
          break;
          paramzzaf.zze("_hd", i1);
          paramzzaf.zze("_hs", j);
          if (paramBoolean)
            zza(paramzzaf, localHttpHost, (zzi)localObject1, localzzl);
          return j;
        }
      }
      label1070: i9 = n;
      break label430;
      label1077: m = 1;
      continue;
      label1083: m = k;
      n = 0;
    }
  }

  String zza(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6)
  {
    return String.format("%s/%s (Linux; U; Android %s; %s; %s Build/%s)", new Object[] { paramString1, paramString2, paramString3, paramString4, paramString5, paramString6 });
  }

  public void zzak(String paramString)
  {
    try
    {
      this.zzBf = new URL(paramString);
      return;
    }
    catch (MalformedURLException localMalformedURLException)
    {
      this.zzBf = null;
    }
  }

  int zzb(List<zzab> paramList, int paramInt)
  {
    if (paramList.isEmpty())
      paramInt = 0;
    while (true)
    {
      return paramInt;
      for (int i = paramInt - 1; i > 0; i--)
      {
        String str = ((zzab)paramList.get(i)).zzgr();
        if (!TextUtils.isEmpty(str))
        {
          if (str.contains("sc=start"))
            return i;
          if (str.contains("sc=end"))
            return i + 1;
        }
      }
    }
  }

  public boolean zzfk()
  {
    NetworkInfo localNetworkInfo = ((ConnectivityManager)this.mContext.getSystemService("connectivity")).getActiveNetworkInfo();
    if ((localNetworkInfo == null) || (!localNetworkInfo.isConnected()))
    {
      zzae.zzab("...no network connectivity");
      return false;
    }
    return true;
  }
}