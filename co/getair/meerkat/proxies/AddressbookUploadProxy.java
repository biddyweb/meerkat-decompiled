package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.ApplicationPreferences;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.List;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class AddressbookUploadProxy extends Proxy
{
  private static final String NAME = "AddressbookUploadProxy";
  private final String UPLOAD_PHONE_NUMBERS_URL_KEY = "socialLinks";
  private Context context;

  public AddressbookUploadProxy(Context paramContext)
  {
    super("AddressbookUploadProxy");
    this.context = paramContext;
  }

  public static String getName()
  {
    return "AddressbookUploadProxy";
  }

  public void uploadAddressBook(List<String> paramList)
  {
    String str1 = ApiProxy.getInstance(((BaseFacade)getFacade()).getOwnerActivity()).getUrlForFollowupActionKey("socialLinks");
    HashMap localHashMap = new HashMap();
    localHashMap.put("linkTo", paramList);
    localHashMap.put("platform", "contacts");
    String str2 = new Gson().toJson(localHashMap);
    new ApplicationPreferences(this.context).saveShouldAskForAddressBook(false);
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(1, str1, str2, new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        AddressbookUploadProxy.this.sendNotification("eventDidCompleteStep");
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        AddressbookUploadProxy.this.sendNotification("eventDidCompleteStep");
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }
}