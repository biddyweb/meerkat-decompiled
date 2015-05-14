package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.MLog;
import co.getair.meerkat.utilities.NetworkQueue;
import co.getair.meerkat.utilities.RunnableWithResultObject;
import com.android.volley.NetworkResponse;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.facade.Facade;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class SearchProxy extends Proxy
{
  private final String LOG_TAG = "SearchProxy";
  private final String SEARCH_URL_KEY = "search";
  private Context context;

  public SearchProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }

  public void searchForUser(String paramString, final RunnableWithResultObject paramRunnableWithResultObject)
  {
    String str = ApiProxy.getInstance(this.context.getApplicationContext()).getUrlForFollowupActionKey("search");
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("username", paramString);
      ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str, localJSONObject, new Response.Listener()
      {
        public void onResponse(JSONObject paramAnonymousJSONObject)
        {
          try
          {
            MLog.i("SearchProxy", paramAnonymousJSONObject.toString());
            JSONArray localJSONArray = paramAnonymousJSONObject.getJSONArray("result");
            Type localType = new TypeToken()
            {
            }
            .getType();
            ArrayList localArrayList = (ArrayList)new Gson().fromJson(localJSONArray.toString(), localType);
            paramRunnableWithResultObject.resultObject = localArrayList;
            new Thread(paramRunnableWithResultObject).start();
            return;
          }
          catch (JSONException localJSONException)
          {
            MLog.e("SearchProxy", localJSONException.toString());
          }
        }
      }
      , new Response.ErrorListener()
      {
        public void onErrorResponse(VolleyError paramAnonymousVolleyError)
        {
          if (paramAnonymousVolleyError.networkResponse.statusCode == 412)
          {
            SearchProxy.this.getFacade().sendNotification("eventUserNotFound", null, null);
            return;
          }
          MLog.e("SearchProxy", paramAnonymousVolleyError.toString());
        }
      });
      NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        localJSONException.printStackTrace();
    }
  }
}