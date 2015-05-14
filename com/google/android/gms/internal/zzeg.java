package com.google.android.gms.internal;

import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzeg
{
  private final zzic zzmu;
  private final String zztP;

  public zzeg(zzic paramzzic)
  {
    this(paramzzic, "");
  }

  public zzeg(zzic paramzzic, String paramString)
  {
    this.zzmu = paramzzic;
    this.zztP = paramString;
  }

  public void zzH(String paramString)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("message", paramString).put("action", this.zztP);
      this.zzmu.zzb("onError", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occurred while dispatching error event.", localJSONException);
    }
  }

  public void zzI(String paramString)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("js", paramString);
      this.zzmu.zzb("onReadyEventReceived", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occured while dispatching ready Event.", localJSONException);
    }
  }

  public void zzJ(String paramString)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("state", paramString);
      this.zzmu.zzb("onStateChanged", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occured while dispatching state change.", localJSONException);
    }
  }

  public void zza(int paramInt1, int paramInt2, int paramInt3, int paramInt4, float paramFloat, int paramInt5)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("width", paramInt1).put("height", paramInt2).put("maxSizeWidth", paramInt3).put("maxSizeHeight", paramInt4).put("density", paramFloat).put("rotation", paramInt5);
      this.zzmu.zzb("onScreenInfoChanged", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occured while obtaining screen information.", localJSONException);
    }
  }

  public void zzb(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("x", paramInt1).put("y", paramInt2).put("width", paramInt3).put("height", paramInt4);
      this.zzmu.zzb("onSizeChanged", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occured while dispatching size change.", localJSONException);
    }
  }

  public void zzc(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    try
    {
      JSONObject localJSONObject = new JSONObject().put("x", paramInt1).put("y", paramInt2).put("width", paramInt3).put("height", paramInt4);
      this.zzmu.zzb("onDefaultPositionReceived", localJSONObject);
      return;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzb("Error occured while dispatching default position.", localJSONException);
    }
  }
}