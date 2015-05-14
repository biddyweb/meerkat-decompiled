package co.getair.meerkat.proxies;

import android.content.Context;
import co.getair.meerkat.ApiProxy;
import co.getair.meerkat.dtos.ActivationCodeParams;
import co.getair.meerkat.dtos.Session;
import co.getair.meerkat.facades.BaseFacade;
import co.getair.meerkat.utilities.ApiAuthorizedRequest;
import co.getair.meerkat.utilities.NetworkQueue;
import com.android.volley.NetworkResponse;
import com.android.volley.Response.ErrorListener;
import com.android.volley.Response.Listener;
import com.android.volley.VolleyError;
import com.google.gson.Gson;
import java.util.HashMap;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class PhoneVerificationProxy extends Proxy
{
  private Context context;
  private HashMap<String, String> followupActions;

  public PhoneVerificationProxy(String paramString, Context paramContext)
  {
    super(paramString);
    this.context = paramContext;
  }

  public void verifyActivationCode(ActivationCodeParams paramActivationCodeParams)
  {
    String str = ApiProxy.getInstance(((BaseFacade)getFacade()).getOwnerActivity()).getUrlForFollowupActionKey("editProfile");
    Session localSession = Session.loadSession(((BaseFacade)getFacade()).getOwnerActivity());
    HashMap localHashMap1 = new HashMap();
    localHashMap1.put("phoneNumber", paramActivationCodeParams.getPhoneNumber());
    localHashMap1.put("confirmationCode", paramActivationCodeParams.getActivationCode());
    HashMap localHashMap2 = new HashMap();
    localHashMap2.put("auth", localSession.getAuthToken());
    localHashMap2.put("phoneNumberDetails", localHashMap1);
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str, new Gson().toJson(localHashMap2), new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        PhoneVerificationProxy.this.sendNotification("eventSendActivationCodeAccepted", null, null);
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        PhoneVerificationProxy.this.sendNotification("eventSendActivationCodeFail", paramAnonymousVolleyError, null);
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }

  public void verifyPhoneNumber(final String paramString)
  {
    String str = ApiProxy.getInstance(((BaseFacade)getFacade()).getOwnerActivity()).getUrlForFollowupActionKey("editProfile");
    Session localSession = Session.loadSession(((BaseFacade)getFacade()).getOwnerActivity());
    HashMap localHashMap1 = new HashMap();
    localHashMap1.put("phoneNumber", paramString);
    HashMap localHashMap2 = new HashMap();
    localHashMap2.put("auth", localSession.getAuthToken());
    localHashMap2.put("phoneNumberDetails", localHashMap1);
    ApiAuthorizedRequest localApiAuthorizedRequest = new ApiAuthorizedRequest(2, str, new Gson().toJson(localHashMap2), new Response.Listener()
    {
      public void onResponse(JSONObject paramAnonymousJSONObject)
      {
        try
        {
          PhoneVerificationProxy.this.sendNotification("eventPhoneNumberSentForVerification", paramString, null);
          return;
        }
        catch (Exception localException)
        {
          PhoneVerificationProxy.this.sendNotification("eventSendPhoneNumberForVerificationFailed", localException, null);
        }
      }
    }
    , new Response.ErrorListener()
    {
      public void onErrorResponse(VolleyError paramAnonymousVolleyError)
      {
        if (paramAnonymousVolleyError.networkResponse.statusCode == 450)
        {
          PhoneVerificationProxy.this.sendNotification("eventPhoneNumberSentForVerification", paramString, null);
          return;
        }
        PhoneVerificationProxy.this.sendNotification("eventSendPhoneNumberForVerificationFailed", paramAnonymousVolleyError, null);
      }
    });
    NetworkQueue.getInstance(this.context).addToRequestQueue(localApiAuthorizedRequest);
  }
}