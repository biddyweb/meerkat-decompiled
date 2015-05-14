package co.getair.meerkat.dtos;

import org.json.JSONObject;

public class MixpanelEventParams
{
  private String eventName;
  private JSONObject eventProperties;

  public MixpanelEventParams(String paramString, JSONObject paramJSONObject)
  {
    this.eventName = paramString;
    this.eventProperties = paramJSONObject;
  }

  public String getEventName()
  {
    return this.eventName;
  }

  public JSONObject getEventProperties()
  {
    return this.eventProperties;
  }
}