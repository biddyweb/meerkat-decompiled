package com.mixpanel.android.viewcrawler;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.util.JsonWriter;
import android.util.Log;
import android.util.Pair;
import com.mixpanel.android.mpmetrics.MPConfig;
import com.mixpanel.android.mpmetrics.MixpanelAPI;
import com.mixpanel.android.mpmetrics.ResourceReader.Ids;
import com.mixpanel.android.mpmetrics.Tweaks;
import com.mixpanel.android.util.JSONUtils;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.URI;
import java.net.URISyntaxException;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@TargetApi(16)
public class ViewCrawler
  implements UpdatesFromMixpanel, TrackingDebug
{
  private static final int EMULATOR_CONNECT_ATTEMPT_INTERVAL_MILLIS = 30000;
  private static final String LOGTAG = "MixpanelAPI.ViewCrawler";
  private static final int MESSAGE_CONNECT_TO_EDITOR = 1;
  private static final int MESSAGE_EVENT_BINDINGS_RECEIVED = 6;
  private static final int MESSAGE_HANDLE_EDITOR_BINDINGS_RECEIVED = 8;
  private static final int MESSAGE_HANDLE_EDITOR_CHANGES_RECEIVED = 3;
  private static final int MESSAGE_HANDLE_EDITOR_CLOSED = 10;
  private static final int MESSAGE_INITIALIZE_CHANGES = 0;
  private static final int MESSAGE_SEND_DEVICE_INFO = 4;
  private static final int MESSAGE_SEND_EVENT_TRACKED = 9;
  private static final int MESSAGE_SEND_STATE_FOR_EDITING = 2;
  private static final String SHARED_PREF_BINDINGS_KEY = "mixpanel.viewcrawler.bindings";
  private static final String SHARED_PREF_CHANGES_KEY = "mixpanel.viewcrawler.changes";
  private static final String SHARED_PREF_EDITS_FILE = "mixpanel.viewcrawler.changes";
  private final MPConfig mConfig;
  private final Map<String, String> mDeviceInfo;
  private final EditState mEditState;
  private final List<Pair<String, JSONObject>> mEditorChanges;
  private final List<Pair<String, JSONObject>> mEditorEventBindings;
  private final ViewCrawlerHandler mMessageThreadHandler;
  private final List<Pair<String, JSONObject>> mPersistentChanges;
  private final List<Pair<String, JSONObject>> mPersistentEventBindings;
  private final EditProtocol mProtocol;
  private final SSLSocketFactory mSSLSocketFactory;
  private final DynamicEventTracker mTracker;
  private final Tweaks mTweaks;

  public ViewCrawler(Context paramContext, String paramString, MixpanelAPI paramMixpanelAPI)
  {
    this.mConfig = MPConfig.getInstance(paramContext);
    this.mPersistentChanges = new ArrayList();
    this.mEditorChanges = new ArrayList();
    this.mPersistentEventBindings = new ArrayList();
    this.mEditorEventBindings = new ArrayList();
    String str = this.mConfig.getResourcePackageName();
    if (str == null)
      str = paramContext.getPackageName();
    this.mProtocol = new EditProtocol(new ResourceReader.Ids(str, paramContext));
    this.mEditState = new EditState();
    this.mTweaks = new Tweaks();
    this.mDeviceInfo = paramMixpanelAPI.getDeviceInfo();
    ((Application)paramContext.getApplicationContext()).registerActivityLifecycleCallbacks(new LifecycleCallbacks());
    HandlerThread localHandlerThread = new HandlerThread(ViewCrawler.class.getCanonicalName());
    localHandlerThread.setPriority(10);
    localHandlerThread.start();
    this.mMessageThreadHandler = new ViewCrawlerHandler(paramContext, paramString, localHandlerThread.getLooper());
    this.mMessageThreadHandler.sendMessage(this.mMessageThreadHandler.obtainMessage(0));
    this.mTracker = new DynamicEventTracker(paramMixpanelAPI, this.mMessageThreadHandler);
    try
    {
      SSLContext localSSLContext = SSLContext.getInstance("TLS");
      localSSLContext.init(null, null, null);
      SSLSocketFactory localSSLSocketFactory2 = localSSLContext.getSocketFactory();
      localSSLSocketFactory1 = localSSLSocketFactory2;
      this.mSSLSocketFactory = localSSLSocketFactory1;
      return;
    }
    catch (GeneralSecurityException localGeneralSecurityException)
    {
      while (true)
      {
        Log.i("MixpanelAPI.ViewCrawler", "System has no SSL support. Built-in events editor will not be available", localGeneralSecurityException);
        SSLSocketFactory localSSLSocketFactory1 = null;
      }
    }
  }

  public Tweaks getTweaks()
  {
    return this.mTweaks;
  }

  public void reportTrack(String paramString)
  {
    Message localMessage = this.mMessageThreadHandler.obtainMessage();
    localMessage.what = 9;
    localMessage.obj = paramString;
    this.mMessageThreadHandler.sendMessage(localMessage);
  }

  public void setEventBindings(JSONArray paramJSONArray)
  {
    Message localMessage = this.mMessageThreadHandler.obtainMessage(6);
    localMessage.obj = paramJSONArray;
    this.mMessageThreadHandler.sendMessage(localMessage);
  }

  private class Editor
    implements EditorConnection.Editor
  {
    private Editor()
    {
    }

    public void bindEvents(JSONObject paramJSONObject)
    {
      Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(8);
      localMessage.obj = paramJSONObject;
      ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
    }

    public void cleanup()
    {
      Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(10);
      ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
    }

    public void performEdit(JSONObject paramJSONObject)
    {
      Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(3);
      localMessage.obj = paramJSONObject;
      ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
    }

    public void sendDeviceInfo()
    {
      Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(4);
      ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
    }

    public void sendSnapshot(JSONObject paramJSONObject)
    {
      Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(2);
      localMessage.obj = paramJSONObject;
      ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
    }
  }

  private class EmulatorConnector
    implements Runnable
  {
    private volatile boolean mStopped = true;

    public EmulatorConnector()
    {
    }

    public void run()
    {
      if (!this.mStopped)
      {
        Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(1);
        ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
      }
      ViewCrawler.this.mMessageThreadHandler.postDelayed(this, 30000L);
    }

    public void start()
    {
      this.mStopped = false;
      ViewCrawler.this.mMessageThreadHandler.post(this);
    }

    public void stop()
    {
      this.mStopped = true;
      ViewCrawler.this.mMessageThreadHandler.removeCallbacks(this);
    }
  }

  private class LifecycleCallbacks
    implements Application.ActivityLifecycleCallbacks, FlipGesture.OnFlipGestureListener
  {
    private final ViewCrawler.EmulatorConnector mEmulatorConnector = new ViewCrawler.EmulatorConnector(ViewCrawler.this);
    private final FlipGesture mFlipGesture = new FlipGesture(this);

    public LifecycleCallbacks()
    {
    }

    private void installConnectionSensor(Activity paramActivity)
    {
      if ((isInEmulator()) && (!ViewCrawler.this.mConfig.getDisableEmulatorBindingUI()))
        this.mEmulatorConnector.start();
      while (ViewCrawler.this.mConfig.getDisableGestureBindingUI())
        return;
      SensorManager localSensorManager = (SensorManager)paramActivity.getSystemService("sensor");
      Sensor localSensor = localSensorManager.getDefaultSensor(1);
      localSensorManager.registerListener(this.mFlipGesture, localSensor, 3);
    }

    private boolean isInEmulator()
    {
      if (!Build.HARDWARE.equals("goldfish"));
      while ((!Build.BRAND.startsWith("generic")) || (!Build.DEVICE.startsWith("generic")) || (!Build.PRODUCT.contains("sdk")) || (!Build.MODEL.toLowerCase().contains("sdk")))
        return false;
      return true;
    }

    private void uninstallConnectionSensor(Activity paramActivity)
    {
      if ((isInEmulator()) && (!ViewCrawler.this.mConfig.getDisableEmulatorBindingUI()))
        this.mEmulatorConnector.stop();
      while (ViewCrawler.this.mConfig.getDisableGestureBindingUI())
        return;
      ((SensorManager)paramActivity.getSystemService("sensor")).unregisterListener(this.mFlipGesture);
    }

    public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
    {
    }

    public void onActivityDestroyed(Activity paramActivity)
    {
    }

    public void onActivityPaused(Activity paramActivity)
    {
      ViewCrawler.this.mEditState.remove(paramActivity);
      if (ViewCrawler.this.mEditState.isEmpty())
        uninstallConnectionSensor(paramActivity);
    }

    public void onActivityResumed(Activity paramActivity)
    {
      installConnectionSensor(paramActivity);
      ViewCrawler.this.mEditState.add(paramActivity);
    }

    public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
    {
    }

    public void onActivityStarted(Activity paramActivity)
    {
    }

    public void onActivityStopped(Activity paramActivity)
    {
    }

    public void onFlipGesture()
    {
      Message localMessage = ViewCrawler.this.mMessageThreadHandler.obtainMessage(1);
      ViewCrawler.this.mMessageThreadHandler.sendMessage(localMessage);
    }
  }

  private class ViewCrawlerHandler extends Handler
  {
    private final Context mContext;
    private EditorConnection mEditorConnection;
    private ViewSnapshot mSnapshot;
    private final String mToken;

    public ViewCrawlerHandler(Context paramString, String paramLooper, Looper arg4)
    {
      super();
      this.mContext = paramString;
      this.mToken = paramLooper;
      this.mSnapshot = null;
    }

    private void connectToEditor()
    {
      if (MPConfig.DEBUG)
        Log.v("MixpanelAPI.ViewCrawler", "connecting to editor");
      if ((this.mEditorConnection != null) && (this.mEditorConnection.isValid()))
        if (MPConfig.DEBUG)
          Log.v("MixpanelAPI.ViewCrawler", "There is already a valid connection to an events editor.");
      do
      {
        return;
        if (ViewCrawler.this.mSSLSocketFactory != null)
          break;
      }
      while (!MPConfig.DEBUG);
      Log.v("MixpanelAPI.ViewCrawler", "SSL is not available on this device, no connection will be attempted to the events editor.");
      return;
      String str = MPConfig.getInstance(this.mContext).getEditorUrl() + this.mToken;
      try
      {
        Socket localSocket = ViewCrawler.this.mSSLSocketFactory.createSocket();
        this.mEditorConnection = new EditorConnection(new URI(str), new ViewCrawler.Editor(ViewCrawler.this, null), localSocket);
        return;
      }
      catch (URISyntaxException localURISyntaxException)
      {
        Log.e("MixpanelAPI.ViewCrawler", "Error parsing URI " + str + " for editor websocket", localURISyntaxException);
        return;
      }
      catch (EditorConnection.EditorConnectionException localEditorConnectionException)
      {
        Log.e("MixpanelAPI.ViewCrawler", "Error connecting to URI " + str, localEditorConnectionException);
        return;
      }
      catch (IOException localIOException)
      {
        Log.i("MixpanelAPI.ViewCrawler", "Can't create SSL Socket to connect to editor service", localIOException);
      }
    }

    private SharedPreferences getSharedPreferences()
    {
      String str = "mixpanel.viewcrawler.changes" + this.mToken;
      return this.mContext.getSharedPreferences(str, 0);
    }

    // ERROR //
    private void handleEditorBindingsReceived(JSONObject paramJSONObject)
    {
      // Byte code:
      //   0: aload_1
      //   1: ldc 137
      //   3: invokevirtual 143\011org/json/JSONObject:getJSONObject\011(Ljava/lang/String;)Lorg/json/JSONObject;
      //   6: ldc 145
      //   8: invokevirtual 149\011org/json/JSONObject:getJSONArray\011(Ljava/lang/String;)Lorg/json/JSONArray;
      //   11: astore 4
      //   13: aload 4
      //   15: invokevirtual 155\011org/json/JSONArray:length\011()I
      //   18: istore 5
      //   20: aload_0
      //   21: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   24: invokestatic 159\011com/mixpanel/android/viewcrawler/ViewCrawler:access$1100\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   27: astore 6
      //   29: aload 6
      //   31: monitorenter
      //   32: aload_0
      //   33: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   36: invokestatic 159\011com/mixpanel/android/viewcrawler/ViewCrawler:access$1100\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   39: invokeinterface 164 1 0
      //   44: iconst_0
      //   45: istore 8
      //   47: iload 8
      //   49: iload 5
      //   51: if_icmpge +106 -> 157
      //   54: aload 4
      //   56: iload 8
      //   58: invokevirtual 167\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
      //   61: astore 11
      //   63: aload 11
      //   65: ldc 169
      //   67: invokestatic 175\011com/mixpanel/android/util/JSONUtils:optionalStringKey\011(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
      //   70: astore 12
      //   72: aload_0
      //   73: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   76: invokestatic 159\011com/mixpanel/android/viewcrawler/ViewCrawler:access$1100\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   79: new 177\011android/util/Pair
      //   82: dup
      //   83: aload 12
      //   85: aload 11
      //   87: invokespecial 180\011android/util/Pair:<init>\011(Ljava/lang/Object;Ljava/lang/Object;)V
      //   90: invokeinterface 184 2 0
      //   95: pop
      //   96: iinc 8 1
      //   99: goto -52 -> 47
      //   102: astore_2
      //   103: ldc 43
      //   105: ldc 186
      //   107: aload_2
      //   108: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   111: pop
      //   112: return
      //   113: astore 9
      //   115: ldc 43
      //   117: new 71\011java/lang/StringBuilder
      //   120: dup
      //   121: invokespecial 73\011java/lang/StringBuilder:<init>\011()V
      //   124: ldc 188
      //   126: invokevirtual 85\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   129: aload 4
      //   131: invokevirtual 189\011org/json/JSONArray:toString\011()Ljava/lang/String;
      //   134: invokevirtual 85\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   137: invokevirtual 88\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   140: aload 9
      //   142: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   145: pop
      //   146: goto -50 -> 96
      //   149: astore 7
      //   151: aload 6
      //   153: monitorexit
      //   154: aload 7
      //   156: athrow
      //   157: aload 6
      //   159: monitorexit
      //   160: aload_0
      //   161: invokespecial 192\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:updateEditState\011()V
      //   164: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   0\01113\011102\011org/json/JSONException
      //   54\01196\011113\011org/json/JSONException
      //   32\01144\011149\011finally
      //   54\01196\011149\011finally
      //   115\011146\011149\011finally
      //   151\011154\011149\011finally
      //   157\011160\011149\011finally
    }

    private void handleEditorChangeReceived(JSONObject paramJSONObject)
    {
      try
      {
        String str = JSONUtils.optionalStringKey(paramJSONObject, "target");
        JSONObject localJSONObject = paramJSONObject.getJSONObject("change");
        synchronized (ViewCrawler.this.mEditorChanges)
        {
          ViewCrawler.this.mEditorChanges.add(new Pair(str, localJSONObject));
          updateEditState();
          return;
        }
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.ViewCrawler", "Bad change request received", localJSONException);
      }
    }

    private void handleEditorClosed()
    {
      synchronized (ViewCrawler.this.mEditorChanges)
      {
        ViewCrawler.this.mEditorChanges.clear();
      }
      synchronized (ViewCrawler.this.mEditorEventBindings)
      {
        ViewCrawler.this.mEditorEventBindings.clear();
        this.mSnapshot = null;
        updateEditState();
        return;
        localObject1 = finally;
        throw localObject1;
      }
    }

    private void handleEventBindingsReceived(JSONArray paramJSONArray)
    {
      SharedPreferences.Editor localEditor = getSharedPreferences().edit();
      localEditor.putString("mixpanel.viewcrawler.bindings", paramJSONArray.toString());
      localEditor.apply();
      initializeChanges();
    }

    // ERROR //
    private void initializeChanges()
    {
      // Byte code:
      //   0: aload_0
      //   1: invokespecial 207\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:getSharedPreferences\011()Landroid/content/SharedPreferences;
      //   4: astore_1
      //   5: aload_1
      //   6: ldc 126
      //   8: aconst_null
      //   9: invokeinterface 231 3 0
      //   14: astore_2
      //   15: aload_1
      //   16: ldc 215
      //   18: aconst_null
      //   19: invokeinterface 231 3 0
      //   24: astore_3
      //   25: aload_2
      //   26: ifnull +110 -> 136
      //   29: new 151\011org/json/JSONArray
      //   32: dup
      //   33: aload_2
      //   34: invokespecial 232\011org/json/JSONArray:<init>\011(Ljava/lang/String;)V
      //   37: astore 16
      //   39: aload_0
      //   40: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   43: invokestatic 235\011com/mixpanel/android/viewcrawler/ViewCrawler:access$300\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   46: astore 17
      //   48: aload 17
      //   50: monitorenter
      //   51: aload_0
      //   52: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   55: invokestatic 235\011com/mixpanel/android/viewcrawler/ViewCrawler:access$300\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   58: invokeinterface 164 1 0
      //   63: iconst_0
      //   64: istore 19
      //   66: iload 19
      //   68: aload 16
      //   70: invokevirtual 155\011org/json/JSONArray:length\011()I
      //   73: if_icmpge +60 -> 133
      //   76: aload 16
      //   78: iload 19
      //   80: invokevirtual 167\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
      //   83: astore 20
      //   85: aload 20
      //   87: ldc 195
      //   89: invokestatic 175\011com/mixpanel/android/util/JSONUtils:optionalStringKey\011(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
      //   92: astore 21
      //   94: aload 20
      //   96: ldc 197
      //   98: invokevirtual 143\011org/json/JSONObject:getJSONObject\011(Ljava/lang/String;)Lorg/json/JSONObject;
      //   101: astore 22
      //   103: aload_0
      //   104: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   107: invokestatic 235\011com/mixpanel/android/viewcrawler/ViewCrawler:access$300\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   110: new 177\011android/util/Pair
      //   113: dup
      //   114: aload 21
      //   116: aload 22
      //   118: invokespecial 180\011android/util/Pair:<init>\011(Ljava/lang/Object;Ljava/lang/Object;)V
      //   121: invokeinterface 184 2 0
      //   126: pop
      //   127: iinc 19 1
      //   130: goto -64 -> 66
      //   133: aload 17
      //   135: monitorexit
      //   136: aload_3
      //   137: ifnull +153 -> 290
      //   140: new 151\011org/json/JSONArray
      //   143: dup
      //   144: aload_3
      //   145: invokespecial 232\011org/json/JSONArray:<init>\011(Ljava/lang/String;)V
      //   148: astore 4
      //   150: aload_0
      //   151: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   154: invokestatic 238\011com/mixpanel/android/viewcrawler/ViewCrawler:access$400\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   157: astore 10
      //   159: aload 10
      //   161: monitorenter
      //   162: aload_0
      //   163: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   166: invokestatic 238\011com/mixpanel/android/viewcrawler/ViewCrawler:access$400\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   169: invokeinterface 164 1 0
      //   174: iconst_0
      //   175: istore 12
      //   177: iload 12
      //   179: aload 4
      //   181: invokevirtual 155\011org/json/JSONArray:length\011()I
      //   184: if_icmpge +111 -> 295
      //   187: aload 4
      //   189: iload 12
      //   191: invokevirtual 167\011org/json/JSONArray:getJSONObject\011(I)Lorg/json/JSONObject;
      //   194: astore 13
      //   196: aload 13
      //   198: ldc 169
      //   200: invokestatic 175\011com/mixpanel/android/util/JSONUtils:optionalStringKey\011(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
      //   203: astore 14
      //   205: aload_0
      //   206: getfield 18\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:this$0\011Lcom/mixpanel/android/viewcrawler/ViewCrawler;
      //   209: invokestatic 238\011com/mixpanel/android/viewcrawler/ViewCrawler:access$400\011(Lcom/mixpanel/android/viewcrawler/ViewCrawler;)Ljava/util/List;
      //   212: new 177\011android/util/Pair
      //   215: dup
      //   216: aload 14
      //   218: aload 13
      //   220: invokespecial 180\011android/util/Pair:<init>\011(Ljava/lang/Object;Ljava/lang/Object;)V
      //   223: invokeinterface 184 2 0
      //   228: pop
      //   229: iinc 12 1
      //   232: goto -55 -> 177
      //   235: astore 18
      //   237: aload 17
      //   239: monitorexit
      //   240: aload 18
      //   242: athrow
      //   243: astore 5
      //   245: ldc 43
      //   247: ldc 240
      //   249: aload 5
      //   251: invokestatic 122\011android/util/Log:i\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   254: pop
      //   255: aload_1
      //   256: invokeinterface 213 1 0
      //   261: astore 7
      //   263: aload 7
      //   265: ldc 126
      //   267: invokeinterface 244 2 0
      //   272: pop
      //   273: aload 7
      //   275: ldc 215
      //   277: invokeinterface 244 2 0
      //   282: pop
      //   283: aload 7
      //   285: invokeinterface 224 1 0
      //   290: aload_0
      //   291: invokespecial 192\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:updateEditState\011()V
      //   294: return
      //   295: aload 10
      //   297: monitorexit
      //   298: goto -8 -> 290
      //   301: astore 11
      //   303: aload 10
      //   305: monitorexit
      //   306: aload 11
      //   308: athrow
      //
      // Exception table:
      //   from\011to\011target\011type
      //   51\01163\011235\011finally
      //   66\011127\011235\011finally
      //   133\011136\011235\011finally
      //   237\011240\011235\011finally
      //   29\01151\011243\011org/json/JSONException
      //   140\011162\011243\011org/json/JSONException
      //   240\011243\011243\011org/json/JSONException
      //   306\011309\011243\011org/json/JSONException
      //   162\011174\011301\011finally
      //   177\011229\011301\011finally
      //   295\011298\011301\011finally
      //   303\011306\011301\011finally
    }

    private void sendDeviceInfo()
    {
      OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(this.mEditorConnection.getBufferedOutputStream());
      try
      {
        localOutputStreamWriter.write("{\"type\": \"device_info_response\",");
        localOutputStreamWriter.write("\"payload\": {");
        localOutputStreamWriter.write("\"device_type\": \"Android\",");
        localOutputStreamWriter.write("\"device_name\":");
        localOutputStreamWriter.write(JSONObject.quote(Build.BRAND + "/" + Build.MODEL));
        localOutputStreamWriter.write(",");
        localOutputStreamWriter.write("\"tweaks\":");
        localOutputStreamWriter.write(new JSONObject(ViewCrawler.this.mTweaks.getAll()).toString());
        Iterator localIterator = ViewCrawler.this.mDeviceInfo.entrySet().iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          localOutputStreamWriter.write(",");
          localOutputStreamWriter.write(JSONObject.quote((String)localEntry.getKey()));
          localOutputStreamWriter.write(":");
          localOutputStreamWriter.write(JSONObject.quote((String)localEntry.getValue()));
        }
      }
      catch (IOException localIOException2)
      {
        localIOException2 = localIOException2;
        Log.e("MixpanelAPI.ViewCrawler", "Can't write device_info to server", localIOException2);
        try
        {
          localOutputStreamWriter.close();
          return;
          localOutputStreamWriter.write("}");
          localOutputStreamWriter.write("}");
          try
          {
            localOutputStreamWriter.close();
            return;
          }
          catch (IOException localIOException4)
          {
            Log.e("MixpanelAPI.ViewCrawler", "Can't close websocket writer", localIOException4);
            return;
          }
        }
        catch (IOException localIOException3)
        {
          Log.e("MixpanelAPI.ViewCrawler", "Can't close websocket writer", localIOException3);
          return;
        }
      }
      finally
      {
      }
      try
      {
        localOutputStreamWriter.close();
        throw localObject;
      }
      catch (IOException localIOException1)
      {
        while (true)
          Log.e("MixpanelAPI.ViewCrawler", "Can't close websocket writer", localIOException1);
      }
    }

    // ERROR //
    private void sendError(String paramString)
    {
      // Byte code:
      //   0: new 139\011org/json/JSONObject
      //   3: dup
      //   4: invokespecial 345\011org/json/JSONObject:<init>\011()V
      //   7: astore_2
      //   8: aload_2
      //   9: ldc_w 347
      //   12: aload_1
      //   13: invokevirtual 351\011org/json/JSONObject:put\011(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
      //   16: pop
      //   17: new 247\011java/io/OutputStreamWriter
      //   20: dup
      //   21: aload_0
      //   22: getfield 53\011com/mixpanel/android/viewcrawler/ViewCrawler$ViewCrawlerHandler:mEditorConnection\011Lcom/mixpanel/android/viewcrawler/EditorConnection;
      //   25: invokevirtual 251\011com/mixpanel/android/viewcrawler/EditorConnection:getBufferedOutputStream\011()Ljava/io/BufferedOutputStream;
      //   28: invokespecial 254\011java/io/OutputStreamWriter:<init>\011(Ljava/io/OutputStream;)V
      //   31: astore 5
      //   33: aload 5
      //   35: ldc_w 353
      //   38: invokevirtual 259\011java/io/OutputStreamWriter:write\011(Ljava/lang/String;)V
      //   41: aload 5
      //   43: ldc_w 355
      //   46: invokevirtual 259\011java/io/OutputStreamWriter:write\011(Ljava/lang/String;)V
      //   49: aload 5
      //   51: aload_2
      //   52: invokevirtual 297\011org/json/JSONObject:toString\011()Ljava/lang/String;
      //   55: invokevirtual 259\011java/io/OutputStreamWriter:write\011(Ljava/lang/String;)V
      //   58: aload 5
      //   60: ldc_w 341
      //   63: invokevirtual 259\011java/io/OutputStreamWriter:write\011(Ljava/lang/String;)V
      //   66: aload 5
      //   68: invokevirtual 339\011java/io/OutputStreamWriter:close\011()V
      //   71: return
      //   72: astore_3
      //   73: ldc 43
      //   75: ldc_w 357
      //   78: aload_3
      //   79: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   82: pop
      //   83: goto -66 -> 17
      //   86: astore 13
      //   88: ldc 43
      //   90: ldc_w 359
      //   93: aload 13
      //   95: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   98: pop
      //   99: return
      //   100: astore 9
      //   102: ldc 43
      //   104: ldc_w 361
      //   107: aload 9
      //   109: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   112: pop
      //   113: aload 5
      //   115: invokevirtual 339\011java/io/OutputStreamWriter:close\011()V
      //   118: return
      //   119: astore 11
      //   121: ldc 43
      //   123: ldc_w 359
      //   126: aload 11
      //   128: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   131: pop
      //   132: return
      //   133: astore 6
      //   135: aload 5
      //   137: invokevirtual 339\011java/io/OutputStreamWriter:close\011()V
      //   140: aload 6
      //   142: athrow
      //   143: astore 7
      //   145: ldc 43
      //   147: ldc_w 359
      //   150: aload 7
      //   152: invokestatic 115\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   155: pop
      //   156: goto -16 -> 140
      //
      // Exception table:
      //   from\011to\011target\011type
      //   8\01117\01172\011org/json/JSONException
      //   66\01171\01186\011java/io/IOException
      //   33\01166\011100\011java/io/IOException
      //   113\011118\011119\011java/io/IOException
      //   33\01166\011133\011finally
      //   102\011113\011133\011finally
      //   135\011140\011143\011java/io/IOException
    }

    private void sendReportTrackToEditor(String paramString)
    {
      if ((this.mEditorConnection == null) || (!this.mEditorConnection.isValid()))
        return;
      JsonWriter localJsonWriter = new JsonWriter(new OutputStreamWriter(this.mEditorConnection.getBufferedOutputStream()));
      try
      {
        localJsonWriter.beginObject();
        localJsonWriter.name("type").value("track_message");
        localJsonWriter.name("payload");
        localJsonWriter.beginObject();
        localJsonWriter.name("event_name").value(paramString);
        localJsonWriter.endObject();
        localJsonWriter.endObject();
        localJsonWriter.flush();
        try
        {
          localJsonWriter.close();
          return;
        }
        catch (IOException localIOException4)
        {
          Log.e("MixpanelAPI.ViewCrawler", "Can't close writer.", localIOException4);
          return;
        }
      }
      catch (IOException localIOException2)
      {
        localIOException2 = localIOException2;
        Log.e("MixpanelAPI.ViewCrawler", "Can't write track_message to server", localIOException2);
        try
        {
          localJsonWriter.close();
          return;
        }
        catch (IOException localIOException3)
        {
          Log.e("MixpanelAPI.ViewCrawler", "Can't close writer.", localIOException3);
          return;
        }
      }
      finally
      {
      }
      try
      {
        localJsonWriter.close();
        throw localObject;
      }
      catch (IOException localIOException1)
      {
        while (true)
          Log.e("MixpanelAPI.ViewCrawler", "Can't close writer.", localIOException1);
      }
    }

    private void sendSnapshot(JSONObject paramJSONObject)
    {
      long l1 = System.currentTimeMillis();
      try
      {
        JSONObject localJSONObject = paramJSONObject.getJSONObject("payload");
        if (localJSONObject.has("config"))
          this.mSnapshot = ViewCrawler.this.mProtocol.readSnapshotConfig(localJSONObject);
        if (this.mSnapshot == null)
        {
          sendError("No snapshot configuration (or a malformed snapshot configuration) was sent.");
          Log.w("MixpanelAPI.ViewCrawler", "Mixpanel editor is misconfigured, sent a snapshot request without a valid configuration.");
          return;
        }
      }
      catch (JSONException localJSONException)
      {
        Log.e("MixpanelAPI.ViewCrawler", "Payload with snapshot config required with snapshot request", localJSONException);
        sendError("Payload with snapshot config required with snapshot request");
        return;
      }
      catch (EditProtocol.BadInstructionsException localBadInstructionsException)
      {
        Log.e("MixpanelAPI.ViewCrawler", "Editor sent malformed message with snapshot request", localBadInstructionsException);
        sendError(localBadInstructionsException.getMessage());
        return;
      }
      BufferedOutputStream localBufferedOutputStream = this.mEditorConnection.getBufferedOutputStream();
      OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(localBufferedOutputStream);
      try
      {
        localOutputStreamWriter.write("{");
        localOutputStreamWriter.write("\"type\": \"snapshot_response\",");
        localOutputStreamWriter.write("\"payload\": {");
        localOutputStreamWriter.write("\"activities\":");
        localOutputStreamWriter.flush();
        this.mSnapshot.snapshots(ViewCrawler.this.mEditState, localBufferedOutputStream);
        long l2 = System.currentTimeMillis() - l1;
        localOutputStreamWriter.write(",\"snapshot_time_millis\": ");
        localOutputStreamWriter.write(Long.toString(l2));
        localOutputStreamWriter.write("}");
        localOutputStreamWriter.write("}");
        try
        {
          localOutputStreamWriter.close();
          return;
        }
        catch (IOException localIOException4)
        {
          Log.e("MixpanelAPI.ViewCrawler", "Can't close writer.", localIOException4);
          return;
        }
      }
      catch (IOException localIOException2)
      {
        localIOException2 = localIOException2;
        Log.e("MixpanelAPI.ViewCrawler", "Can't write snapshot request to server", localIOException2);
        try
        {
          localOutputStreamWriter.close();
          return;
        }
        catch (IOException localIOException3)
        {
          Log.e("MixpanelAPI.ViewCrawler", "Can't close writer.", localIOException3);
          return;
        }
      }
      finally
      {
      }
      try
      {
        localOutputStreamWriter.close();
        throw localObject;
      }
      catch (IOException localIOException1)
      {
        while (true)
          Log.e("MixpanelAPI.ViewCrawler", "Can't close writer.", localIOException1);
      }
    }

    private void updateEditState()
    {
      ArrayList localArrayList = new ArrayList();
      while (true)
      {
        int j;
        Pair localPair1;
        synchronized (ViewCrawler.this.mPersistentChanges)
        {
          int i = ViewCrawler.this.mPersistentChanges.size();
          j = 0;
          if (j >= i)
            break label145;
          localPair1 = (Pair)ViewCrawler.this.mPersistentChanges.get(j);
        }
        try
        {
          ViewVisitor localViewVisitor1 = ViewCrawler.this.mProtocol.readEdit((JSONObject)localPair1.second);
          localArrayList.add(new Pair(localPair1.first, localViewVisitor1));
          j++;
        }
        catch (EditProtocol.InapplicableInstructionsException localInapplicableInstructionsException1)
        {
          while (true)
            Log.i("MixpanelAPI.ViewCrawler", localInapplicableInstructionsException1.getMessage());
          localObject1 = finally;
          throw localObject1;
        }
        catch (EditProtocol.BadInstructionsException localBadInstructionsException1)
        {
          while (true)
            Log.e("MixpanelAPI.ViewCrawler", "Bad persistent change request cannot be applied.", localBadInstructionsException1);
        }
      }
      while (true)
      {
        label145: int m;
        Pair localPair2;
        synchronized (ViewCrawler.this.mEditorChanges)
        {
          int k = ViewCrawler.this.mEditorChanges.size();
          m = 0;
          if (m >= k)
            break label289;
          localPair2 = (Pair)ViewCrawler.this.mEditorChanges.get(m);
        }
        try
        {
          ViewVisitor localViewVisitor2 = ViewCrawler.this.mProtocol.readEdit((JSONObject)localPair2.second);
          localArrayList.add(new Pair(localPair2.first, localViewVisitor2));
          m++;
        }
        catch (EditProtocol.InapplicableInstructionsException localInapplicableInstructionsException2)
        {
          while (true)
            Log.i("MixpanelAPI.ViewCrawler", localInapplicableInstructionsException2.getMessage());
          localObject2 = finally;
          throw localObject2;
        }
        catch (EditProtocol.BadInstructionsException localBadInstructionsException2)
        {
          while (true)
            Log.e("MixpanelAPI.ViewCrawler", "Bad editor change request cannot be applied.", localBadInstructionsException2);
        }
      }
      while (true)
      {
        label289: int i1;
        Pair localPair3;
        synchronized (ViewCrawler.this.mPersistentEventBindings)
        {
          int n = ViewCrawler.this.mPersistentEventBindings.size();
          i1 = 0;
          if (i1 >= n)
            break label441;
          localPair3 = (Pair)ViewCrawler.this.mPersistentEventBindings.get(i1);
        }
        try
        {
          ViewVisitor localViewVisitor3 = ViewCrawler.this.mProtocol.readEventBinding((JSONObject)localPair3.second, ViewCrawler.this.mTracker);
          localArrayList.add(new Pair(localPair3.first, localViewVisitor3));
          i1++;
        }
        catch (EditProtocol.InapplicableInstructionsException localInapplicableInstructionsException3)
        {
          while (true)
            Log.i("MixpanelAPI.ViewCrawler", localInapplicableInstructionsException3.getMessage());
          localObject3 = finally;
          throw localObject3;
        }
        catch (EditProtocol.BadInstructionsException localBadInstructionsException3)
        {
          while (true)
            Log.e("MixpanelAPI.ViewCrawler", "Bad persistent event binding cannot be applied.", localBadInstructionsException3);
        }
      }
      while (true)
      {
        label441: int i3;
        Pair localPair4;
        synchronized (ViewCrawler.this.mEditorEventBindings)
        {
          int i2 = ViewCrawler.this.mEditorEventBindings.size();
          i3 = 0;
          if (i3 >= i2)
            break label593;
          localPair4 = (Pair)ViewCrawler.this.mEditorEventBindings.get(i3);
        }
        try
        {
          ViewVisitor localViewVisitor4 = ViewCrawler.this.mProtocol.readEventBinding((JSONObject)localPair4.second, ViewCrawler.this.mTracker);
          localArrayList.add(new Pair(localPair4.first, localViewVisitor4));
          i3++;
        }
        catch (EditProtocol.InapplicableInstructionsException localInapplicableInstructionsException4)
        {
          while (true)
            Log.i("MixpanelAPI.ViewCrawler", localInapplicableInstructionsException4.getMessage());
          localObject4 = finally;
          throw localObject4;
        }
        catch (EditProtocol.BadInstructionsException localBadInstructionsException4)
        {
          while (true)
            Log.e("MixpanelAPI.ViewCrawler", "Bad editor event binding cannot be applied.", localBadInstructionsException4);
        }
      }
      label593: HashMap localHashMap = new HashMap();
      int i4 = localArrayList.size();
      int i5 = 0;
      if (i5 < i4)
      {
        Pair localPair5 = (Pair)localArrayList.get(i5);
        Object localObject5;
        if (localHashMap.containsKey(localPair5.first))
          localObject5 = (List)localHashMap.get(localPair5.first);
        while (true)
        {
          ((List)localObject5).add(localPair5.second);
          i5++;
          break;
          localObject5 = new ArrayList();
          localHashMap.put(localPair5.first, localObject5);
        }
      }
      ViewCrawler.this.mEditState.setEdits(localHashMap);
    }

    public void handleMessage(Message paramMessage)
    {
      switch (paramMessage.what)
      {
      case 5:
      case 7:
      default:
        return;
      case 0:
        initializeChanges();
        return;
      case 1:
        connectToEditor();
        return;
      case 4:
        sendDeviceInfo();
        return;
      case 2:
        sendSnapshot((JSONObject)paramMessage.obj);
        return;
      case 9:
        sendReportTrackToEditor((String)paramMessage.obj);
        return;
      case 3:
        handleEditorChangeReceived((JSONObject)paramMessage.obj);
        return;
      case 6:
        handleEventBindingsReceived((JSONArray)paramMessage.obj);
        return;
      case 8:
        handleEditorBindingsReceived((JSONObject)paramMessage.obj);
        return;
      case 10:
      }
      handleEditorClosed();
    }
  }
}