package co.getair.meerkat.utilities;

import com.android.volley.AuthFailureError;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.toolbox.JsonObjectRequest;
import com.google.common.collect.Maps;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

public class ApiAuthorizedRequest extends JsonObjectRequest
{
  public ApiAuthorizedRequest(int paramInt, String paramString, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramInt, paramString, paramListener, paramErrorListener);
  }

  public ApiAuthorizedRequest(int paramInt, String paramString1, String paramString2, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramInt, paramString1, paramString2, paramListener, paramErrorListener);
  }

  public ApiAuthorizedRequest(int paramInt, String paramString, JSONObject paramJSONObject, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramInt, paramString, paramJSONObject, paramListener, paramErrorListener);
  }

  public ApiAuthorizedRequest(String paramString, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramString, paramListener, paramErrorListener);
  }

  public ApiAuthorizedRequest(String paramString, JSONObject paramJSONObject, Response.Listener<JSONObject> paramListener, Response.ErrorListener paramErrorListener)
  {
    super(paramString, paramJSONObject, paramListener, paramErrorListener);
  }

  public Map<String, String> getHeaders()
    throws AuthFailureError
  {
    HashMap localHashMap = Maps.newHashMap(super.getHeaders());
    localHashMap.put("Authorization", "97699257d0dd880683e5f3ddfe543e36d2b9da6001ada81ea89860c5a8a5c12e");
    return localHashMap;
  }
}