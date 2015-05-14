package com.google.android.gms.internal;

import android.content.Context;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzdp
{
  public List<String> zza(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    JSONArray localJSONArray = paramJSONObject.optJSONArray(paramString);
    if (localJSONArray != null)
    {
      ArrayList localArrayList = new ArrayList(localJSONArray.length());
      for (int i = 0; i < localJSONArray.length(); i++)
        localArrayList.add(localJSONArray.getString(i));
      return Collections.unmodifiableList(localArrayList);
    }
    return null;
  }

  public void zza(Context paramContext, String paramString1, zzhe paramzzhe, String paramString2, boolean paramBoolean, List<String> paramList)
  {
    if (paramBoolean);
    for (String str1 = "1"; ; str1 = "0")
    {
      Iterator localIterator = paramList.iterator();
      while (localIterator.hasNext())
      {
        String str2 = ((String)localIterator.next()).replaceAll("@gw_adlocid@", paramString2).replaceAll("@gw_adnetrefresh@", str1).replaceAll("@gw_qdata@", paramzzhe.zzyt.zzsw).replaceAll("@gw_sdkver@", paramString1).replaceAll("@gw_sessid@", zzab.zzaP().getSessionId()).replaceAll("@gw_seqnum@", paramzzhe.zzwq);
        if (paramzzhe.zzsL != null)
          str2 = str2.replaceAll("@gw_adnetid@", paramzzhe.zzsL.zzsl).replaceAll("@gw_allocid@", paramzzhe.zzsL.zzsn);
        new zzhu(paramContext, paramString1, str2).start();
      }
    }
  }
}