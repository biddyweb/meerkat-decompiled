package com.google.android.gms.internal;

import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzcn
{
  private zzt zzrv;
  private zzah zzrw;
  private JSONObject zzrx;

  public zzcn(zzt paramzzt, zzah paramzzah, JSONObject paramJSONObject)
  {
    this.zzrv = paramzzt;
    this.zzrw = paramzzah;
    this.zzrx = paramJSONObject;
  }

  public void recordImpression()
  {
    this.zzrv.zzan();
  }

  public void zzb(String paramString, int paramInt)
  {
    try
    {
      JSONObject localJSONObject1 = new JSONObject();
      localJSONObject1.put("asset", paramInt);
      localJSONObject1.put("template", paramString);
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("ad", this.zzrx);
      localJSONObject2.put("click", localJSONObject1);
      this.zzrw.zza("google.afma.nativeAds.handleClick", localJSONObject2);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Unable to create click JSON.", localJSONException);
    }
  }
}