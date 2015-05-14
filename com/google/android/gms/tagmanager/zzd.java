package com.google.android.gms.tagmanager;

import android.content.Context;
import android.net.Uri;
import java.util.Map;

class zzd
  implements DataLayer.zzb
{
  private final Context zzlN;

  public zzd(Context paramContext)
  {
    this.zzlN = paramContext;
  }

  public void zzI(Map<String, Object> paramMap)
  {
    Object localObject1 = paramMap.get("gtm.url");
    Object localObject3;
    if (localObject1 == null)
    {
      localObject3 = paramMap.get("gtm");
      if ((localObject3 == null) || (!(localObject3 instanceof Map)));
    }
    for (Object localObject2 = ((Map)localObject3).get("url"); ; localObject2 = localObject1)
    {
      if ((localObject2 == null) || (!(localObject2 instanceof String)));
      String str;
      do
      {
        return;
        str = Uri.parse((String)localObject2).getQueryParameter("referrer");
      }
      while (str == null);
      zzaw.zzj(this.zzlN, str);
      return;
    }
  }
}