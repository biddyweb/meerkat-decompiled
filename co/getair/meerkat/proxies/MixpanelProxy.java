package co.getair.meerkat.proxies;

import co.getair.meerkat.MeerkatApplication;
import com.mixpanel.android.mpmetrics.MixpanelAPI;
import com.mixpanel.android.mpmetrics.MixpanelAPI.People;
import org.json.JSONObject;
import org.puremvc.java.multicore.patterns.proxy.Proxy;

public class MixpanelProxy extends Proxy
{
  private MeerkatApplication meerkatApplication;

  public MixpanelProxy(String paramString, MeerkatApplication paramMeerkatApplication)
  {
    super(paramString, paramMeerkatApplication);
    this.meerkatApplication = paramMeerkatApplication;
  }

  public void decrementPeopleProperty(String paramString)
  {
    this.meerkatApplication.getMixpanelAPI().getPeople().increment(paramString, -1.0D);
  }

  public void identify(String paramString)
  {
    this.meerkatApplication.getMixpanelAPI().identify(paramString);
    this.meerkatApplication.getMixpanelAPI().getPeople().identify(paramString);
  }

  public void incrementPeopleProperty(String paramString)
  {
    this.meerkatApplication.getMixpanelAPI().getPeople().increment(paramString, 1.0D);
  }

  public void setPeopleProperties(JSONObject paramJSONObject)
  {
    this.meerkatApplication.getMixpanelAPI().getPeople().set(paramJSONObject);
  }

  public void setSuperProperties(JSONObject paramJSONObject)
  {
    this.meerkatApplication.getMixpanelAPI().registerSuperProperties(paramJSONObject);
  }

  public void timeEvent(String paramString)
  {
    this.meerkatApplication.getMixpanelAPI().timeEvent(paramString);
  }

  public void trackEvent(String paramString, JSONObject paramJSONObject)
  {
    this.meerkatApplication.getMixpanelAPI().track(paramString, paramJSONObject);
  }
}