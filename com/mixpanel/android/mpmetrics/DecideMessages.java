package com.mixpanel.android.mpmetrics;

import android.util.Log;
import com.mixpanel.android.viewcrawler.UpdatesFromMixpanel;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.json.JSONArray;

class DecideMessages
{
  private static final String LOGTAG = "MixpanelAPI.DecideUpdates";
  private String mDistinctId;
  private final OnNewResultsListener mListener;
  private final Set<Integer> mNotificationIds;
  private final Set<Integer> mSurveyIds;
  private final String mToken;
  private final List<InAppNotification> mUnseenNotifications;
  private final List<Survey> mUnseenSurveys;
  private final UpdatesFromMixpanel mUpdatesFromMixpanel;

  public DecideMessages(String paramString, OnNewResultsListener paramOnNewResultsListener, UpdatesFromMixpanel paramUpdatesFromMixpanel)
  {
    this.mToken = paramString;
    this.mListener = paramOnNewResultsListener;
    this.mUpdatesFromMixpanel = paramUpdatesFromMixpanel;
    this.mDistinctId = null;
    this.mUnseenSurveys = new LinkedList();
    this.mUnseenNotifications = new LinkedList();
    this.mSurveyIds = new HashSet();
    this.mNotificationIds = new HashSet();
  }

  public String getDistinctId()
  {
    try
    {
      String str = this.mDistinctId;
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public InAppNotification getNotification(int paramInt, boolean paramBoolean)
  {
    int i = 0;
    try
    {
      while (true)
      {
        int j = this.mUnseenNotifications.size();
        InAppNotification localInAppNotification = null;
        if (i < j)
        {
          if (((InAppNotification)this.mUnseenNotifications.get(i)).getId() != paramInt)
            break label79;
          localInAppNotification = (InAppNotification)this.mUnseenNotifications.get(i);
          if (!paramBoolean)
            this.mUnseenNotifications.remove(i);
        }
        return localInAppNotification;
        label79: i++;
      }
    }
    finally
    {
    }
  }

  public InAppNotification getNotification(boolean paramBoolean)
  {
    while (true)
    {
      InAppNotification localInAppNotification;
      try
      {
        if (this.mUnseenNotifications.isEmpty())
        {
          if (MPConfig.DEBUG)
            Log.v("MixpanelAPI.DecideUpdates", "No unseen notifications exist, none will be returned.");
          localInAppNotification = null;
          return localInAppNotification;
        }
        localInAppNotification = (InAppNotification)this.mUnseenNotifications.remove(0);
        if (paramBoolean)
        {
          this.mUnseenNotifications.add(this.mUnseenNotifications.size(), localInAppNotification);
          continue;
        }
      }
      finally
      {
      }
      if (MPConfig.DEBUG)
        Log.v("MixpanelAPI.DecideUpdates", "Recording notification " + localInAppNotification + " as seen.");
    }
  }

  public Survey getSurvey(int paramInt, boolean paramBoolean)
  {
    int i = 0;
    try
    {
      while (true)
      {
        int j = this.mUnseenSurveys.size();
        Survey localSurvey = null;
        if (i < j)
        {
          if (((Survey)this.mUnseenSurveys.get(i)).getId() != paramInt)
            break label79;
          localSurvey = (Survey)this.mUnseenSurveys.get(i);
          if (!paramBoolean)
            this.mUnseenSurveys.remove(i);
        }
        return localSurvey;
        label79: i++;
      }
    }
    finally
    {
    }
  }

  public Survey getSurvey(boolean paramBoolean)
  {
    try
    {
      boolean bool = this.mUnseenSurveys.isEmpty();
      Survey localSurvey;
      if (bool)
        localSurvey = null;
      while (true)
      {
        return localSurvey;
        localSurvey = (Survey)this.mUnseenSurveys.remove(0);
        if (paramBoolean)
          this.mUnseenSurveys.add(this.mUnseenSurveys.size(), localSurvey);
      }
    }
    finally
    {
    }
  }

  public String getToken()
  {
    return this.mToken;
  }

  public boolean hasUpdatesAvailable()
  {
    try
    {
      if (this.mUnseenNotifications.isEmpty())
      {
        boolean bool2 = this.mUnseenSurveys.isEmpty();
        if (bool2);
      }
      else
      {
        bool1 = true;
        return bool1;
      }
      boolean bool1 = false;
    }
    finally
    {
    }
  }

  public void reportResults(List<Survey> paramList, List<InAppNotification> paramList1, JSONArray paramJSONArray)
  {
    int i = 0;
    try
    {
      this.mUpdatesFromMixpanel.setEventBindings(paramJSONArray);
      Iterator localIterator1 = paramList.iterator();
      while (localIterator1.hasNext())
      {
        Survey localSurvey = (Survey)localIterator1.next();
        int k = localSurvey.getId();
        if (!this.mSurveyIds.contains(Integer.valueOf(k)))
        {
          this.mSurveyIds.add(Integer.valueOf(k));
          this.mUnseenSurveys.add(localSurvey);
          i = 1;
        }
      }
      Iterator localIterator2 = paramList1.iterator();
      while (localIterator2.hasNext())
      {
        InAppNotification localInAppNotification = (InAppNotification)localIterator2.next();
        int j = localInAppNotification.getId();
        if (!this.mNotificationIds.contains(Integer.valueOf(j)))
        {
          this.mNotificationIds.add(Integer.valueOf(j));
          this.mUnseenNotifications.add(localInAppNotification);
          i = 1;
        }
      }
      if (MPConfig.DEBUG)
        Log.v("MixpanelAPI.DecideUpdates", "New Decide content has become available. " + paramList.size() + " surveys and " + paramList1.size() + " notifications have been added.");
      if ((i != 0) && (hasUpdatesAvailable()) && (this.mListener != null))
        this.mListener.onNewResults();
      return;
    }
    finally
    {
    }
  }

  public void setDistinctId(String paramString)
  {
    try
    {
      this.mUnseenSurveys.clear();
      this.mUnseenNotifications.clear();
      this.mDistinctId = paramString;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static abstract interface OnNewResultsListener
  {
    public abstract void onNewResults();
  }
}