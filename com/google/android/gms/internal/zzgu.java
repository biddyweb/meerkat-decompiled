package com.google.android.gms.internal;

import android.graphics.drawable.Drawable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzgu
  implements zzgt.zza<zzcl>
{
  public zzcl zzb(zzgt paramzzgt, JSONObject paramJSONObject)
    throws JSONException, InterruptedException, ExecutionException
  {
    Future localFuture1 = paramzzgt.zza(paramJSONObject, "image", true);
    Future localFuture2 = paramzzgt.zza(paramJSONObject, "app_icon", true);
    return new zzcl(paramJSONObject.getString("headline"), (Drawable)localFuture1.get(), paramJSONObject.getString("body"), (Drawable)localFuture2.get(), paramJSONObject.getString("call_to_action"), paramJSONObject.optDouble("rating", -1.0D), paramJSONObject.optString("store"), paramJSONObject.optString("price"));
  }
}