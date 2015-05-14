package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public final class zzdj
{
  public final String zzsk;
  public final String zzsl;
  public final List<String> zzsm;
  public final String zzsn;
  public final String zzso;
  public final List<String> zzsp;
  public final String zzsq;

  public zzdj(JSONObject paramJSONObject)
    throws JSONException
  {
    this.zzsl = paramJSONObject.getString("id");
    JSONArray localJSONArray = paramJSONObject.getJSONArray("adapters");
    ArrayList localArrayList = new ArrayList(localJSONArray.length());
    for (int i = 0; i < localJSONArray.length(); i++)
      localArrayList.add(localJSONArray.getString(i));
    this.zzsm = Collections.unmodifiableList(localArrayList);
    this.zzsn = paramJSONObject.optString("allocation_id", null);
    this.zzsp = zzab.zzaV().zza(paramJSONObject, "imp_urls");
    JSONObject localJSONObject1 = paramJSONObject.optJSONObject("ad");
    String str1;
    JSONObject localJSONObject2;
    if (localJSONObject1 != null)
    {
      str1 = localJSONObject1.toString();
      this.zzsk = str1;
      localJSONObject2 = paramJSONObject.optJSONObject("data");
      if (localJSONObject2 == null)
        break label178;
    }
    label178: for (String str2 = localJSONObject2.toString(); ; str2 = null)
    {
      this.zzsq = str2;
      String str3 = null;
      if (localJSONObject2 != null)
        str3 = localJSONObject2.optString("class_name");
      this.zzso = str3;
      return;
      str1 = null;
      break;
    }
  }
}