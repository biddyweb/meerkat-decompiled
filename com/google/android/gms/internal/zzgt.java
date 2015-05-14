package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeoutException;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzgt
  implements Callable<zzhe>
{
  private final Context mContext;
  private final Object zznh = new Object();
  private final zzt zzrv;
  private final zzhe.zza zzvN;
  private int zzvR;
  private final zzht zzwV;
  private final zzai zzwW;
  private boolean zzwX;
  private List<String> zzwY;

  public zzgt(Context paramContext, zzt paramzzt, zzai paramzzai, zzht paramzzht, zzhe.zza paramzza)
  {
    this.mContext = paramContext;
    this.zzrv = paramzzt;
    this.zzwV = paramzzht;
    this.zzwW = paramzzai;
    this.zzvN = paramzza;
    this.zzwX = false;
    this.zzvR = -2;
    this.zzwY = null;
  }

  private zzcn.zza zza(zzah paramzzah, zzgt.zza paramzza, JSONObject paramJSONObject)
    throws ExecutionException, InterruptedException, JSONException
  {
    if (zzdO())
      return null;
    String[] arrayOfString = zzb(paramJSONObject.getJSONObject("tracking_urls_and_actions"), "impression_tracking_urls");
    if (arrayOfString == null);
    zzcn.zza localzza;
    for (List localList = null; ; localList = Arrays.asList(arrayOfString))
    {
      this.zzwY = localList;
      localzza = paramzza.zza(this, paramJSONObject);
      if (localzza != null)
        break;
      zzhx.zzZ("Failed to retrieve ad assets.");
      return null;
    }
    localzza.zza(new zzcn(this.zzrv, paramzzah, paramJSONObject));
    return localzza;
  }

  private zzhe zza(zzcn.zza paramzza)
  {
    while (true)
    {
      synchronized (this.zznh)
      {
        int i = this.zzvR;
        if ((paramzza == null) && (this.zzvR == -2))
          i = 0;
        if (i != -2)
        {
          localzza = null;
          return new zzhe(this.zzvN.zzyy.zzwn, null, this.zzvN.zzyz.zzst, i, this.zzvN.zzyz.zzsu, this.zzwY, this.zzvN.zzyz.orientation, this.zzvN.zzyz.zzsx, this.zzvN.zzyy.zzwq, false, null, null, null, null, null, 0L, this.zzvN.zzlV, this.zzvN.zzyz.zzwH, this.zzvN.zzyv, this.zzvN.zzyw, this.zzvN.zzyz.zzwN, this.zzvN.zzys, localzza, this.zzvN.zzyy.zzwD);
        }
      }
      zzcn.zza localzza = paramzza;
    }
  }

  private String[] zzb(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    JSONArray localJSONArray = paramJSONObject.optJSONArray(paramString);
    if (localJSONArray == null)
      return null;
    String[] arrayOfString = new String[localJSONArray.length()];
    for (int i = 0; i < localJSONArray.length(); i++)
      arrayOfString[i] = localJSONArray.getString(i);
    return arrayOfString;
  }

  private JSONObject zzc(zzah paramzzah)
    throws TimeoutException, JSONException
  {
    if (zzdO())
      return null;
    zzhq localzzhq = new zzhq();
    zzgt.zzb localzzb = new zzgt.zzb(this);
    zzgt.1 local1 = new zzgt.1(this, paramzzah, localzzb, localzzhq);
    localzzb.zzxe = local1;
    paramzzah.zza("/nativeAdPreProcess", local1);
    paramzzah.zza("google.afma.nativeAds.preProcessJsonGmsg", new JSONObject(this.zzvN.zzyz.zzwG));
    return (JSONObject)localzzhq.get();
  }

  private zzah zzdN()
    throws CancellationException, ExecutionException, InterruptedException, TimeoutException
  {
    if (zzdO())
      return null;
    zzah localzzah = (zzah)this.zzwW.zza(this.mContext, this.zzvN.zzyy.zzlP, "https://googleads.g.doubleclick.net/mads/static/mad/sdk/native/native_ads.html").get();
    localzzah.zza(this.zzrv, this.zzrv, this.zzrv, this.zzrv, false, this.zzrv, this.zzrv, null, this.zzrv);
    return localzzah;
  }

  public Future<Drawable> zza(JSONObject paramJSONObject, String paramString, boolean paramBoolean)
    throws JSONException
  {
    JSONObject localJSONObject;
    if (paramBoolean)
    {
      localJSONObject = paramJSONObject.getJSONObject(paramString);
      if (localJSONObject == null)
        localJSONObject = new JSONObject();
      if (!paramBoolean)
        break label72;
    }
    label72: for (String str = localJSONObject.getString("url"); ; str = localJSONObject.optString("url"))
    {
      if (!TextUtils.isEmpty(str))
        break label85;
      zza(0, paramBoolean);
      return new zzhr(null);
      localJSONObject = paramJSONObject.optJSONObject(paramString);
      break;
    }
    label85: return this.zzwV.zza(str, new zzgt.2(this, paramBoolean));
  }

  public void zza(int paramInt, boolean paramBoolean)
  {
    if (paramBoolean)
      zzx(paramInt);
  }

  protected zzgt.zza zzc(JSONObject paramJSONObject)
    throws JSONException
  {
    if (zzdO())
      return null;
    String str = paramJSONObject.getString("template_id");
    if ("2".equals(str))
      return new zzgu();
    if ("1".equals(str))
      return new zzgv();
    zzx(0);
    return null;
  }

  public zzhe zzdM()
  {
    try
    {
      zzah localzzah = zzdN();
      JSONObject localJSONObject = zzc(localzzah);
      zzhe localzzhe = zza(zza(localzzah, zzc(localJSONObject), localJSONObject));
      return localzzhe;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzd("Malformed native JSON response.", localJSONException);
      if (!this.zzwX)
        zzx(0);
      return zza(null);
    }
    catch (TimeoutException localTimeoutException)
    {
      while (true)
        zzhx.zzd("Timeout when loading native ad.", localTimeoutException);
    }
    catch (InterruptedException localInterruptedException)
    {
      break label47;
    }
    catch (ExecutionException localExecutionException)
    {
      break label47;
    }
    catch (CancellationException localCancellationException)
    {
      label47: break label47;
    }
  }

  public boolean zzdO()
  {
    synchronized (this.zznh)
    {
      boolean bool = this.zzwX;
      return bool;
    }
  }

  public void zzx(int paramInt)
  {
    synchronized (this.zznh)
    {
      this.zzwX = true;
      this.zzvR = paramInt;
      return;
    }
  }
}