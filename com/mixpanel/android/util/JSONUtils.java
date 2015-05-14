package com.mixpanel.android.util;

import org.json.JSONException;
import org.json.JSONObject;

public class JSONUtils
{
  public static String optionalStringKey(JSONObject paramJSONObject, String paramString)
    throws JSONException
  {
    if ((paramJSONObject.has(paramString)) && (!paramJSONObject.isNull(paramString)))
      return paramJSONObject.getString(paramString);
    return null;
  }
}