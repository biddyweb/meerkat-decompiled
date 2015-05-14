package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import android.os.Bundle;
import android.text.TextUtils;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public final class zzgx
{
  private static final SimpleDateFormat zzxu = new SimpleDateFormat("yyyyMMdd");

  public static zzgq zza(Context paramContext, zzgo paramzzgo, String paramString)
  {
    JSONObject localJSONObject;
    String str1;
    String str3;
    String str4;
    long l1;
    String str5;
    long l2;
    int i;
    zzgq localzzgq3;
    label212: Object localObject1;
    label250: int m;
    label346: Object localObject3;
    label384: int k;
    label425: Object localObject5;
    label463: int j;
    while (true)
    {
      try
      {
        localJSONObject = new JSONObject(paramString);
        str1 = localJSONObject.optString("ad_base_url", null);
        String str2 = localJSONObject.optString("ad_url", null);
        str3 = localJSONObject.optString("ad_size", null);
        str4 = localJSONObject.optString("ad_html", null);
        l1 = -1L;
        str5 = localJSONObject.optString("debug_dialog", null);
        if (!localJSONObject.has("interstitial_timeout"))
          break label722;
        l2 = ()(1000.0D * localJSONObject.getDouble("interstitial_timeout"));
        String str6 = localJSONObject.optString("orientation", null);
        i = -1;
        if ("portrait".equals(str6))
        {
          i = zzab.zzaO().zzey();
          if (!TextUtils.isEmpty(str4))
          {
            if (!TextUtils.isEmpty(str1))
              break label716;
            zzhx.zzac("Could not parse the mediation config: Missing required ad_base_url field");
            return new zzgq(0);
          }
        }
        else
        {
          if (!"landscape".equals(str6))
            continue;
          i = zzab.zzaO().zzex();
          continue;
        }
        if (!TextUtils.isEmpty(str2))
        {
          zzgq localzzgq2 = zzgw.zza(paramContext, paramzzgo.zzlP.zzzH, str2, null, null);
          str1 = localzzgq2.zzus;
          str4 = localzzgq2.zzwG;
          l1 = localzzgq2.zzwM;
          localzzgq3 = localzzgq2;
          JSONArray localJSONArray1 = localJSONObject.optJSONArray("click_urls");
          if (localzzgq3 == null)
          {
            localObject1 = null;
            if (localJSONArray1 == null)
              break;
            if (localObject1 != null)
              break label730;
            localObject1 = new LinkedList();
            break label730;
            if (m >= localJSONArray1.length())
              break label736;
            ((List)localObject1).add(localJSONArray1.getString(m));
            m++;
            continue;
          }
        }
        else
        {
          zzhx.zzac("Could not parse the mediation config: Missing required ad_html or ad_url field.");
          zzgq localzzgq1 = new zzgq(0);
          return localzzgq1;
        }
      }
      catch (JSONException localJSONException)
      {
        zzhx.zzac("Could not parse the mediation config: " + localJSONException.getMessage());
        return new zzgq(0);
      }
      localObject1 = localzzgq3.zzst;
      continue;
      JSONArray localJSONArray2 = localJSONObject.optJSONArray("impression_urls");
      if (localzzgq3 == null)
        localObject3 = null;
      while (localJSONArray2 != null)
      {
        if (localObject3 != null)
          break label743;
        localObject3 = new LinkedList();
        break label743;
        while (k < localJSONArray2.length())
        {
          ((List)localObject3).add(localJSONArray2.getString(k));
          k++;
        }
        localObject3 = localzzgq3.zzsu;
        continue;
        JSONArray localJSONArray3 = localJSONObject.optJSONArray("manual_impression_urls");
        if (localzzgq3 == null);
        for (localObject5 = null; localJSONArray3 != null; localObject5 = localzzgq3.zzwK)
        {
          if (localObject5 != null)
            break label756;
          localObject5 = new LinkedList();
          break label756;
          while (j < localJSONArray3.length())
          {
            ((List)localObject5).add(localJSONArray3.getString(j));
            j++;
          }
        }
      }
    }
    while (true)
    {
      if (localzzgq3 != null)
      {
        if (localzzgq3.orientation != -1)
          i = localzzgq3.orientation;
        if (localzzgq3.zzwH > 0L)
          l2 = localzzgq3.zzwH;
      }
      String str7 = localJSONObject.optString("active_view");
      boolean bool1 = localJSONObject.optBoolean("ad_is_javascript", false);
      String str8 = null;
      if (bool1)
        str8 = localJSONObject.optString("ad_passback_url", null);
      boolean bool2 = localJSONObject.optBoolean("mediation", false);
      boolean bool3 = localJSONObject.optBoolean("custom_render_allowed", false);
      boolean bool4 = localJSONObject.optBoolean("native", false);
      boolean bool5 = localJSONObject.optBoolean("content_url_opted_out", false);
      boolean bool6 = localJSONObject.optBoolean("prefetch", false);
      long l3 = localJSONObject.optLong("refresh_interval_milliseconds", -1L);
      zzgq localzzgq4 = new zzgq(str1, str4, (List)localObject2, (List)localObject4, l2, bool2, localJSONObject.optLong("mediation_config_cache_time_milliseconds", -1L), (List)localObject6, l3, i, str3, l1, str5, bool1, str8, str7, bool3, bool4, paramzzgo.zzwv, bool5, bool6);
      return localzzgq4;
      Object localObject6 = localObject5;
      continue;
      Object localObject4 = localObject3;
      break label425;
      Object localObject2 = localObject1;
      break label346;
      label716: localzzgq3 = null;
      break label212;
      label722: l2 = -1L;
      break;
      label730: m = 0;
      break label250;
      label736: localObject2 = localObject1;
      break label346;
      label743: k = 0;
      break label384;
      localObject4 = localObject3;
      break label425;
      label756: j = 0;
      break label463;
      localObject6 = localObject5;
    }
  }

  // ERROR //
  public static JSONObject zza(zzgo paramzzgo, zzhb paramzzhb, Location paramLocation, zzbv paramzzbv)
  {
    // Byte code:
    //   0: new 229\011java/util/HashMap
    //   3: dup
    //   4: invokespecial 230\011java/util/HashMap:<init>\011()V
    //   7: astore 4
    //   9: aload_3
    //   10: invokevirtual 236\011com/google/android/gms/internal/zzbv:zzbW\011()Ljava/util/List;
    //   13: astore 6
    //   15: aload 6
    //   17: invokeinterface 239 1 0
    //   22: ifle +18 -> 40
    //   25: aload 4
    //   27: ldc 241
    //   29: ldc 243
    //   31: aload 6
    //   33: invokestatic 247\011android/text/TextUtils:join\011(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;
    //   36: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   39: pop
    //   40: aload_0
    //   41: getfield 255\011com/google/android/gms/internal/zzgo:zzwm\011Landroid/os/Bundle;
    //   44: ifnull +16 -> 60
    //   47: aload 4
    //   49: ldc_w 257
    //   52: aload_0
    //   53: getfield 255\011com/google/android/gms/internal/zzgo:zzwm\011Landroid/os/Bundle;
    //   56: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   59: pop
    //   60: aload 4
    //   62: aload_0
    //   63: getfield 261\011com/google/android/gms/internal/zzgo:zzwn\011Lcom/google/android/gms/internal/zzax;
    //   66: invokestatic 264\011com/google/android/gms/internal/zzgx:zza\011(Ljava/util/HashMap;Lcom/google/android/gms/internal/zzax;)V
    //   69: aload 4
    //   71: ldc_w 266
    //   74: aload_0
    //   75: getfield 270\011com/google/android/gms/internal/zzgo:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   78: getfield 275\011com/google/android/gms/internal/zzba:zzpa\011Ljava/lang/String;
    //   81: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   84: pop
    //   85: aload_0
    //   86: getfield 270\011com/google/android/gms/internal/zzgo:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   89: getfield 278\011com/google/android/gms/internal/zzba:width\011I
    //   92: iconst_m1
    //   93: if_icmpne +15 -> 108
    //   96: aload 4
    //   98: ldc_w 280
    //   101: ldc_w 282
    //   104: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   107: pop
    //   108: aload_0
    //   109: getfield 270\011com/google/android/gms/internal/zzgo:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   112: getfield 285\011com/google/android/gms/internal/zzba:height\011I
    //   115: bipush 254
    //   117: if_icmpne +15 -> 132
    //   120: aload 4
    //   122: ldc_w 287
    //   125: ldc_w 289
    //   128: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   131: pop
    //   132: aload_0
    //   133: getfield 270\011com/google/android/gms/internal/zzgo:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   136: getfield 293\011com/google/android/gms/internal/zzba:zzpc\011[Lcom/google/android/gms/internal/zzba;
    //   139: ifnull +169 -> 308
    //   142: new 154\011java/lang/StringBuilder
    //   145: dup
    //   146: invokespecial 155\011java/lang/StringBuilder:<init>\011()V
    //   149: astore 8
    //   151: aload_0
    //   152: getfield 270\011com/google/android/gms/internal/zzgo:zzlV\011Lcom/google/android/gms/internal/zzba;
    //   155: getfield 293\011com/google/android/gms/internal/zzba:zzpc\011[Lcom/google/android/gms/internal/zzba;
    //   158: astore 9
    //   160: aload 9
    //   162: arraylength
    //   163: istore 10
    //   165: iconst_0
    //   166: istore 11
    //   168: iload 11
    //   170: iload 10
    //   172: if_icmpge +125 -> 297
    //   175: aload 9
    //   177: iload 11
    //   179: aaload
    //   180: astore 12
    //   182: aload 8
    //   184: invokevirtual 294\011java/lang/StringBuilder:length\011()I
    //   187: ifeq +12 -> 199
    //   190: aload 8
    //   192: ldc_w 296
    //   195: invokevirtual 161\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   198: pop
    //   199: aload 12
    //   201: getfield 278\011com/google/android/gms/internal/zzba:width\011I
    //   204: iconst_m1
    //   205: if_icmpne +72 -> 277
    //   208: aload 12
    //   210: getfield 299\011com/google/android/gms/internal/zzba:widthPixels\011I
    //   213: i2f
    //   214: aload_1
    //   215: getfield 305\011com/google/android/gms/internal/zzhb:zzwz\011F
    //   218: fdiv
    //   219: f2i
    //   220: istore 13
    //   222: aload 8
    //   224: iload 13
    //   226: invokevirtual 308\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   229: pop
    //   230: aload 8
    //   232: ldc_w 310
    //   235: invokevirtual 161\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   238: pop
    //   239: aload 12
    //   241: getfield 285\011com/google/android/gms/internal/zzba:height\011I
    //   244: bipush 254
    //   246: if_icmpne +41 -> 287
    //   249: aload 12
    //   251: getfield 313\011com/google/android/gms/internal/zzba:heightPixels\011I
    //   254: i2f
    //   255: aload_1
    //   256: getfield 305\011com/google/android/gms/internal/zzhb:zzwz\011F
    //   259: fdiv
    //   260: f2i
    //   261: istore 16
    //   263: aload 8
    //   265: iload 16
    //   267: invokevirtual 308\011java/lang/StringBuilder:append\011(I)Ljava/lang/StringBuilder;
    //   270: pop
    //   271: iinc 11 1
    //   274: goto -106 -> 168
    //   277: aload 12
    //   279: getfield 278\011com/google/android/gms/internal/zzba:width\011I
    //   282: istore 13
    //   284: goto -62 -> 222
    //   287: aload 12
    //   289: getfield 285\011com/google/android/gms/internal/zzba:height\011I
    //   292: istore 16
    //   294: goto -31 -> 263
    //   297: aload 4
    //   299: ldc_w 315
    //   302: aload 8
    //   304: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   307: pop
    //   308: aload_0
    //   309: getfield 318\011com/google/android/gms/internal/zzgo:zzwt\011I
    //   312: ifeq +32 -> 344
    //   315: aload 4
    //   317: ldc_w 320
    //   320: aload_0
    //   321: getfield 318\011com/google/android/gms/internal/zzgo:zzwt\011I
    //   324: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   327: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   330: pop
    //   331: aload 4
    //   333: ldc_w 328
    //   336: aload_0
    //   337: getfield 331\011com/google/android/gms/internal/zzgo:zzmf\011Ljava/util/List;
    //   340: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   343: pop
    //   344: aload 4
    //   346: ldc_w 333
    //   349: aload_0
    //   350: getfield 336\011com/google/android/gms/internal/zzgo:zzlM\011Ljava/lang/String;
    //   353: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   356: pop
    //   357: aload 4
    //   359: ldc_w 338
    //   362: aload_0
    //   363: getfield 342\011com/google/android/gms/internal/zzgo:applicationInfo\011Landroid/content/pm/ApplicationInfo;
    //   366: getfield 347\011android/content/pm/ApplicationInfo:packageName\011Ljava/lang/String;
    //   369: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   372: pop
    //   373: aload_0
    //   374: getfield 351\011com/google/android/gms/internal/zzgo:zzwo\011Landroid/content/pm/PackageInfo;
    //   377: ifnull +22 -> 399
    //   380: aload 4
    //   382: ldc_w 353
    //   385: aload_0
    //   386: getfield 351\011com/google/android/gms/internal/zzgo:zzwo\011Landroid/content/pm/PackageInfo;
    //   389: getfield 358\011android/content/pm/PackageInfo:versionCode\011I
    //   392: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   395: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   398: pop
    //   399: aload 4
    //   401: ldc_w 360
    //   404: aload_0
    //   405: getfield 363\011com/google/android/gms/internal/zzgo:zzwp\011Ljava/lang/String;
    //   408: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   411: pop
    //   412: aload 4
    //   414: ldc_w 365
    //   417: aload_0
    //   418: getfield 368\011com/google/android/gms/internal/zzgo:zzwq\011Ljava/lang/String;
    //   421: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   424: pop
    //   425: aload 4
    //   427: ldc_w 370
    //   430: aload_0
    //   431: getfield 373\011com/google/android/gms/internal/zzgo:zzwr\011Ljava/lang/String;
    //   434: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   437: pop
    //   438: aload 4
    //   440: ldc_w 375
    //   443: aload_0
    //   444: getfield 105\011com/google/android/gms/internal/zzgo:zzlP\011Lcom/google/android/gms/internal/zzhy;
    //   447: getfield 111\011com/google/android/gms/internal/zzhy:zzzH\011Ljava/lang/String;
    //   450: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   453: pop
    //   454: aload 4
    //   456: aload_1
    //   457: invokestatic 378\011com/google/android/gms/internal/zzgx:zza\011(Ljava/util/HashMap;Lcom/google/android/gms/internal/zzhb;)V
    //   460: aload 4
    //   462: ldc_w 380
    //   465: new 322\011java/lang/Integer
    //   468: dup
    //   469: aload_3
    //   470: invokevirtual 383\011com/google/android/gms/internal/zzbv:zzbX\011()I
    //   473: invokespecial 384\011java/lang/Integer:<init>\011(I)V
    //   476: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   479: pop
    //   480: aload_0
    //   481: getfield 261\011com/google/android/gms/internal/zzgo:zzwn\011Lcom/google/android/gms/internal/zzax;
    //   484: getfield 387\011com/google/android/gms/internal/zzax:versionCode\011I
    //   487: iconst_2
    //   488: if_icmplt +25 -> 513
    //   491: aload_0
    //   492: getfield 261\011com/google/android/gms/internal/zzgo:zzwn\011Lcom/google/android/gms/internal/zzax;
    //   495: getfield 391\011com/google/android/gms/internal/zzax:zzoT\011Landroid/location/Location;
    //   498: ifnull +15 -> 513
    //   501: aload 4
    //   503: aload_0
    //   504: getfield 261\011com/google/android/gms/internal/zzgo:zzwn\011Lcom/google/android/gms/internal/zzax;
    //   507: getfield 391\011com/google/android/gms/internal/zzax:zzoT\011Landroid/location/Location;
    //   510: invokestatic 394\011com/google/android/gms/internal/zzgx:zza\011(Ljava/util/HashMap;Landroid/location/Location;)V
    //   513: aload_0
    //   514: getfield 395\011com/google/android/gms/internal/zzgo:versionCode\011I
    //   517: iconst_2
    //   518: if_icmplt +16 -> 534
    //   521: aload 4
    //   523: ldc_w 397
    //   526: aload_0
    //   527: getfield 400\011com/google/android/gms/internal/zzgo:zzws\011Landroid/os/Bundle;
    //   530: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   533: pop
    //   534: aload_0
    //   535: getfield 395\011com/google/android/gms/internal/zzgo:versionCode\011I
    //   538: iconst_4
    //   539: if_icmplt +26 -> 565
    //   542: aload_0
    //   543: getfield 223\011com/google/android/gms/internal/zzgo:zzwv\011Z
    //   546: ifeq +19 -> 565
    //   549: aload 4
    //   551: ldc_w 402
    //   554: aload_0
    //   555: getfield 223\011com/google/android/gms/internal/zzgo:zzwv\011Z
    //   558: invokestatic 407\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
    //   561: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   564: pop
    //   565: aload_0
    //   566: getfield 395\011com/google/android/gms/internal/zzgo:versionCode\011I
    //   569: iconst_4
    //   570: if_icmplt +23 -> 593
    //   573: aload_0
    //   574: getfield 410\011com/google/android/gms/internal/zzgo:zzwu\011Landroid/os/Bundle;
    //   577: ifnull +16 -> 593
    //   580: aload 4
    //   582: ldc_w 412
    //   585: aload_0
    //   586: getfield 410\011com/google/android/gms/internal/zzgo:zzwu\011Landroid/os/Bundle;
    //   589: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   592: pop
    //   593: aload_0
    //   594: getfield 395\011com/google/android/gms/internal/zzgo:versionCode\011I
    //   597: iconst_5
    //   598: if_icmplt +237 -> 835
    //   601: aload 4
    //   603: ldc_w 414
    //   606: aload_0
    //   607: getfield 415\011com/google/android/gms/internal/zzgo:zzwz\011F
    //   610: invokestatic 420\011java/lang/Float:valueOf\011(F)Ljava/lang/Float;
    //   613: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   616: pop
    //   617: aload 4
    //   619: ldc_w 422
    //   622: aload_0
    //   623: getfield 425\011com/google/android/gms/internal/zzgo:zzwy\011I
    //   626: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   629: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   632: pop
    //   633: aload 4
    //   635: ldc_w 427
    //   638: aload_0
    //   639: getfield 430\011com/google/android/gms/internal/zzgo:zzwx\011I
    //   642: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   645: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   648: pop
    //   649: aload_0
    //   650: getfield 395\011com/google/android/gms/internal/zzgo:versionCode\011I
    //   653: bipush 6
    //   655: if_icmplt +104 -> 759
    //   658: aload_0
    //   659: getfield 433\011com/google/android/gms/internal/zzgo:zzwA\011Ljava/lang/String;
    //   662: invokestatic 82\011android/text/TextUtils:isEmpty\011(Ljava/lang/CharSequence;)Z
    //   665: istore 32
    //   667: iload 32
    //   669: ifne +23 -> 692
    //   672: aload 4
    //   674: ldc_w 435
    //   677: new 25\011org/json/JSONObject
    //   680: dup
    //   681: aload_0
    //   682: getfield 433\011com/google/android/gms/internal/zzgo:zzwA\011Ljava/lang/String;
    //   685: invokespecial 26\011org/json/JSONObject:<init>\011(Ljava/lang/String;)V
    //   688: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   691: pop
    //   692: getstatic 441\011com/google/android/gms/internal/zzca:zzqL\011Lcom/google/android/gms/internal/zzbx;
    //   695: invokevirtual 447\011com/google/android/gms/internal/zzbx:get\011()Ljava/lang/Object;
    //   698: checkcast 404\011java/lang/Boolean
    //   701: invokevirtual 451\011java/lang/Boolean:booleanValue\011()Z
    //   704: ifeq +39 -> 743
    //   707: aload_0
    //   708: getfield 454\011com/google/android/gms/internal/zzgo:zzwB\011Z
    //   711: ifeq +32 -> 743
    //   714: aload 4
    //   716: ldc_w 456
    //   719: aload_0
    //   720: getfield 459\011com/google/android/gms/internal/zzgo:zzwC\011I
    //   723: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   726: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   729: pop
    //   730: aload 4
    //   732: ldc_w 461
    //   735: aload_0
    //   736: getfield 464\011com/google/android/gms/internal/zzgo:zzwD\011Ljava/lang/String;
    //   739: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   742: pop
    //   743: aload 4
    //   745: ldc_w 466
    //   748: aload_0
    //   749: getfield 469\011com/google/android/gms/internal/zzgo:zzwE\011J
    //   752: invokestatic 474\011java/lang/Long:valueOf\011(J)Ljava/lang/Long;
    //   755: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   758: pop
    //   759: aload_0
    //   760: getfield 395\011com/google/android/gms/internal/zzgo:versionCode\011I
    //   763: bipush 7
    //   765: if_icmplt +16 -> 781
    //   768: aload 4
    //   770: ldc_w 476
    //   773: aload_0
    //   774: getfield 479\011com/google/android/gms/internal/zzgo:zzwF\011Ljava/lang/String;
    //   777: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   780: pop
    //   781: iconst_2
    //   782: invokestatic 483\011com/google/android/gms/internal/zzhx:zzA\011(I)Z
    //   785: ifeq +41 -> 826
    //   788: invokestatic 487\011com/google/android/gms/internal/zzab:zzaM\011()Lcom/google/android/gms/internal/zzho;
    //   791: aload 4
    //   793: invokevirtual 493\011com/google/android/gms/internal/zzho:zzw\011(Ljava/util/Map;)Lorg/json/JSONObject;
    //   796: iconst_2
    //   797: invokevirtual 495\011org/json/JSONObject:toString\011(I)Ljava/lang/String;
    //   800: astore 30
    //   802: new 154\011java/lang/StringBuilder
    //   805: dup
    //   806: invokespecial 155\011java/lang/StringBuilder:<init>\011()V
    //   809: ldc_w 497
    //   812: invokevirtual 161\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   815: aload 30
    //   817: invokevirtual 161\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   820: invokevirtual 168\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   823: invokestatic 500\011com/google/android/gms/internal/zzhx:zzab\011(Ljava/lang/String;)V
    //   826: invokestatic 487\011com/google/android/gms/internal/zzab:zzaM\011()Lcom/google/android/gms/internal/zzho;
    //   829: aload 4
    //   831: invokevirtual 493\011com/google/android/gms/internal/zzho:zzw\011(Ljava/util/Map;)Lorg/json/JSONObject;
    //   834: areturn
    //   835: aload 4
    //   837: ldc_w 414
    //   840: aload_1
    //   841: getfield 305\011com/google/android/gms/internal/zzhb:zzwz\011F
    //   844: invokestatic 420\011java/lang/Float:valueOf\011(F)Ljava/lang/Float;
    //   847: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   850: pop
    //   851: aload 4
    //   853: ldc_w 422
    //   856: aload_1
    //   857: getfield 501\011com/google/android/gms/internal/zzhb:zzwy\011I
    //   860: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   863: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   866: pop
    //   867: aload 4
    //   869: ldc_w 427
    //   872: aload_1
    //   873: getfield 502\011com/google/android/gms/internal/zzhb:zzwx\011I
    //   876: invokestatic 326\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
    //   879: invokevirtual 251\011java/util/HashMap:put\011(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   882: pop
    //   883: goto -234 -> 649
    //   886: astore 5
    //   888: new 154\011java/lang/StringBuilder
    //   891: dup
    //   892: invokespecial 155\011java/lang/StringBuilder:<init>\011()V
    //   895: ldc_w 504
    //   898: invokevirtual 161\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   901: aload 5
    //   903: invokevirtual 165\011org/json/JSONException:getMessage\011()Ljava/lang/String;
    //   906: invokevirtual 161\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   909: invokevirtual 168\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   912: invokestatic 89\011com/google/android/gms/internal/zzhx:zzac\011(Ljava/lang/String;)V
    //   915: aconst_null
    //   916: areturn
    //   917: astore 36
    //   919: ldc_w 506
    //   922: aload 36
    //   924: invokestatic 510\011com/google/android/gms/internal/zzhx:zzd\011(Ljava/lang/String;Ljava/lang/Throwable;)V
    //   927: goto -235 -> 692
    //
    // Exception table:
    //   from\011to\011target\011type
    //   0\01140\011886\011org/json/JSONException
    //   40\01160\011886\011org/json/JSONException
    //   60\011108\011886\011org/json/JSONException
    //   108\011132\011886\011org/json/JSONException
    //   132\011165\011886\011org/json/JSONException
    //   175\011199\011886\011org/json/JSONException
    //   199\011222\011886\011org/json/JSONException
    //   222\011263\011886\011org/json/JSONException
    //   263\011271\011886\011org/json/JSONException
    //   277\011284\011886\011org/json/JSONException
    //   287\011294\011886\011org/json/JSONException
    //   297\011308\011886\011org/json/JSONException
    //   308\011344\011886\011org/json/JSONException
    //   344\011399\011886\011org/json/JSONException
    //   399\011513\011886\011org/json/JSONException
    //   513\011534\011886\011org/json/JSONException
    //   534\011565\011886\011org/json/JSONException
    //   565\011593\011886\011org/json/JSONException
    //   593\011649\011886\011org/json/JSONException
    //   649\011667\011886\011org/json/JSONException
    //   692\011743\011886\011org/json/JSONException
    //   743\011759\011886\011org/json/JSONException
    //   759\011781\011886\011org/json/JSONException
    //   781\011826\011886\011org/json/JSONException
    //   826\011835\011886\011org/json/JSONException
    //   835\011883\011886\011org/json/JSONException
    //   919\011927\011886\011org/json/JSONException
    //   672\011692\011917\011org/json/JSONException
  }

  private static void zza(HashMap<String, Object> paramHashMap, Location paramLocation)
  {
    HashMap localHashMap = new HashMap();
    Float localFloat = Float.valueOf(1000.0F * paramLocation.getAccuracy());
    Long localLong1 = Long.valueOf(1000L * paramLocation.getTime());
    Long localLong2 = Long.valueOf(()(10000000.0D * paramLocation.getLatitude()));
    Long localLong3 = Long.valueOf(()(10000000.0D * paramLocation.getLongitude()));
    localHashMap.put("radius", localFloat);
    localHashMap.put("lat", localLong2);
    localHashMap.put("long", localLong3);
    localHashMap.put("time", localLong1);
    paramHashMap.put("uule", localHashMap);
  }

  private static void zza(HashMap<String, Object> paramHashMap, zzax paramzzax)
  {
    String str = zzhk.zzep();
    if (str != null)
      paramHashMap.put("abf", str);
    if (paramzzax.zzoL != -1L)
      paramHashMap.put("cust_age", zzxu.format(new Date(paramzzax.zzoL)));
    if (paramzzax.extras != null)
      paramHashMap.put("extras", paramzzax.extras);
    if (paramzzax.zzoM != -1)
      paramHashMap.put("cust_gender", Integer.valueOf(paramzzax.zzoM));
    if (paramzzax.zzoN != null)
      paramHashMap.put("kw", paramzzax.zzoN);
    if (paramzzax.zzoP != -1)
      paramHashMap.put("tag_for_child_directed_treatment", Integer.valueOf(paramzzax.zzoP));
    if (paramzzax.zzoO)
      paramHashMap.put("adtest", "on");
    if (paramzzax.versionCode >= 2)
    {
      if (paramzzax.zzoQ)
        paramHashMap.put("d_imp_hdr", Integer.valueOf(1));
      if (!TextUtils.isEmpty(paramzzax.zzoR))
        paramHashMap.put("ppid", paramzzax.zzoR);
      if (paramzzax.zzoS != null)
        zza(paramHashMap, paramzzax.zzoS);
    }
    if ((paramzzax.versionCode >= 3) && (paramzzax.zzoU != null))
      paramHashMap.put("url", paramzzax.zzoU);
    if (paramzzax.versionCode >= 5)
    {
      if (paramzzax.zzoW != null)
        paramHashMap.put("custom_targeting", paramzzax.zzoW);
      if (paramzzax.zzoX != null)
        paramHashMap.put("category_exclusions", paramzzax.zzoX);
      if (paramzzax.zzoY != null)
        paramHashMap.put("request_agent", paramzzax.zzoY);
    }
  }

  private static void zza(HashMap<String, Object> paramHashMap, zzbs paramzzbs)
  {
    if (Color.alpha(paramzzbs.zzpN) != 0)
      paramHashMap.put("acolor", zzy(paramzzbs.zzpN));
    if (Color.alpha(paramzzbs.backgroundColor) != 0)
      paramHashMap.put("bgcolor", zzy(paramzzbs.backgroundColor));
    if ((Color.alpha(paramzzbs.zzpO) != 0) && (Color.alpha(paramzzbs.zzpP) != 0))
    {
      paramHashMap.put("gradientto", zzy(paramzzbs.zzpO));
      paramHashMap.put("gradientfrom", zzy(paramzzbs.zzpP));
    }
    if (Color.alpha(paramzzbs.zzpQ) != 0)
      paramHashMap.put("bcolor", zzy(paramzzbs.zzpQ));
    paramHashMap.put("bthick", Integer.toString(paramzzbs.zzpR));
    Object localObject1;
    Object localObject2;
    switch (paramzzbs.zzpS)
    {
    default:
      localObject1 = null;
      if (localObject1 != null)
        paramHashMap.put("btype", localObject1);
      int i = paramzzbs.zzpT;
      localObject2 = null;
      switch (i)
      {
      default:
      case 2:
      case 0:
      case 1:
      }
      break;
    case 0:
    case 1:
    case 2:
    case 3:
    }
    while (true)
    {
      if (localObject2 != null)
        paramHashMap.put("callbuttoncolor", localObject2);
      if (paramzzbs.zzpU != null)
        paramHashMap.put("channel", paramzzbs.zzpU);
      if (Color.alpha(paramzzbs.zzpV) != 0)
        paramHashMap.put("dcolor", zzy(paramzzbs.zzpV));
      if (paramzzbs.zzpW != null)
        paramHashMap.put("font", paramzzbs.zzpW);
      if (Color.alpha(paramzzbs.zzpX) != 0)
        paramHashMap.put("hcolor", zzy(paramzzbs.zzpX));
      paramHashMap.put("headersize", Integer.toString(paramzzbs.zzpY));
      if (paramzzbs.zzpZ != null)
        paramHashMap.put("q", paramzzbs.zzpZ);
      return;
      localObject1 = "none";
      break;
      localObject1 = "dashed";
      break;
      localObject1 = "dotted";
      break;
      localObject1 = "solid";
      break;
      localObject2 = "dark";
      continue;
      localObject2 = "light";
      continue;
      localObject2 = "medium";
    }
  }

  private static void zza(HashMap<String, Object> paramHashMap, zzhb paramzzhb)
  {
    paramHashMap.put("am", Integer.valueOf(paramzzhb.zzxY));
    paramHashMap.put("cog", zzw(paramzzhb.zzxZ));
    paramHashMap.put("coh", zzw(paramzzhb.zzya));
    if (!TextUtils.isEmpty(paramzzhb.zzyb))
      paramHashMap.put("carrier", paramzzhb.zzyb);
    paramHashMap.put("gl", paramzzhb.zzyc);
    if (paramzzhb.zzyd)
      paramHashMap.put("simulator", Integer.valueOf(1));
    paramHashMap.put("ma", zzw(paramzzhb.zzye));
    paramHashMap.put("sp", zzw(paramzzhb.zzyf));
    paramHashMap.put("hl", paramzzhb.zzyg);
    if (!TextUtils.isEmpty(paramzzhb.zzyh))
      paramHashMap.put("mv", paramzzhb.zzyh);
    paramHashMap.put("muv", Integer.valueOf(paramzzhb.zzyi));
    if (paramzzhb.zzyj != -2)
      paramHashMap.put("cnt", Integer.valueOf(paramzzhb.zzyj));
    paramHashMap.put("gnt", Integer.valueOf(paramzzhb.zzyk));
    paramHashMap.put("pt", Integer.valueOf(paramzzhb.zzyl));
    paramHashMap.put("rm", Integer.valueOf(paramzzhb.zzym));
    paramHashMap.put("riv", Integer.valueOf(paramzzhb.zzyn));
    Bundle localBundle1 = new Bundle();
    localBundle1.putInt("active_network_state", paramzzhb.zzyr);
    localBundle1.putBoolean("active_network_metered", paramzzhb.zzyq);
    paramHashMap.put("connectivity", localBundle1);
    Bundle localBundle2 = new Bundle();
    localBundle2.putBoolean("is_charging", paramzzhb.zzyp);
    localBundle2.putDouble("battery_level", paramzzhb.zzyo);
    paramHashMap.put("battery", localBundle2);
  }

  private static Integer zzw(boolean paramBoolean)
  {
    if (paramBoolean);
    for (int i = 1; ; i = 0)
      return Integer.valueOf(i);
  }

  private static String zzy(int paramInt)
  {
    Locale localLocale = Locale.US;
    Object[] arrayOfObject = new Object[1];
    arrayOfObject[0] = Integer.valueOf(0xFFFFFF & paramInt);
    return String.format(localLocale, "#%06x", arrayOfObject);
  }
}