package com.google.android.gms.internal;

import android.text.TextUtils;
import com.google.android.gms.common.internal.zzx;
import java.util.Map;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class zzgt$1
  implements zzcv
{
  zzgt$1(zzgt paramzzgt, zzah paramzzah, zzgt.zzb paramzzb, zzhq paramzzhq)
  {
  }

  public void zza(zzic paramzzic, Map<String, String> paramMap)
  {
    this.zzwZ.zzb("/nativeAdPreProcess", this.zzxa.zzxe);
    try
    {
      String str = (String)paramMap.get("success");
      if (!TextUtils.isEmpty(str))
      {
        this.zzxb.zzb(new JSONObject(str).getJSONArray("ads").getJSONObject(0));
        return;
      }
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Malformed native JSON response.", localJSONException);
      this.zzxc.zzx(0);
      zzx.zza(this.zzxc.zzdO(), "Unable to set the ad state error!");
      this.zzxb.zzb(null);
    }
  }
}