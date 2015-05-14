package com.mixpanel.android.mpmetrics;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.SharedPreferences.OnSharedPreferenceChangeListener;
import android.os.Build.VERSION;
import android.util.Log;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@SuppressLint({"CommitPrefEdits"})
class PersistentIdentity
{
  private static final String LOGTAG = "MixpanelAPI.PersistentIdentity";
  private static boolean sReferrerPrefsDirty = true;
  private static final Object sReferrerPrefsLock = new Object();
  private String mEventsDistinctId;
  private boolean mIdentitiesLoaded;
  private final Future<SharedPreferences> mLoadReferrerPreferences;
  private final Future<SharedPreferences> mLoadStoredPreferences;
  private String mPeopleDistinctId;
  private final SharedPreferences.OnSharedPreferenceChangeListener mReferrerChangeListener;
  private Map<String, String> mReferrerPropertiesCache;
  private JSONObject mSuperPropertiesCache;
  private JSONArray mWaitingPeopleRecords;

  public PersistentIdentity(Future<SharedPreferences> paramFuture1, Future<SharedPreferences> paramFuture2)
  {
    this.mLoadReferrerPreferences = paramFuture1;
    this.mLoadStoredPreferences = paramFuture2;
    this.mSuperPropertiesCache = null;
    this.mReferrerPropertiesCache = null;
    this.mIdentitiesLoaded = false;
    this.mReferrerChangeListener = new SharedPreferences.OnSharedPreferenceChangeListener()
    {
      public void onSharedPreferenceChanged(SharedPreferences paramAnonymousSharedPreferences, String paramAnonymousString)
      {
        synchronized (PersistentIdentity.sReferrerPrefsLock)
        {
          PersistentIdentity.this.readReferrerProperties();
          PersistentIdentity.access$202(false);
          return;
        }
      }
    };
  }

  private void readIdentities()
  {
    String str;
    try
    {
      localSharedPreferences = (SharedPreferences)this.mLoadStoredPreferences.get();
      if (localSharedPreferences == null)
        return;
    }
    catch (ExecutionException localExecutionException)
    {
      while (true)
      {
        Log.e("MixpanelAPI.PersistentIdentity", "Cannot read distinct ids from sharedPreferences.", localExecutionException.getCause());
        localSharedPreferences = null;
      }
    }
    catch (InterruptedException localInterruptedException)
    {
      SharedPreferences localSharedPreferences;
      while (true)
      {
        Log.e("MixpanelAPI.PersistentIdentity", "Cannot read distinct ids from sharedPreferences.", localInterruptedException);
        localSharedPreferences = null;
      }
      this.mEventsDistinctId = localSharedPreferences.getString("events_distinct_id", null);
      this.mPeopleDistinctId = localSharedPreferences.getString("people_distinct_id", null);
      this.mWaitingPeopleRecords = null;
      str = localSharedPreferences.getString("waiting_array", null);
      if (str == null);
    }
    try
    {
      this.mWaitingPeopleRecords = new JSONArray(str);
      if (this.mEventsDistinctId == null)
      {
        this.mEventsDistinctId = UUID.randomUUID().toString();
        writeIdentities();
      }
      this.mIdentitiesLoaded = true;
      return;
    }
    catch (JSONException localJSONException)
    {
      while (true)
        Log.e("MixpanelAPI.PersistentIdentity", "Could not interpret waiting people JSON record " + str);
    }
  }

