package com.twitter.cobalt.metrics;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import java.util.Collection;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;

public class MetricsManager
  implements MetricListener, MetricsReporter
{
  private static MetricsManager sInstance;
  private final Context mContext;
  private boolean mDisabled = false;
  private final Comparator<ManagedMetric> mMetricComparator = new Comparator()
  {
    public int compare(ManagedMetric paramAnonymousManagedMetric1, ManagedMetric paramAnonymousManagedMetric2)
    {
      if (paramAnonymousManagedMetric1.mCreationTime < paramAnonymousManagedMetric2.mCreationTime)
        return -1;
      return 1;
    }
  };
  private final ConcurrentHashMap<String, ManagedMetric> mMetrics = new ConcurrentHashMap();
  private final SharedPreferences mMetricsPreferences;
  private final HashSet<MetricsReporter> mMetricsReporters = new HashSet();
  private boolean mPersistenceEnabled = true;

  MetricsManager(Context paramContext)
  {
    this.mContext = paramContext;
    this.mMetricsPreferences = paramContext.getSharedPreferences("metrics", 0);
  }

  public static MetricsManager getInstance()
  {
    try
    {
      if (sInstance == null)
        throw new IllegalStateException("Metrics manager must be initialized first");
    }
    finally
    {
    }
    MetricsManager localMetricsManager = sInstance;
    return localMetricsManager;
  }

  public static void initialize(Context paramContext)
  {
    try
    {
      if (sInstance == null)
        sInstance = new MetricsManager(paramContext.getApplicationContext());
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public static void reset()
  {
    try
    {
      sInstance = null;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void addReporter(MetricsReporter paramMetricsReporter)
  {
    this.mMetricsReporters.add(paramMetricsReporter);
  }

  public void available(ManagedMetric paramManagedMetric)
  {
    report(paramManagedMetric);
  }

  public void clear()
  {
    this.mMetrics.clear();
  }

  @TargetApi(9)
  void clearPersistedMetrics()
  {
    SharedPreferences.Editor localEditor = this.mMetricsPreferences.edit();
    localEditor.clear();
    if (Build.VERSION.SDK_INT >= 9)
    {
      localEditor.apply();
      return;
    }
    localEditor.commit();
  }

  public void disableAllMetrics(boolean paramBoolean)
  {
    try
    {
      this.mDisabled = paramBoolean;
      if (paramBoolean)
      {
        clear();
        clearPersistedMetrics();
      }
      return;
    }
    finally
    {
    }
  }

  @TargetApi(9)
  public void discard(ManagedMetric paramManagedMetric)
  {
    this.mMetrics.remove(paramManagedMetric.mId);
    SharedPreferences.Editor localEditor;
    if (paramManagedMetric.mIsPersisted)
    {
      localEditor = this.mMetricsPreferences.edit();
      paramManagedMetric.removePersistentMetric(localEditor);
      if (Build.VERSION.SDK_INT >= 9)
        localEditor.apply();
    }
    else
    {
      return;
    }
    localEditor.commit();
  }

  public void enablePersistence(boolean paramBoolean)
  {
    this.mPersistenceEnabled = paramBoolean;
    if (paramBoolean)
      persistAll();
  }

  public void flushMetrics()
  {
    Iterator localIterator = sortMetrics().iterator();
    while (localIterator.hasNext())
    {
      ManagedMetric localManagedMetric = (ManagedMetric)localIterator.next();
      if (localManagedMetric.mIsReady)
        report(localManagedMetric);
    }
  }

  public Context getContext()
  {
    return this.mContext;
  }

  public ManagedMetric getMetric(String paramString)
  {
    return (ManagedMetric)this.mMetrics.get(paramString);
  }

  @TargetApi(9)
  public void persist(ManagedMetric paramManagedMetric)
  {
    SharedPreferences.Editor localEditor;
    if ((paramManagedMetric.mIsPersisted) && (this.mPersistenceEnabled) && (!this.mDisabled))
    {
      localEditor = this.mMetricsPreferences.edit();
      paramManagedMetric.addPersistentMetric(localEditor);
      if (Build.VERSION.SDK_INT >= 9)
        localEditor.apply();
    }
    else
    {
      return;
    }
    localEditor.commit();
  }

  public void persistAll()
  {
    if ((!this.mPersistenceEnabled) || (this.mDisabled));
    while (true)
    {
      return;
      Iterator localIterator = this.mMetrics.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        ManagedMetric localManagedMetric = (ManagedMetric)this.mMetrics.get(str);
        if (localManagedMetric.mIsPersisted)
          persist(localManagedMetric);
      }
    }
  }

  public void report(Metric paramMetric)
  {
    if (this.mDisabled);
    do
    {
      return;
      Iterator localIterator = this.mMetricsReporters.iterator();
      while (localIterator.hasNext())
        ((MetricsReporter)localIterator.next()).report(paramMetric);
    }
    while (!(paramMetric instanceof ManagedMetric));
    ((ManagedMetric)paramMetric).reset();
  }

  public void resetMetrics()
  {
    Iterator localIterator = sortMetrics().iterator();
    while (localIterator.hasNext())
      ((ManagedMetric)localIterator.next()).reset();
  }

  public SharedPreferences restore()
  {
    return this.mMetricsPreferences;
  }

  Collection<ManagedMetric> sortMetrics()
  {
    TreeSet localTreeSet = new TreeSet(this.mMetricComparator);
    Iterator localIterator = this.mMetrics.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      ManagedMetric localManagedMetric = (ManagedMetric)this.mMetrics.get(str);
      if ((localManagedMetric != null) && (localManagedMetric.mIsReady))
        localTreeSet.add(localManagedMetric);
    }
    return localTreeSet;
  }

  public ManagedMetric trackMetric(ManagedMetric paramManagedMetric)
  {
    if (this.mDisabled);
    ManagedMetric localManagedMetric;
    do
    {
      return paramManagedMetric;
      localManagedMetric = (ManagedMetric)this.mMetrics.putIfAbsent(paramManagedMetric.mId, paramManagedMetric);
    }
    while (localManagedMetric == null);
    return localManagedMetric;
  }
}