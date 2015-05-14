package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public final class zzdk
{
  public final List<zzdj> zzsr;
  public final long zzss;
  public final List<String> zzst;
  public final List<String> zzsu;
  public final List<String> zzsv;
  public final String zzsw;
  public final long zzsx;
  public int zzsy;
  public int zzsz;

  public zzdk(String paramString)
    throws JSONException
  {
    JSONObject localJSONObject1 = new JSONObject(paramString);
    if (zzhx.zzA(2))
      zzhx.zzab("Mediation Response JSON: " + localJSONObject1.toString(2));
    JSONArray localJSONArray = localJSONObject1.getJSONArray("ad_networks");
    ArrayList localArrayList = new ArrayList(localJSONArray.length());
    int i = -1;
    for (int j = 0; j < localJSONArray.length(); j++)
    {
      zzdj localzzdj = new zzdj(localJSONArray.getJSONObject(j));
      localArrayList.add(localzzdj);
      if ((i < 0) && (zza(localzzdj)))
        i = j;
    }
    this.zzsy = i;
    this.zzsz = localJSONArray.length();
    this.zzsr = Collections.unmodifiableList(localArrayList);
    this.zzsw = localJSONObject1.getString("qdata");
    JSONObject localJSONObject2 = localJSONObject1.optJSONObject("settings");
    if (localJSONObject2 != null)
    {
      this.zzss = localJSONObject2.optLong("ad_network_timeout_millis", -1L);
      this.zzst = zzab.zzaV().zza(localJSONObject2, "click_urls");
      this.zzsu = zzab.zzaV().zza(localJSONObject2, "imp_urls");
      this.zzsv = zzab.zzaV().zza(localJSONObject2, "nofill_urls");
      long l1 = localJSONObject2.optLong("refresh", -1L);
      if (l1 > 0L);
      for (long l2 = l1 * 1000L; ; l2 = -1L)
      {
        this.zzsx = l2;
        return;
      }
    }
    this.zzss = -1L;
    this.zzst = null;
    this.zzsu = null;
    this.zzsv = null;
    this.zzsx = -1L;
  }

  private boolean zza(zzdj paramzzdj)
  {
    Iterator localIterator = paramzzdj.zzsm.iterator();
    while (localIterator.hasNext())
      if (((String)localIterator.next()).equals("com.google.ads.mediation.admob.AdMobAdapter"))
        return true;
    return false;
  }
}