  private void readReferrerProperties()
  {
    this.mReferrerPropertiesCache = new HashMap();
    try
    {
      SharedPreferences localSharedPreferences = (SharedPreferences)this.mLoadReferrerPreferences.get();
      localSharedPreferences.unregisterOnSharedPreferenceChangeListener(this.mReferrerChangeListener);
      localSharedPreferences.registerOnSharedPreferenceChangeListener(this.mReferrerChangeListener);
      Iterator localIterator = localSharedPreferences.getAll().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        String str = (String)localEntry.getKey();
        Object localObject = localEntry.getValue();
        this.mReferrerPropertiesCache.put(str, localObject.toString());
      }
    }
    catch (ExecutionException localExecutionException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot load referrer properties from shared preferences.", localExecutionException.getCause());
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot load referrer properties from shared preferences.", localInterruptedException);
    }
  }

  private void readSuperProperties()
  {
    try
    {
      String str = ((SharedPreferences)this.mLoadStoredPreferences.get()).getString("super_properties", "{}");
      if (MPConfig.DEBUG)
        Log.v("MixpanelAPI.PersistentIdentity", "Loading Super Properties " + str);
      this.mSuperPropertiesCache = new JSONObject(str);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot load superProperties from SharedPreferences.", localExecutionException.getCause());
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot load superProperties from SharedPreferences.", localInterruptedException);
      return;
    }
    catch (JSONException localJSONException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot parse stored superProperties");
      storeSuperProperties();
      return;
    }
    finally
    {
      if (this.mSuperPropertiesCache == null)
        this.mSuperPropertiesCache = new JSONObject();
    }
  }

  private void storeSuperProperties()
  {
    if (this.mSuperPropertiesCache == null)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "storeSuperProperties should not be called with uninitialized superPropertiesCache.");
      return;
    }
    String str = this.mSuperPropertiesCache.toString();
    if (MPConfig.DEBUG)
      Log.v("MixpanelAPI.PersistentIdentity", "Storing Super Properties " + str);
    try
    {
      SharedPreferences.Editor localEditor = ((SharedPreferences)this.mLoadStoredPreferences.get()).edit();
      localEditor.putString("super_properties", str);
      writeEdits(localEditor);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot store superProperties in shared preferences.", localExecutionException.getCause());
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Cannot store superProperties in shared preferences.", localInterruptedException);
    }
  }

  // ERROR //
  public static JSONArray waitingPeopleRecordsForSending(SharedPreferences paramSharedPreferences)
  {
    // Byte code:
    //   0: aload_0
    //   1: ldc 102
    //   3: aconst_null
    //   4: invokeinterface 98 3 0
    //   9: astore_1
    //   10: aload_0
    //   11: ldc 108
    //   13: aconst_null
    //   14: invokeinterface 98 3 0
    //   19: astore_2
    //   20: aconst_null
    //   21: astore_3
    //   22: aload_2
    //   23: ifnull +123 -> 146
    //   26: aconst_null
    //   27: astore_3
    //   28: aload_1
    //   29: ifnull +117 -> 146
    //   32: new 110\011org/json/JSONArray
    //   35: dup
    //   36: aload_2
    //   37: invokespecial 113\011org/json/JSONArray:<init>\011(Ljava/lang/String;)V
    //   40: astore 4
    //   42: new 110\011org/json/JSONArray
    //   45: dup
    //   46: invokespecial 241\011org/json/JSONArray:<init>\011()V
    //   49: astore_3
    //   50: iconst_0
    //   51: istore 5
    //   53: iload 5
    //   55: aload 4
    //   57: invokevirtual 245\011org/json/JSONArray:length\011()I
    //   60: if_icmpge +63 -> 123
    //   63: aload 4
    //   65: iload 5
    //   67: invokevirtual 249\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
    //   70: astore 10
    //   72: aload 10
    //   74: ldc 251
    //   76: aload_1
    //   77: invokevirtual 254\011org/json/JSONObject:put\011(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    //   80: pop
    //   81: aload_3
    //   82: aload 10
    //   84: invokevirtual 257\011org/json/JSONArray:put\011(Ljava/lang/Object;)Lorg/json/JSONArray;
    //   87: pop
    //   88: iinc 5 1
    //   91: goto -38 -> 53
    //   94: astore 13
    //   96: ldc 11
    //   98: ldc_w 259
    //   101: invokestatic 139\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;)I
    //   104: pop
    //   105: aconst_null
    //   106: areturn
    //   107: astore 8
    //   109: ldc 11
    //   111: ldc_w 261
    //   114: aload 8
    //   116: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   119: pop
    //   120: goto -32 -> 88
    //   123: aload_0
    //   124: invokeinterface 226 1 0
    //   129: astore 6
    //   131: aload 6
    //   133: ldc 108
    //   135: invokeinterface 265 2 0
    //   140: pop
    //   141: aload 6
    //   143: invokestatic 236\011com/mixpanel/android/mpmetrics/PersistentIdentity:writeEdits\011(Landroid/content/SharedPreferences$Editor;)V
    //   146: aload_3
    //   147: areturn
    //
    // Exception table:
    //   from\011to\011target\011type
    //   32\01142\01194\011org/json/JSONException
    //   63\01188\011107\011org/json/JSONException
  }

  @TargetApi(9)
  private static void writeEdits(SharedPreferences.Editor paramEditor)
  {
    if (Build.VERSION.SDK_INT >= 9)
    {
      paramEditor.apply();
      return;
    }
    paramEditor.commit();
  }

  private void writeIdentities()
  {
    try
    {
      SharedPreferences.Editor localEditor = ((SharedPreferences)this.mLoadStoredPreferences.get()).edit();
      localEditor.putString("events_distinct_id", this.mEventsDistinctId);
      localEditor.putString("people_distinct_id", this.mPeopleDistinctId);
      if (this.mWaitingPeopleRecords == null)
        localEditor.remove("waiting_array");
      while (true)
      {
        writeEdits(localEditor);
        return;
        localEditor.putString("waiting_array", this.mWaitingPeopleRecords.toString());
      }
    }
    catch (ExecutionException localExecutionException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Can't write distinct ids to shared preferences.", localExecutionException.getCause());
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      Log.e("MixpanelAPI.PersistentIdentity", "Can't write distinct ids to shared preferences.", localInterruptedException);
    }
  }

  public static void writeReferrerPrefs(Context paramContext, String paramString, Map<String, String> paramMap)
  {
    SharedPreferences.Editor localEditor;
    synchronized (sReferrerPrefsLock)
    {
      localEditor = paramContext.getSharedPreferences(paramString, 0).edit();
      localEditor.clear();
      Iterator localIterator = paramMap.entrySet().iterator();
      if (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        localEditor.putString((String)localEntry.getKey(), (String)localEntry.getValue());
      }
    }
    writeEdits(localEditor);
    sReferrerPrefsDirty = true;
  }

  // ERROR //
  public void clearPreferences()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 45\011com/mixpanel/android/mpmetrics/PersistentIdentity:mLoadStoredPreferences\011Ljava/util/concurrent/Future;
    //   6: invokeinterface 78 1 0
    //   11: checkcast 80\011android/content/SharedPreferences
    //   14: invokeinterface 226 1 0
    //   19: astore 4
    //   21: aload 4
    //   23: invokeinterface 293 1 0
    //   28: pop
    //   29: aload 4
    //   31: invokestatic 236\011com/mixpanel/android/mpmetrics/PersistentIdentity:writeEdits\011(Landroid/content/SharedPreferences$Editor;)V
    //   34: aload_0
    //   35: invokespecial 296\011com/mixpanel/android/mpmetrics/PersistentIdentity:readSuperProperties\011()V
    //   38: aload_0
    //   39: invokespecial 298\011com/mixpanel/android/mpmetrics/PersistentIdentity:readIdentities\011()V
    //   42: aload_0
    //   43: monitorexit
    //   44: return
    //   45: astore_3
    //   46: new 300\011java/lang/RuntimeException
    //   49: dup
    //   50: aload_3
    //   51: invokevirtual 86\011java/util/concurrent/ExecutionException:getCause\011()Ljava/lang/Throwable;
    //   54: invokespecial 303\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   57: athrow
    //   58: astore_2
    //   59: aload_0
    //   60: monitorexit
    //   61: aload_2
    //   62: athrow
    //   63: astore_1
    //   64: new 300\011java/lang/RuntimeException
    //   67: dup
    //   68: aload_1
    //   69: invokevirtual 304\011java/lang/InterruptedException:getCause\011()Ljava/lang/Throwable;
    //   72: invokespecial 303\011java/lang/RuntimeException:<init>\011(Ljava/lang/Throwable;)V
    //   75: athrow
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01142\01145\011java/util/concurrent/ExecutionException
    //   2\01142\01158\011finally
    //   46\01158\01158\011finally
    //   64\01176\01158\011finally
    //   2\01142\01163\011java/lang/InterruptedException
  }

  // ERROR //
  public void clearPushId()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 45\011com/mixpanel/android/mpmetrics/PersistentIdentity:mLoadStoredPreferences\011Ljava/util/concurrent/Future;
    //   6: invokeinterface 78 1 0
    //   11: checkcast 80\011android/content/SharedPreferences
    //   14: invokeinterface 226 1 0
    //   19: astore 6
    //   21: aload 6
    //   23: ldc_w 307
    //   26: invokeinterface 265 2 0
    //   31: pop
    //   32: aload 6
    //   34: invokestatic 236\011com/mixpanel/android/mpmetrics/PersistentIdentity:writeEdits\011(Landroid/content/SharedPreferences$Editor;)V
    //   37: aload_0
    //   38: monitorexit
    //   39: return
    //   40: astore 4
    //   42: ldc 11
    //   44: ldc_w 309
    //   47: aload 4
    //   49: invokevirtual 86\011java/util/concurrent/ExecutionException:getCause\011()Ljava/lang/Throwable;
    //   52: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   55: pop
    //   56: goto -19 -> 37
    //   59: astore_3
    //   60: aload_0
    //   61: monitorexit
    //   62: aload_3
    //   63: athrow
    //   64: astore_1
    //   65: ldc 11
    //   67: ldc_w 309
    //   70: aload_1
    //   71: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   74: pop
    //   75: goto -38 -> 37
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01137\01140\011java/util/concurrent/ExecutionException
    //   2\01137\01159\011finally
    //   42\01156\01159\011finally
    //   65\01175\01159\011finally
    //   2\01137\01164\011java/lang/InterruptedException
  }

  public void clearSuperProperties()
  {
    try
    {
      this.mSuperPropertiesCache = new JSONObject();
      storeSuperProperties();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public String getEventsDistinctId()
  {
    try
    {
      if (!this.mIdentitiesLoaded)
        readIdentities();
      String str = this.mEventsDistinctId;
      return str;
    }
    finally
    {
    }
  }

  public String getPeopleDistinctId()
  {
    try
    {
      if (!this.mIdentitiesLoaded)
        readIdentities();
      String str = this.mPeopleDistinctId;
      return str;
    }
    finally
    {
    }
  }

  // ERROR //
  public String getPushId()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 45\011com/mixpanel/android/mpmetrics/PersistentIdentity:mLoadStoredPreferences\011Ljava/util/concurrent/Future;
    //   6: invokeinterface 78 1 0
    //   11: checkcast 80\011android/content/SharedPreferences
    //   14: ldc_w 307
    //   17: aconst_null
    //   18: invokeinterface 98 3 0
    //   23: astore 7
    //   25: aload 7
    //   27: astore_3
    //   28: aload_0
    //   29: monitorexit
    //   30: aload_3
    //   31: areturn
    //   32: astore 5
    //   34: ldc 11
    //   36: ldc_w 309
    //   39: aload 5
    //   41: invokevirtual 86\011java/util/concurrent/ExecutionException:getCause\011()Ljava/lang/Throwable;
    //   44: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   47: pop
    //   48: aconst_null
    //   49: astore_3
    //   50: goto -22 -> 28
    //   53: astore 4
    //   55: aload_0
    //   56: monitorexit
    //   57: aload 4
    //   59: athrow
    //   60: astore_1
    //   61: ldc 11
    //   63: ldc_w 309
    //   66: aload_1
    //   67: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   70: pop
    //   71: aconst_null
    //   72: astore_3
    //   73: goto -45 -> 28
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01125\01132\011java/util/concurrent/ExecutionException
    //   2\01125\01153\011finally
    //   34\01148\01153\011finally
    //   61\01171\01153\011finally
    //   2\01125\01160\011java/lang/InterruptedException
  }

  public Map<String, String> getReferrerProperties()
  {
    synchronized (sReferrerPrefsLock)
    {
      if ((sReferrerPrefsDirty) || (this.mReferrerPropertiesCache == null))
      {
        readReferrerProperties();
        sReferrerPrefsDirty = false;
      }
      return this.mReferrerPropertiesCache;
    }
  }

  public JSONObject getSuperProperties()
  {
    try
    {
      if (this.mSuperPropertiesCache == null)
        readSuperProperties();
      JSONObject localJSONObject = this.mSuperPropertiesCache;
      return localJSONObject;
    }
    finally
    {
    }
  }

  public void registerSuperProperties(JSONObject paramJSONObject)
  {
    try
    {
      JSONObject localJSONObject = getSuperProperties();
      Iterator localIterator = paramJSONObject.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        try
        {
          localJSONObject.put(str, paramJSONObject.get(str));
        }
        catch (JSONException localJSONException)
        {
          Log.e("MixpanelAPI.PersistentIdentity", "Exception registering super property.", localJSONException);
        }
      }
    }
    finally
    {
    }
    storeSuperProperties();
  }

  public void registerSuperPropertiesOnce(JSONObject paramJSONObject)
  {
    try
    {
      JSONObject localJSONObject = getSuperProperties();
      Iterator localIterator = paramJSONObject.keys();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        boolean bool = localJSONObject.has(str);
        if (!bool)
          try
          {
            localJSONObject.put(str, paramJSONObject.get(str));
          }
          catch (JSONException localJSONException)
          {
            Log.e("MixpanelAPI.PersistentIdentity", "Exception registering super property.", localJSONException);
          }
      }
    }
    finally
    {
    }
    storeSuperProperties();
  }

  public void setEventsDistinctId(String paramString)
  {
    try
    {
      if (!this.mIdentitiesLoaded)
        readIdentities();
      this.mEventsDistinctId = paramString;
      writeIdentities();
      return;
    }
    finally
    {
    }
  }

  public void setPeopleDistinctId(String paramString)
  {
    try
    {
      if (!this.mIdentitiesLoaded)
        readIdentities();
      this.mPeopleDistinctId = paramString;
      writeIdentities();
      return;
    }
    finally
    {
    }
  }

  // ERROR //
  public void storePushId(String paramString)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 45\011com/mixpanel/android/mpmetrics/PersistentIdentity:mLoadStoredPreferences\011Ljava/util/concurrent/Future;
    //   6: invokeinterface 78 1 0
    //   11: checkcast 80\011android/content/SharedPreferences
    //   14: invokeinterface 226 1 0
    //   19: astore 7
    //   21: aload 7
    //   23: ldc_w 307
    //   26: aload_1
    //   27: invokeinterface 232 3 0
    //   32: pop
    //   33: aload 7
    //   35: invokestatic 236\011com/mixpanel/android/mpmetrics/PersistentIdentity:writeEdits\011(Landroid/content/SharedPreferences$Editor;)V
    //   38: aload_0
    //   39: monitorexit
    //   40: return
    //   41: astore 5
    //   43: ldc 11
    //   45: ldc_w 309
    //   48: aload 5
    //   50: invokevirtual 86\011java/util/concurrent/ExecutionException:getCause\011()Ljava/lang/Throwable;
    //   53: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   56: pop
    //   57: goto -19 -> 38
    //   60: astore 4
    //   62: aload_0
    //   63: monitorexit
    //   64: aload 4
    //   66: athrow
    //   67: astore_2
    //   68: ldc 11
    //   70: ldc_w 309
    //   73: aload_2
    //   74: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   77: pop
    //   78: goto -40 -> 38
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01138\01141\011java/util/concurrent/ExecutionException
    //   2\01138\01160\011finally
    //   43\01157\01160\011finally
    //   68\01178\01160\011finally
    //   2\01138\01167\011java/lang/InterruptedException
  }

  public void storeWaitingPeopleRecord(JSONObject paramJSONObject)
  {
    try
    {
      if (!this.mIdentitiesLoaded)
        readIdentities();
      if (this.mWaitingPeopleRecords == null)
        this.mWaitingPeopleRecords = new JSONArray();
      this.mWaitingPeopleRecords.put(paramJSONObject);
      writeIdentities();
      return;
    }
    finally
    {
    }
  }

  public void unregisterSuperProperty(String paramString)
  {
    try
    {
      getSuperProperties().remove(paramString);
      storeSuperProperties();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  // ERROR //
  public JSONArray waitingPeopleRecordsForSending()
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aconst_null
    //   3: astore_1
    //   4: aload_0
    //   5: getfield 45\011com/mixpanel/android/mpmetrics/PersistentIdentity:mLoadStoredPreferences\011Ljava/util/concurrent/Future;
    //   8: invokeinterface 78 1 0
    //   13: checkcast 80\011android/content/SharedPreferences
    //   16: invokestatic 343\011com/mixpanel/android/mpmetrics/PersistentIdentity:waitingPeopleRecordsForSending\011(Landroid/content/SharedPreferences;)Lorg/json/JSONArray;
    //   19: astore_1
    //   20: aload_0
    //   21: invokespecial 298\011com/mixpanel/android/mpmetrics/PersistentIdentity:readIdentities\011()V
    //   24: aload_0
    //   25: monitorexit
    //   26: aload_1
    //   27: areturn
    //   28: astore 5
    //   30: ldc 11
    //   32: ldc_w 345
    //   35: aload 5
    //   37: invokevirtual 86\011java/util/concurrent/ExecutionException:getCause\011()Ljava/lang/Throwable;
    //   40: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   43: pop
    //   44: goto -20 -> 24
    //   47: astore 4
    //   49: aload_0
    //   50: monitorexit
    //   51: aload 4
    //   53: athrow
    //   54: astore_2
    //   55: ldc 11
    //   57: ldc_w 345
    //   60: aload_2
    //   61: invokestatic 92\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    //   64: pop
    //   65: goto -41 -> 24
    //
    // Exception table:
    //   from\011to\011target\011type
    //   4\01124\01128\011java/util/concurrent/ExecutionException
    //   4\01124\01147\011finally
    //   30\01144\01147\011finally
    //   55\01165\01147\011finally
    //   4\01124\01154\011java/lang/InterruptedException
  }
}