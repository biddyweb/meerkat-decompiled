package com.google.android.gms.internal;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzfj
{
  public String zzL(String paramString)
  {
    if (paramString == null)
      return null;
    try
    {
      String str = new JSONObject(paramString).getString("developerPayload");
      return str;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzac("Fail to parse purchase data");
    }
    return null;
  }

  public String zzM(String paramString)
  {
    if (paramString == null)
      return null;
    try
    {
      String str = new JSONObject(paramString).getString("purchaseToken");
      return str;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzac("Fail to parse purchase data");
    }
    return null;
  }

  public void zza(Context paramContext, boolean paramBoolean, zzfb paramzzfb)
  {
    Intent localIntent = new Intent();
    localIntent.setClassName(paramContext, "com.google.android.gms.ads.purchase.InAppPurchaseActivity");
    localIntent.putExtra("com.google.android.gms.ads.internal.purchase.useClientJar", paramBoolean);
    zzfb.zza(localIntent, paramzzfb);
    paramContext.startActivity(localIntent);
  }

  public int zzd(Intent paramIntent)
  {
    Object localObject = paramIntent.getExtras().get("RESPONSE_CODE");
    if (localObject == null)
    {
      zzhx.zzac("Intent with no response code, assuming OK (known issue)");
      return 0;
    }
    if ((localObject instanceof Integer))
      return ((Integer)localObject).intValue();
    if ((localObject instanceof Long))
      return (int)((Long)localObject).longValue();
    zzhx.zzac("Unexpected type for intent response code. " + localObject.getClass().getName());
    return 5;
  }

  public String zze(Intent paramIntent)
  {
    if (paramIntent == null)
      return null;
    return paramIntent.getStringExtra("INAPP_PURCHASE_DATA");
  }

  public int zzf(Bundle paramBundle)
  {
    Object localObject = paramBundle.get("RESPONSE_CODE");
    if (localObject == null)
    {
      zzhx.zzac("Bundle with null response code, assuming OK (known issue)");
      return 0;
    }
    if ((localObject instanceof Integer))
      return ((Integer)localObject).intValue();
    if ((localObject instanceof Long))
      return (int)((Long)localObject).longValue();
    zzhx.zzac("Unexpected type for intent response code. " + localObject.getClass().getName());
    return 5;
  }

  public String zzf(Intent paramIntent)
  {
    if (paramIntent == null)
      return null;
    return paramIntent.getStringExtra("INAPP_DATA_SIGNATURE");
  }
}