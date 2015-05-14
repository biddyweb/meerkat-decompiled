package com.mixpanel.android.viewcrawler;

import com.mixpanel.android.mpmetrics.Tweaks;
import org.json.JSONArray;

public abstract interface UpdatesFromMixpanel
{
  public abstract Tweaks getTweaks();

  public abstract void setEventBindings(JSONArray paramJSONArray);
}