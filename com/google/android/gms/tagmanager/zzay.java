package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzb;
import com.google.android.gms.internal.zzd.zza;
import com.google.android.gms.internal.zzvl.zza;
import com.google.android.gms.internal.zzvl.zzb;
import com.google.android.gms.internal.zzvl.zzc;
import com.google.android.gms.internal.zzvl.zzd;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class zzay
{
  public static zzvl.zzc zzdd(String paramString)
    throws JSONException
  {
    zzd.zza localzza = zzq(new JSONObject(paramString));
    zzvl.zzd localzzd = zzvl.zzc.zzux();
    for (int i = 0; i < localzza.zzgx.length; i++)
      localzzd.zzc(zzvl.zza.zzuu().zzb(zzb.zzdf.toString(), localzza.zzgx[i]).zzb(zzb.zzcU.toString(), zzde.zzdo(zzm.zzsG())).zzb(zzm.zzsH(), localzza.zzgy[i]).zzuw());
    return localzzd.zzuA();
  }

  private static zzd.zza zzq(Object paramObject)
    throws JSONException
  {
    return zzde.zzx(zzr(paramObject));
  }

  static Object zzr(Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof JSONArray))
      throw new RuntimeException("JSONArrays are not supported");
    if (JSONObject.NULL.equals(paramObject))
      throw new RuntimeException("JSON nulls are not supported");
    if ((paramObject instanceof JSONObject))
    {
      JSONObject localJSONObject = (JSONObject)paramObject;
      HashMap localHashMap = new HashMap();
      Iterator localIterator = localJSONObject.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        localHashMap.put(str, zzr(localJSONObject.get(str)));
      }
      paramObject = localHashMap;
    }
    return paramObject;
  }
}