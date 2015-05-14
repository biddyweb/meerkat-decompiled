package com.google.android.gms.internal;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.Bundle;
import android.os.Handler;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public final class zzgw extends zzgs.zza
{
  private static final Object zzmz = new Object();
  private static zzgw zzxf;
  private final Context mContext;
  private final zzdf zznr;
  private final zzhc zzxg;
  private final zzdg zzxh;
  private final zzbv zzxi;

  zzgw(Context paramContext, zzbv paramzzbv, zzdg paramzzdg, zzhc paramzzhc)
  {
    this.mContext = paramContext;
    this.zzxg = paramzzhc;
    this.zzxh = paramzzdg;
    this.zzxi = paramzzbv;
    if (paramContext.getApplicationContext() != null);
    for (Context localContext = paramContext.getApplicationContext(); ; localContext = paramContext)
    {
      this.zznr = new zzdf(localContext, new zzhy(7095000, 7095000, true), paramzzbv.zzbV(), new zzgw.5(this), new zzia.zzc());
      return;
    }
  }

  private static zzgq zza(Context paramContext, zzdf paramzzdf, zzbv paramzzbv, zzdg paramzzdg, zzhc paramzzhc, zzgo paramzzgo)
  {
    zzhx.zzY("Starting ad request from service.");
    zzab.zzaP().zzb(paramContext, paramzzgo.zzlP);
    zzca.zzl(paramContext);
    zzcf localzzcf = new zzcf("load_ad");
    zzce localzzce1 = localzzcf.zzcq();
    paramzzdg.init();
    zzhb localzzhb = new zzhb(paramContext);
    if (localzzhb.zzyj == -1)
    {
      zzhx.zzY("Device is offline.");
      return new zzgq(2);
    }
    if (paramzzgo.versionCode >= 7);
    zzgy localzzgy;
    for (String str1 = paramzzgo.zzwF; ; str1 = UUID.randomUUID().toString())
    {
      localzzgy = new zzgy(str1, paramzzgo.applicationInfo.packageName);
      if (paramzzgo.zzwn.extras == null)
        break;
      String str4 = paramzzgo.zzwn.extras.getString("_ad");
      if (str4 == null)
        break;
      return zzgx.zza(paramContext, paramzzgo, str4);
    }
    JSONObject localJSONObject = zzgx.zza(paramzzgo, localzzhb, paramzzdg.zzb(250L), paramzzbv);
    if (paramzzgo.versionCode < 7);
    try
    {
      localJSONObject.put("request_id", str1);
      label204: if (localJSONObject == null)
        return new zzgq(0);
      String str2 = localJSONObject.toString();
      localzzcf.zza(localzzce1, new String[] { "arc" });
      zzce localzzce2 = localzzcf.zzcq();
      if (((Boolean)zzca.zzqm.get()).booleanValue())
        zzhw.zzzG.post(new zzgw.1(paramzzdf, localzzgy, localzzcf, localzzce2, str2));
      try
      {
        while (true)
        {
          localzzha = (zzha)localzzgy.zzdS().get(10L, TimeUnit.SECONDS);
          if (localzzha != null)
            break;
          zzgq localzzgq4 = new zzgq(0);
          return localzzgq4;
          zzhw.zzzG.post(new zzgw.2(paramContext, paramzzgo, localzzgy, localzzcf, localzzce2, str2, paramzzbv));
        }
      }
      catch (Exception localException)
      {
        zzha localzzha;
        zzgq localzzgq1 = new zzgq(0);
        return localzzgq1;
        if (localzzha.getErrorCode() != -2)
        {
          zzgq localzzgq2 = new zzgq(localzzha.getErrorCode());
          return localzzgq2;
        }
        if (localzzcf.zzcu() != null)
          localzzcf.zza(localzzcf.zzcu(), new String[] { "rur" });
        boolean bool = localzzha.zzdW();
        String str3 = null;
        if (bool)
          str3 = paramzzhc.zzR(paramzzgo.zzwo.packageName);
        zzce localzzce3 = localzzcf.zzcq();
        zzgq localzzgq3 = zza(paramContext, paramzzgo.zzlP.zzzH, localzzha.getUrl(), str3, localzzha);
        localzzcf.zza(localzzce3, new String[] { "ufe" });
        localzzcf.zza(localzzce1, new String[] { "tts" });
        if (zzhk.zzeg() != null)
          zzhk.zzeg().zza(localzzcf);
        return localzzgq3;
      }
      finally
      {
        zzhw.zzzG.post(new zzgw.3(localzzgy, paramzzdf));
      }
    }
    catch (JSONException localJSONException)
    {
      break label204;
    }
  }

  // ERROR //
  public static zzgq zza(Context paramContext, String paramString1, String paramString2, String paramString3, zzha paramzzha)
  {
    // Byte code:
    //   0: new 330\011com/google/android/gms/internal/zzgz
    //   3: dup
    //   4: invokespecial 331\011com/google/android/gms/internal/zzgz:<init>\011()V
    //   7: astore 5
    //   9: new 333\011java/lang/StringBuilder
    //   12: dup
    //   13: invokespecial 334\011java/lang/StringBuilder:<init>\011()V
    //   16: ldc_w 336
    //   19: invokevirtual 340\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   22: aload_2
    //   23: invokevirtual 340\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   26: invokevirtual 341\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   29: invokestatic 85\011com/google/android/gms/internal/zzhx:zzY\011(Ljava/lang/String;)V
    //   32: new 343\011java/net/URL
    //   35: dup
    //   36: aload_2
    //   37: invokespecial 344\011java/net/URL:<init>\011(Ljava/lang/String;)V
    //   40: astore 7
    //   42: invokestatic 350\011android/os/SystemClock:elapsedRealtime\011()J
    //   45: lstore 8
    //   47: aload 7
    //   49: astore 10
    //   51: iconst_0
    //   52: istore 11
    //   54: aload 10
    //   56: invokevirtual 354\011java/net/URL:openConnection\011()Ljava/net/URLConnection;
    //   59: checkcast 356\011java/net/HttpURLConnection
    //   62: astore 12
    //   64: invokestatic 360\011com/google/android/gms/internal/zzab:zzaM\011()Lcom/google/android/gms/internal/zzho;
    //   67: aload_0
    //   68: aload_1
    //   69: iconst_0
    //   70: aload 12
    //   72: invokevirtual 365\011com/google/android/gms/internal/zzho:zza\011(Landroid/content/Context;Ljava/lang/String;ZLjava/net/HttpURLConnection;)V
    //   75: aload_3
    //   76: invokestatic 371\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   79: ifne +12 -> 91
    //   82: aload 12
    //   84: ldc_w 373
    //   87: aload_3
    //   88: invokevirtual 376\011java/net/HttpURLConnection:addRequestProperty\011(Ljava/lang/String;Ljava/lang/String;)V
    //   91: aload 4
    //   93: ifnull +64 -> 157
    //   96: aload 4
    //   98: invokevirtual 379\011com/google/android/gms/internal/zzha:zzdV\011()Ljava/lang/String;
    //   101: invokestatic 371\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   104: ifne +53 -> 157
    //   107: aload 12
    //   109: iconst_1
    //   110: invokevirtual 383\011java/net/HttpURLConnection:setDoOutput\011(Z)V
    //   113: aload 4
    //   115: invokevirtual 379\011com/google/android/gms/internal/zzha:zzdV\011()Ljava/lang/String;
    //   118: invokevirtual 387\011java/lang/String:getBytes\011()[B
    //   121: astore 23
    //   123: aload 12
    //   125: aload 23
    //   127: arraylength
    //   128: invokevirtual 390\011java/net/HttpURLConnection:setFixedLengthStreamingMode\011(I)V
    //   131: new 392\011java/io/BufferedOutputStream
    //   134: dup
    //   135: aload 12
    //   137: invokevirtual 396\011java/net/HttpURLConnection:getOutputStream\011()Ljava/io/OutputStream;
    //   140: invokespecial 399\011java/io/BufferedOutputStream:<init>\011(Ljava/io/OutputStream;)V
    //   143: astore 24
    //   145: aload 24
    //   147: aload 23
    //   149: invokevirtual 403\011java/io/BufferedOutputStream:write\011([B)V
    //   152: aload 24
    //   154: invokevirtual 406\011java/io/BufferedOutputStream:close\011()V
    //   157: aload 12
    //   159: invokevirtual 409\011java/net/HttpURLConnection:getResponseCode\011()I
    //   162: istore 14
    //   164: aload 12
    //   166: invokevirtual 413\011java/net/HttpURLConnection:getHeaderFields\011()Ljava/util/Map;
    //   169: astore 15
    //   171: iload 14
    //   173: sipush 200
    //   176: if_icmplt +77 -> 253
    //   179: iload 14
    //   181: sipush 300
    //   184: if_icmpge +69 -> 253
    //   187: aload 10
    //   189: invokevirtual 414\011java/net/URL:toString\011()Ljava/lang/String;
    //   192: astore 20
    //   194: invokestatic 360\011com/google/android/gms/internal/zzab:zzaM\011()Lcom/google/android/gms/internal/zzho;
    //   197: new 416\011java/io/InputStreamReader
    //   200: dup
    //   201: aload 12
    //   203: invokevirtual 420\011java/net/HttpURLConnection:getInputStream\011()Ljava/io/InputStream;
    //   206: invokespecial 423\011java/io/InputStreamReader:<init>\011(Ljava/io/InputStream;)V
    //   209: invokevirtual 426\011com/google/android/gms/internal/zzho:zza\011(Ljava/io/InputStreamReader;)Ljava/lang/String;
    //   212: astore 21
    //   214: aload 20
    //   216: aload 15
    //   218: aload 21
    //   220: iload 14
    //   222: invokestatic 429\011com/google/android/gms/internal/zzgw:zza\011(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V
    //   225: aload 5
    //   227: aload 20
    //   229: aload 15
    //   231: aload 21
    //   233: invokevirtual 432\011com/google/android/gms/internal/zzgz:zza\011(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)V
    //   236: aload 5
    //   238: lload 8
    //   240: invokevirtual 436\011com/google/android/gms/internal/zzgz:zzi\011(J)Lcom/google/android/gms/internal/zzgq;
    //   243: astore 22
    //   245: aload 12
    //   247: invokevirtual 439\011java/net/HttpURLConnection:disconnect\011()V
    //   250: aload 22
    //   252: areturn
    //   253: aload 10
    //   255: invokevirtual 414\011java/net/URL:toString\011()Ljava/lang/String;
    //   258: aload 15
    //   260: aconst_null
    //   261: iload 14
    //   263: invokestatic 429\011com/google/android/gms/internal/zzgw:zza\011(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;I)V
    //   266: iload 14
    //   268: sipush 300
    //   271: if_icmplt +97 -> 368
    //   274: iload 14
    //   276: sipush 400
    //   279: if_icmpge +89 -> 368
    //   282: aload 12
    //   284: ldc_w 441
    //   287: invokevirtual 444\011java/net/HttpURLConnection:getHeaderField\011(Ljava/lang/String;)Ljava/lang/String;
    //   290: astore 17
    //   292: aload 17
    //   294: invokestatic 371\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   297: ifeq +27 -> 324
    //   300: ldc_w 446
    //   303: invokestatic 449\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   306: new 136\011com/google/android/gms/internal/zzgq
    //   309: dup
    //   310: iconst_0
    //   311: invokespecial 139\011com/google/android/gms/internal/zzgq:<init>\011(I)V
    //   314: astore 19
    //   316: aload 12
    //   318: invokevirtual 439\011java/net/HttpURLConnection:disconnect\011()V
    //   321: aload 19
    //   323: areturn
    //   324: new 343\011java/net/URL
    //   327: dup
    //   328: aload 17
    //   330: invokespecial 344\011java/net/URL:<init>\011(Ljava/lang/String;)V
    //   333: astore 10
    //   335: iinc 11 1
    //   338: iload 11
    //   340: iconst_5
    //   341: if_icmple +69 -> 410
    //   344: ldc_w 451
    //   347: invokestatic 449\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   350: new 136\011com/google/android/gms/internal/zzgq
    //   353: dup
    //   354: iconst_0
    //   355: invokespecial 139\011com/google/android/gms/internal/zzgq:<init>\011(I)V
    //   358: astore 18
    //   360: aload 12
    //   362: invokevirtual 439\011java/net/HttpURLConnection:disconnect\011()V
    //   365: aload 18
    //   367: areturn
    //   368: new 333\011java/lang/StringBuilder
    //   371: dup
    //   372: invokespecial 334\011java/lang/StringBuilder:<init>\011()V
    //   375: ldc_w 453
    //   378: invokevirtual 340\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   381: iload 14
    //   383: invokevirtual 456\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   386: invokevirtual 341\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   389: invokestatic 449\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   392: new 136\011com/google/android/gms/internal/zzgq
    //   395: dup
    //   396: iconst_0
    //   397: invokespecial 139\011com/google/android/gms/internal/zzgq:<init>\011(I)V
    //   400: astore 16
    //   402: aload 12
    //   404: invokevirtual 439\011java/net/HttpURLConnection:disconnect\011()V
    //   407: aload 16
    //   409: areturn
    //   410: aload 5
    //   412: aload 15
    //   414: invokevirtual 460\011com/google/android/gms/internal/zzgz:zzh\011(Ljava/util/Map;)V
    //   417: aload 12
    //   419: invokevirtual 439\011java/net/HttpURLConnection:disconnect\011()V
    //   422: goto -368 -> 54
    //   425: astore 6
    //   427: new 333\011java/lang/StringBuilder
    //   430: dup
    //   431: invokespecial 334\011java/lang/StringBuilder:<init>\011()V
    //   434: ldc_w 462
    //   437: invokevirtual 340\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   440: aload 6
    //   442: invokevirtual 465\011java/io/IOException:getMessage\011()Ljava/lang/String;
    //   445: invokevirtual 340\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   448: invokevirtual 341\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   451: invokestatic 449\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   454: new 136\011com/google/android/gms/internal/zzgq
    //   457: dup
    //   458: iconst_2
    //   459: invokespecial 139\011com/google/android/gms/internal/zzgq:<init>\011(I)V
    //   462: areturn
    //   463: astore 13
    //   465: aload 12
    //   467: invokevirtual 439\011java/net/HttpURLConnection:disconnect\011()V
    //   470: aload 13
    //   472: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\01147\011425\011java/io/IOException
    //   54\01164\011425\011java/io/IOException
    //   245\011250\011425\011java/io/IOException
    //   316\011321\011425\011java/io/IOException
    //   360\011365\011425\011java/io/IOException
    //   402\011407\011425\011java/io/IOException
    //   417\011422\011425\011java/io/IOException
    //   465\011473\011425\011java/io/IOException
    //   64\01191\011463\011finally
    //   96\011157\011463\011finally
    //   157\011171\011463\011finally
    //   187\011245\011463\011finally
    //   253\011266\011463\011finally
    //   282\011316\011463\011finally
    //   324\011335\011463\011finally
    //   344\011360\011463\011finally
    //   368\011402\011463\011finally
    //   410\011417\011463\011finally
  }

  public static zzgw zza(Context paramContext, zzbv paramzzbv, zzdg paramzzdg, zzhc paramzzhc)
  {
    synchronized (zzmz)
    {
      if (zzxf == null)
      {
        if (paramContext.getApplicationContext() != null)
          paramContext = paramContext.getApplicationContext();
        zzxf = new zzgw(paramContext, paramzzbv, paramzzdg, paramzzhc);
      }
      zzgw localzzgw = zzxf;
      return localzzgw;
    }
  }

  private static zzid.zza zza(String paramString, zzcf paramzzcf, zzce paramzzce)
  {
    return new zzgw.4(paramzzcf, paramzzce, paramString);
  }

  private static void zza(String paramString1, Map<String, List<String>> paramMap, String paramString2, int paramInt)
  {
    if (zzhx.zzA(2))
    {
      zzhx.zzab("Http Response: {\n  URL:\n    " + paramString1 + "\n  Headers:");
      if (paramMap != null)
      {
        Iterator localIterator1 = paramMap.keySet().iterator();
        while (localIterator1.hasNext())
        {
          String str1 = (String)localIterator1.next();
          zzhx.zzab("    " + str1 + ":");
          Iterator localIterator2 = ((List)paramMap.get(str1)).iterator();
          while (localIterator2.hasNext())
          {
            String str2 = (String)localIterator2.next();
            zzhx.zzab("      " + str2);
          }
        }
      }
      zzhx.zzab("  Body:");
      if (paramString2 != null)
        for (int i = 0; i < Math.min(paramString2.length(), 100000); i += 1000)
          zzhx.zzab(paramString2.substring(i, Math.min(paramString2.length(), i + 1000)));
      zzhx.zzab("    null");
      zzhx.zzab("  Response Code:\n    " + paramInt + "\n}");
    }
  }

  public zzgq zzd(zzgo paramzzgo)
  {
    zzhk.zzd(this.mContext, paramzzgo.zzlP.zzzH);
    return zza(this.mContext, this.zznr, this.zzxi, this.zzxh, this.zzxg, paramzzgo);
  }
}