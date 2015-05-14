package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

final class zzcu$2
  implements zzcv
{
  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    String str1 = (String)paramMap.get("urls");
    if (TextUtils.isEmpty(str1))
    {
      zzhx.zzac("URLs missing in canOpenURLs GMSG.");
      return;
    }
    String[] arrayOfString1 = str1.split(",");
    HashMap localHashMap = new HashMap();
    PackageManager localPackageManager = paramzzic.getContext().getPackageManager();
    int i = arrayOfString1.length;
    int j = 0;
    if (j < i)
    {
      String str2 = arrayOfString1[j];
      String[] arrayOfString2 = str2.split(";", 2);
      String str3 = arrayOfString2[0].trim();
      String str4;
      if (arrayOfString2.length > 1)
      {
        str4 = arrayOfString2[1].trim();
        label110: if (localPackageManager.resolveActivity(new Intent(str4, Uri.parse(str3)), 65536) == null)
          break label163;
      }
      label163: for (boolean bool = true; ; bool = false)
      {
        localHashMap.put(str2, Boolean.valueOf(bool));
        j++;
        break;
        str4 = "android.intent.action.VIEW";
        break label110;
      }
    }
    paramzzic.zzb("openableURLs", localHashMap);
  }
}