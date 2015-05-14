package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Map;

@zzgi
public final class zzda
  implements zzcv
{
  private final zzu zzrK;
  private final zzeb zzrL;
  private final zzcw zzrN;

  public zzda(zzcw paramzzcw, zzu paramzzu, zzeb paramzzeb)
  {
    this.zzrN = paramzzcw;
    this.zzrK = paramzzu;
    this.zzrL = paramzzeb;
  }

  private static boolean zzc(Map<String, String> paramMap)
  {
    return "1".equals(paramMap.get("custom_close"));
  }

  private static int zzd(Map<String, String> paramMap)
  {
    String str = (String)paramMap.get("o");
    if (str != null)
    {
      if ("p".equalsIgnoreCase(str))
        return zzab.zzaO().zzey();
      if ("l".equalsIgnoreCase(str))
        return zzab.zzaO().zzex();
      if ("c".equalsIgnoreCase(str))
        return zzab.zzaO().zzez();
    }
    return -1;
  }

  private void zzl(boolean paramBoolean)
  {
    if (this.zzrL != null)
      this.zzrL.zzm(paramBoolean);
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str1 = (String)paramMap.get("a");
    if (str1 == null)
      zzhx.zzac("Action missing from an open GMSG.");
    zzid localzzid;
    String str4;
    String str5;
    do
    {
      return;
      if ((this.zzrK != null) && (!this.zzrK.zzaB()))
      {
        this.zzrK.zzd((String)paramMap.get("u"));
        return;
      }
      localzzid = paramzzic.zzeG();
      if ("expand".equalsIgnoreCase(str1))
      {
        if (paramzzic.zzeK())
        {
          zzhx.zzac("Cannot expand WebView that is already expanded.");
          return;
        }
        zzl(false);
        localzzid.zza(zzc(paramMap), zzd(paramMap));
        return;
      }
      if ("webapp".equalsIgnoreCase(str1))
      {
        String str6 = (String)paramMap.get("u");
        zzl(false);
        if (str6 != null)
        {
          localzzid.zza(zzc(paramMap), zzd(paramMap), str6);
          return;
        }
        localzzid.zza(zzc(paramMap), zzd(paramMap), (String)paramMap.get("html"), (String)paramMap.get("baseurl"));
        return;
      }
      if (!"in_app_purchase".equalsIgnoreCase(str1))
        break;
      str4 = (String)paramMap.get("product_id");
      str5 = (String)paramMap.get("report_urls");
    }
    while (this.zzrN == null);
    if ((str5 != null) && (!str5.isEmpty()))
    {
      String[] arrayOfString = str5.split(" ");
      this.zzrN.zza(str4, new ArrayList(Arrays.asList(arrayOfString)));
      return;
    }
    this.zzrN.zza(str4, new ArrayList());
    return;
    zzl(true);
    paramzzic.zzeI();
    String str2 = (String)paramMap.get("u");
    if (!TextUtils.isEmpty(str2));
    for (String str3 = zzab.zzaM().zzb(paramzzic, str2); ; str3 = str2)
    {
      localzzid.zza(new zzek((String)paramMap.get("i"), str3, (String)paramMap.get("m"), (String)paramMap.get("p"), (String)paramMap.get("c"), (String)paramMap.get("f"), (String)paramMap.get("e")));
      return;
    }
  }
}