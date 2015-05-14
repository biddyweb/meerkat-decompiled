package com.google.android.gms.internal;

import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzee
{
  private final boolean zztA;
  private final boolean zztB;
  private final boolean zztC;
  private final boolean zztD;
  private final boolean zztE;

  private zzee(zzee.zza paramzza)
  {
    this.zztA = zzee.zza.zza(paramzza);
    this.zztB = zzee.zza.zzb(paramzza);
    this.zztC = zzee.zza.zzc(paramzza);
    this.zztD = zzee.zza.zzd(paramzza);
    this.zztE = zzee.zza.zze(paramzza);
  }

  public JSONObject toJson()
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("sms", this.zztA).put("tel", this.zztB).put("calendar", this.zztC).put("storePicture", this.zztD).put("inlineVideo", this.zztE);
      return localJSONObject;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occured while obtaining the MRAID capabilities.", localJSONException);
    }
    return null;
  }
}