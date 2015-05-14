package com.mixpanel.android.viewcrawler;

import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.mixpanel.android.mpmetrics.MixpanelAPI;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;

class DynamicEventTracker
  implements ViewVisitor.OnEventListener
{
  private static final int DEBOUNCE_TIME_MILLIS = 1000;
  private static String LOGTAG = "MixpanelAPI.DynamicEventTracker";
  private static final int MAX_PROPERTY_LENGTH = 128;
  private final Map<Signature, UnsentEvent> mDebouncedEvents;
  private final Handler mHandler;
  private final MixpanelAPI mMixpanel;
  private final Runnable mTask;

  public DynamicEventTracker(MixpanelAPI paramMixpanelAPI, Handler paramHandler)
  {
    this.mMixpanel = paramMixpanelAPI;
    this.mDebouncedEvents = new HashMap();
    this.mTask = new SendDebouncedTask(null);
    this.mHandler = paramHandler;
  }

  private static String textPropertyFromView(View paramView)
  {
    String str1;
    if ((paramView instanceof TextView))
    {
      CharSequence localCharSequence = ((TextView)paramView).getText();
      str1 = null;
      if (localCharSequence != null)
        str1 = localCharSequence.toString();
    }
    StringBuilder localStringBuilder;
    int j;
    do
    {
      boolean bool;
      do
      {
        return str1;
        bool = paramView instanceof ViewGroup;
        str1 = null;
      }
      while (!bool);
      localStringBuilder = new StringBuilder();
      ViewGroup localViewGroup = (ViewGroup)paramView;
      int i = localViewGroup.getChildCount();
      j = 0;
      for (int k = 0; (k < i) && (localStringBuilder.length() < 128); k++)
      {
        String str2 = textPropertyFromView(localViewGroup.getChildAt(k));
        if ((str2 != null) && (str2.length() > 0))
        {
          if (j != 0)
            localStringBuilder.append(", ");
          localStringBuilder.append(str2);
          j = 1;
        }
      }
      if (localStringBuilder.length() > 128)
        return localStringBuilder.substring(0, 128);
      str1 = null;
    }
    while (j == 0);
    return localStringBuilder.toString();
  }

  public void OnEvent(View paramView, String paramString, boolean paramBoolean)
  {
    long l = System.currentTimeMillis();
    JSONObject localJSONObject = new JSONObject();
    try
    {
      localJSONObject.put("$text", textPropertyFromView(paramView));
      localJSONObject.put("$from_binding", true);
      localJSONObject.put("time", l / 1000L);
      if (paramBoolean)
      {
        localSignature = new Signature(paramView, paramString);
        localUnsentEvent = new UnsentEvent(paramString, localJSONObject, l);
      }
    }
    catch (JSONException localJSONException)
    {
      synchronized (this.mDebouncedEvents)
      {
        Signature localSignature;
        UnsentEvent localUnsentEvent;
        boolean bool = this.mDebouncedEvents.isEmpty();
        this.mDebouncedEvents.put(localSignature, localUnsentEvent);
        if (bool)
          this.mHandler.postDelayed(this.mTask, 1000L);
        return;
        localJSONException = localJSONException;
        Log.e(LOGTAG, "Can't format properties from view due to JSON issue", localJSONException);
      }
    }
    this.mMixpanel.track(paramString, localJSONObject);
  }

  private final class SendDebouncedTask
    implements Runnable
  {
    private SendDebouncedTask()
    {
    }

    public void run()
    {
      long l = System.currentTimeMillis();
      synchronized (DynamicEventTracker.this.mDebouncedEvents)
      {
        Iterator localIterator = DynamicEventTracker.this.mDebouncedEvents.entrySet().iterator();
        while (localIterator.hasNext())
        {
          DynamicEventTracker.UnsentEvent localUnsentEvent = (DynamicEventTracker.UnsentEvent)((Map.Entry)localIterator.next()).getValue();
          if (l - localUnsentEvent.timeSentMillis > 1000L)
          {
            DynamicEventTracker.this.mMixpanel.track(localUnsentEvent.eventName, localUnsentEvent.properties);
            localIterator.remove();
          }
        }
      }
      if (!DynamicEventTracker.this.mDebouncedEvents.isEmpty())
        DynamicEventTracker.this.mHandler.postDelayed(this, 500L);
    }
  }

  private static class Signature
  {
    private final int mHashCode;

    public Signature(View paramView, String paramString)
    {
      this.mHashCode = (paramView.hashCode() ^ paramString.hashCode());
    }

    public boolean equals(Object paramObject)
    {
      boolean bool1 = paramObject instanceof Signature;
      boolean bool2 = false;
      if (bool1)
      {
        int i = this.mHashCode;
        int j = paramObject.hashCode();
        bool2 = false;
        if (i == j)
          bool2 = true;
      }
      return bool2;
    }

    public int hashCode()
    {
      return this.mHashCode;
    }
  }

  private static class UnsentEvent
  {
    public final String eventName;
    public final JSONObject properties;
    public final long timeSentMillis;

    public UnsentEvent(String paramString, JSONObject paramJSONObject, long paramLong)
    {
      this.eventName = paramString;
      this.properties = paramJSONObject;
      this.timeSentMillis = paramLong;
    }
  }
}