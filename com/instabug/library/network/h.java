package com.instabug.library.network;

import org.json.JSONObject;

public abstract class h
{
  private JSONObject a;

  public final h a(String paramString1, String paramString2)
  {
    if (this.a == null)
      this.a = new JSONObject();
    this.a.put(paramString1, paramString2);
    return this;
  }

  public abstract String a();

  public final String a(int paramInt)
  {
    return "https://api.instabug.com/api/android/v1/" + a();
  }

  public final void a(JSONObject paramJSONObject)
  {
    this.a = paramJSONObject;
  }

  public final JSONObject b()
  {
    return this.a;
  }
}