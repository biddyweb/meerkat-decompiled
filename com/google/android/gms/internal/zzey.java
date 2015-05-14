package com.google.android.gms.internal;

import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import org.json.JSONObject;

@zzgi
public class zzey extends Handler
{
  private final zzex zzuM;

  public zzey(Context paramContext)
  {
    this(new zzez(paramContext));
  }

  public zzey(zzex paramzzex)
  {
    this.zzuM = paramzzex;
  }

  private void zzb(JSONObject paramJSONObject)
  {
    try
    {
      this.zzuM.zza(paramJSONObject.getString("request_id"), paramJSONObject.getString("base_url"), paramJSONObject.getString("html"));
      return;
    }
    catch (Exception localException)
    {
    }
  }

  public void handleMessage(Message paramMessage)
  {
    try
    {
      Bundle localBundle = paramMessage.getData();
      if (localBundle == null)
        return;
      JSONObject localJSONObject = new JSONObject(localBundle.getString("data"));
      if ("fetch_html".equals(localJSONObject.getString("message_name")))
      {
        zzb(localJSONObject);
        return;
      }
    }
    catch (Exception localException)
    {
    }
  }
}