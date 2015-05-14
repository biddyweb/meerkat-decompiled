package com.mixpanel.android.mpmetrics;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class InstallReferrerReceiver extends BroadcastReceiver
{
  private static final String LOGTAG = "Mixpanel.InstallReferrerReceiver";
  private final Pattern UTM_CAMPAIGN_PATTERN = Pattern.compile("(^|&)utm_campaign=([^&#=]*)([#&]|$)");
  private final Pattern UTM_CONTENT_PATTERN = Pattern.compile("(^|&)utm_content=([^&#=]*)([#&]|$)");
  private final Pattern UTM_MEDIUM_PATTERN = Pattern.compile("(^|&)utm_medium=([^&#=]*)([#&]|$)");
  private final Pattern UTM_SOURCE_PATTERN = Pattern.compile("(^|&)utm_source=([^&#=]*)([#&]|$)");
  private final Pattern UTM_TERM_PATTERN = Pattern.compile("(^|&)utm_term=([^&#=]*)([#&]|$)");

  private String find(Matcher paramMatcher)
  {
    if (paramMatcher.find())
    {
      String str1 = paramMatcher.group(2);
      if (str1 != null)
        try
        {
          String str2 = URLDecoder.decode(str1, "UTF-8");
          return str2;
        }
        catch (UnsupportedEncodingException localUnsupportedEncodingException)
        {
          Log.e("Mixpanel.InstallReferrerReceiver", "Could not decode a parameter into UTF-8");
        }
    }
    return null;
  }

  public void onReceive(Context paramContext, Intent paramIntent)
  {
    Bundle localBundle = paramIntent.getExtras();
    if (localBundle == null);
    String str1;
    do
    {
      return;
      str1 = localBundle.getString("referrer");
    }
    while (str1 == null);
    HashMap localHashMap = new HashMap();
    localHashMap.put("referrer", str1);
    String str2 = find(this.UTM_SOURCE_PATTERN.matcher(str1));
    if (str2 != null)
      localHashMap.put("utm_source", str2);
    String str3 = find(this.UTM_MEDIUM_PATTERN.matcher(str1));
    if (str3 != null)
      localHashMap.put("utm_medium", str3);
    String str4 = find(this.UTM_CAMPAIGN_PATTERN.matcher(str1));
    if (str4 != null)
      localHashMap.put("utm_campaign", str4);
    String str5 = find(this.UTM_CONTENT_PATTERN.matcher(str1));
    if (str5 != null)
      localHashMap.put("utm_content", str5);
    String str6 = find(this.UTM_TERM_PATTERN.matcher(str1));
    if (str6 != null)
      localHashMap.put("utm_term", str6);
    PersistentIdentity.writeReferrerPrefs(paramContext, "com.mixpanel.android.mpmetrics.ReferralInfo", localHashMap);
  }
}