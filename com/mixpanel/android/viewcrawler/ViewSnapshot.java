package com.mixpanel.android.viewcrawler;

import android.annotation.TargetApi;
import android.app.Activity;
import android.graphics.Bitmap;
import android.graphics.Bitmap.CompressFormat;
import android.graphics.Bitmap.Config;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.os.Build.VERSION;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64OutputStream;
import android.util.DisplayMetrics;
import android.util.JsonWriter;
import android.util.Log;
import android.util.LruCache;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import com.mixpanel.android.mpmetrics.MPConfig;
import com.mixpanel.android.mpmetrics.ResourceIds;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.json.JSONObject;

@TargetApi(16)
class ViewSnapshot
{
  private static final String LOGTAG = "MixpanelAPI.ViewSnapshot";
  private static final int MAX_CLASS_NAME_CACHE_SIZE = 255;
  private final ClassNameCache mClassnameCache;
  private final Handler mMainThreadHandler;
  private final List<PropertyDescription> mProperties;
  private final ResourceIds mResourceIds;
  private final RootViewFinder mRootViewFinder;

  public ViewSnapshot(List<PropertyDescription> paramList, ResourceIds paramResourceIds)
  {
    this.mProperties = paramList;
    this.mResourceIds = paramResourceIds;
    this.mMainThreadHandler = new Handler(Looper.getMainLooper());
    this.mRootViewFinder = new RootViewFinder();
    this.mClassnameCache = new ClassNameCache(255);
  }

  private void addProperties(JsonWriter paramJsonWriter, View paramView)
    throws IOException
  {
    Class localClass = paramView.getClass();
    Iterator localIterator = this.mProperties.iterator();
    while (localIterator.hasNext())
    {
      PropertyDescription localPropertyDescription = (PropertyDescription)localIterator.next();
      if ((localPropertyDescription.targetClass.isAssignableFrom(localClass)) && (localPropertyDescription.accessor != null))
      {
        Object localObject = localPropertyDescription.accessor.applyMethod(paramView);
        if (localObject != null)
          if ((localObject instanceof Number))
            paramJsonWriter.name(localPropertyDescription.name).value((Number)localObject);
          else if ((localObject instanceof Boolean))
            paramJsonWriter.name(localPropertyDescription.name).value(((Boolean)localObject).booleanValue());
          else
            paramJsonWriter.name(localPropertyDescription.name).value(localObject.toString());
      }
    }
  }

  private void snapshotView(JsonWriter paramJsonWriter, View paramView)
    throws IOException
  {
    int i = paramView.getId();
    String str;
    CharSequence localCharSequence;
    label78: Object localObject;
    if (-1 == i)
    {
      str = null;
      paramJsonWriter.beginObject();
      paramJsonWriter.name("hashCode").value(paramView.hashCode());
      paramJsonWriter.name("id").value(i);
      paramJsonWriter.name("mp_id_name").value(str);
      localCharSequence = paramView.getContentDescription();
      if (localCharSequence != null)
        break label413;
      paramJsonWriter.name("contentDescription").nullValue();
      localObject = paramView.getTag();
      if (localObject != null)
        break label433;
      paramJsonWriter.name("tag").nullValue();
    }
    while (true)
    {
      paramJsonWriter.name("top").value(paramView.getTop());
      paramJsonWriter.name("left").value(paramView.getLeft());
      paramJsonWriter.name("width").value(paramView.getWidth());
      paramJsonWriter.name("height").value(paramView.getHeight());
      paramJsonWriter.name("scrollX").value(paramView.getScrollX());
      paramJsonWriter.name("scrollY").value(paramView.getScrollY());
      paramJsonWriter.name("visibility").value(paramView.getVisibility());
      int j = Build.VERSION.SDK_INT;
      float f1 = 0.0F;
      float f2 = 0.0F;
      if (j >= 11)
      {
        f1 = paramView.getTranslationX();
        f2 = paramView.getTranslationY();
      }
      paramJsonWriter.name("translationX").value(f1);
      paramJsonWriter.name("translationY").value(f2);
      paramJsonWriter.name("classes");
      paramJsonWriter.beginArray();
      Class localClass = paramView.getClass();
      do
      {
        paramJsonWriter.value((String)this.mClassnameCache.get(localClass));
        localClass = localClass.getSuperclass();
      }
      while ((localClass != Object.class) && (localClass != null));
      paramJsonWriter.endArray();
      addProperties(paramJsonWriter, paramView);
      paramJsonWriter.name("subviews");
      paramJsonWriter.beginArray();
      if (!(paramView instanceof ViewGroup))
        break label459;
      ViewGroup localViewGroup2 = (ViewGroup)paramView;
      int n = localViewGroup2.getChildCount();
      for (int i1 = 0; i1 < n; i1++)
      {
        View localView2 = localViewGroup2.getChildAt(i1);
        if (localView2 != null)
          paramJsonWriter.value(localView2.hashCode());
      }
      str = this.mResourceIds.nameForId(i);
      break;
      label413: paramJsonWriter.name("contentDescription").value(localCharSequence.toString());
      break label78;
      label433: if ((localObject instanceof CharSequence))
        paramJsonWriter.name("tag").value(localObject.toString());
    }
    label459: paramJsonWriter.endArray();
    paramJsonWriter.endObject();
    if ((paramView instanceof ViewGroup))
    {
      ViewGroup localViewGroup1 = (ViewGroup)paramView;
      int k = localViewGroup1.getChildCount();
      for (int m = 0; m < k; m++)
      {
        View localView1 = localViewGroup1.getChildAt(m);
        if (localView1 != null)
          snapshotView(paramJsonWriter, localView1);
      }
    }
  }

  List<PropertyDescription> getProperties()
  {
    return this.mProperties;
  }

  void snapshotViewHierarchy(JsonWriter paramJsonWriter, View paramView)
    throws IOException
  {
    paramJsonWriter.beginArray();
    snapshotView(paramJsonWriter, paramView);
    paramJsonWriter.endArray();
  }

  public void snapshots(UIThreadSet<Activity> paramUIThreadSet, OutputStream paramOutputStream)
    throws IOException
  {
    this.mRootViewFinder.findInActivities(paramUIThreadSet);
    FutureTask localFutureTask = new FutureTask(this.mRootViewFinder);
    this.mMainThreadHandler.post(localFutureTask);
    OutputStreamWriter localOutputStreamWriter = new OutputStreamWriter(paramOutputStream);
    try
    {
      List localList = (List)localFutureTask.get(1L, TimeUnit.SECONDS);
      int i = localList.size();
      localOutputStreamWriter.write("[");
      for (int j = 0; j < i; j++)
      {
        if (j > 0)
          localOutputStreamWriter.write(",");
        RootViewInfo localRootViewInfo = (RootViewInfo)localList.get(j);
        localOutputStreamWriter.write("{");
        localOutputStreamWriter.write("\"activity\":");
        localOutputStreamWriter.write(JSONObject.quote(localRootViewInfo.activityName));
        localOutputStreamWriter.write(",");
        localOutputStreamWriter.write("\"scale\":");
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Float.valueOf(localRootViewInfo.scale);
        localOutputStreamWriter.write(String.format("%s", arrayOfObject));
        localOutputStreamWriter.write(",");
        localOutputStreamWriter.write("\"serialized_objects\":");
        JsonWriter localJsonWriter = new JsonWriter(localOutputStreamWriter);
        localJsonWriter.beginObject();
        localJsonWriter.name("rootObject").value(localRootViewInfo.rootView.hashCode());
        localJsonWriter.name("objects");
        snapshotViewHierarchy(localJsonWriter, localRootViewInfo.rootView);
        localJsonWriter.endObject();
        localJsonWriter.flush();
        localOutputStreamWriter.write(",");
        localOutputStreamWriter.write("\"screenshot\":");
        localOutputStreamWriter.flush();
        localRootViewInfo.screenshot.writeBitmapJSON(Bitmap.CompressFormat.PNG, 100, paramOutputStream);
        localOutputStreamWriter.write("}");
      }
      localOutputStreamWriter.write("]");
      localOutputStreamWriter.flush();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      while (!MPConfig.DEBUG);
      Log.d("MixpanelAPI.ViewSnapshot", "Screenshot interrupted, no screenshot will be sent.", localInterruptedException);
      return;
    }
    catch (TimeoutException localTimeoutException)
    {
      while (!MPConfig.DEBUG);
      Log.i("MixpanelAPI.ViewSnapshot", "Screenshot took more than 1 second to be scheduled and executed. No screenshot will be sent.", localTimeoutException);
      return;
    }
    catch (ExecutionException localExecutionException)
    {
      while (!MPConfig.DEBUG);
      Log.e("MixpanelAPI.ViewSnapshot", "Exception thrown during screenshot attempt", localExecutionException);
    }
  }

  private static class CachedBitmap
  {
    private Bitmap mCached = null;
    private final Paint mPaint = new Paint(2);

    public void recreate(int paramInt1, int paramInt2, int paramInt3, Bitmap paramBitmap)
    {
      try
      {
        if ((this.mCached != null) && (this.mCached.getWidth() == paramInt1))
        {
          int i = this.mCached.getHeight();
          if (i == paramInt2)
            break label62;
        }
        try
        {
          this.mCached = Bitmap.createBitmap(paramInt1, paramInt2, Bitmap.Config.RGB_565);
          if (this.mCached != null)
            this.mCached.setDensity(paramInt3);
          label62: if (this.mCached != null)
            new Canvas(this.mCached).drawBitmap(paramBitmap, 0.0F, 0.0F, this.mPaint);
          return;
        }
        catch (OutOfMemoryError localOutOfMemoryError)
        {
          while (true)
            this.mCached = null;
        }
      }
      finally
      {
      }
    }

    public void writeBitmapJSON(Bitmap.CompressFormat paramCompressFormat, int paramInt, OutputStream paramOutputStream)
      throws IOException
    {
      try
      {
        if ((this.mCached == null) || (this.mCached.getWidth() == 0) || (this.mCached.getHeight() == 0))
          paramOutputStream.write("null".getBytes());
        while (true)
        {
          return;
          paramOutputStream.write(34);
          Base64OutputStream localBase64OutputStream = new Base64OutputStream(paramOutputStream, 2);
          this.mCached.compress(Bitmap.CompressFormat.PNG, 100, localBase64OutputStream);
          localBase64OutputStream.flush();
          paramOutputStream.write(34);
        }
      }
      finally
      {
      }
    }
  }

  private static class ClassNameCache extends LruCache<Class<?>, String>
  {
    public ClassNameCache(int paramInt)
    {
      super();
    }

    protected String create(Class<?> paramClass)
    {
      return paramClass.getCanonicalName();
    }
  }

  private static class RootViewFinder
    implements Callable<List<ViewSnapshot.RootViewInfo>>
  {
    private final ViewSnapshot.CachedBitmap mCachedBitmap = new ViewSnapshot.CachedBitmap();
    private final int mClientDensity = 160;
    private final DisplayMetrics mDisplayMetrics = new DisplayMetrics();
    private UIThreadSet<Activity> mLiveActivities;
    private final List<ViewSnapshot.RootViewInfo> mRootViews = new ArrayList();

    // ERROR //
    private void takeScreenshot(ViewSnapshot.RootViewInfo paramRootViewInfo)
    {
      // Byte code:
      //   0: aload_1
      //   1: getfield 60\011com/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo:rootView\011Landroid/view/View;
      //   4: astore_2
      //   5: iconst_3
      //   6: anewarray 62\011java/lang/Class
      //   9: astore 25
      //   11: aload 25
      //   13: iconst_0
      //   14: ldc 64
      //   16: aastore
      //   17: aload 25
      //   19: iconst_1
      //   20: getstatic 70\011java/lang/Integer:TYPE\011Ljava/lang/Class;
      //   23: aastore
      //   24: aload 25
      //   26: iconst_2
      //   27: getstatic 73\011java/lang/Boolean:TYPE\011Ljava/lang/Class;
      //   30: aastore
      //   31: ldc 75
      //   33: ldc 77
      //   35: aload 25
      //   37: invokevirtual 81\011java/lang/Class:getDeclaredMethod\011(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
      //   40: astore 26
      //   42: aload 26
      //   44: iconst_1
      //   45: invokevirtual 87\011java/lang/reflect/Method:setAccessible\011(Z)V
      //   48: iconst_3
      //   49: anewarray 5\011java/lang/Object
      //   52: astore 27
      //   54: aload 27
      //   56: iconst_0
      //   57: getstatic 91\011android/graphics/Bitmap$Config:RGB_565\011Landroid/graphics/Bitmap$Config;
      //   60: aastore
      //   61: aload 27
      //   63: iconst_1
      //   64: iconst_m1
      //   65: invokestatic 95\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
      //   68: aastore
      //   69: aload 27
      //   71: iconst_2
      //   72: iconst_0
      //   73: invokestatic 98\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
      //   76: aastore
      //   77: aload 26
      //   79: aload_2
      //   80: aload 27
      //   82: invokevirtual 102\011java/lang/reflect/Method:invoke\011(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
      //   85: checkcast 104\011android/graphics/Bitmap
      //   88: astore 5
      //   90: aconst_null
      //   91: astore 6
      //   93: aload 5
      //   95: ifnonnull +32 -> 127
      //   98: aload_2
      //   99: invokevirtual 108\011android/view/View:isDrawingCacheEnabled\011()Z
      //   102: invokestatic 98\011java/lang/Boolean:valueOf\011(Z)Ljava/lang/Boolean;
      //   105: astore 6
      //   107: aload_2
      //   108: iconst_1
      //   109: invokevirtual 111\011android/view/View:setDrawingCacheEnabled\011(Z)V
      //   112: aload_2
      //   113: iconst_1
      //   114: invokevirtual 114\011android/view/View:buildDrawingCache\011(Z)V
      //   117: aload_2
      //   118: invokevirtual 118\011android/view/View:getDrawingCache\011()Landroid/graphics/Bitmap;
      //   121: astore 15
      //   123: aload 15
      //   125: astore 5
      //   127: fconst_1
      //   128: fstore 7
      //   130: aload 5
      //   132: ifnull +107 -> 239
      //   135: aload 5
      //   137: invokevirtual 122\011android/graphics/Bitmap:getDensity\011()I
      //   140: istore 8
      //   142: iload 8
      //   144: ifeq +11 -> 155
      //   147: ldc 123
      //   149: iload 8
      //   151: i2f
      //   152: fdiv
      //   153: fstore 7
      //   155: aload 5
      //   157: invokevirtual 126\011android/graphics/Bitmap:getWidth\011()I
      //   160: istore 9
      //   162: aload 5
      //   164: invokevirtual 129\011android/graphics/Bitmap:getHeight\011()I
      //   167: istore 10
      //   169: ldc2_w 130
      //   172: fload 7
      //   174: aload 5
      //   176: invokevirtual 126\011android/graphics/Bitmap:getWidth\011()I
      //   179: i2f
      //   180: fmul
      //   181: f2d
      //   182: dadd
      //   183: d2i
      //   184: istore 11
      //   186: ldc2_w 130
      //   189: fload 7
      //   191: aload 5
      //   193: invokevirtual 129\011android/graphics/Bitmap:getHeight\011()I
      //   196: i2f
      //   197: fmul
      //   198: f2d
      //   199: dadd
      //   200: d2i
      //   201: istore 12
      //   203: iload 9
      //   205: ifle +34 -> 239
      //   208: iload 10
      //   210: ifle +29 -> 239
      //   213: iload 11
      //   215: ifle +24 -> 239
      //   218: iload 12
      //   220: ifle +19 -> 239
      //   223: aload_0
      //   224: getfield 40\011com/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder:mCachedBitmap\011Lcom/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap;
      //   227: iload 11
      //   229: iload 12
      //   231: sipush 160
      //   234: aload 5
      //   236: invokevirtual 135\011com/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap:recreate\011(IIILandroid/graphics/Bitmap;)V
      //   239: aload 6
      //   241: ifnull +16 -> 257
      //   244: aload 6
      //   246: invokevirtual 138\011java/lang/Boolean:booleanValue\011()Z
      //   249: ifne +8 -> 257
      //   252: aload_2
      //   253: iconst_0
      //   254: invokevirtual 111\011android/view/View:setDrawingCacheEnabled\011(Z)V
      //   257: aload_1
      //   258: fload 7
      //   260: putfield 142\011com/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo:scale\011F
      //   263: aload_1
      //   264: aload_0
      //   265: getfield 40\011com/mixpanel/android/viewcrawler/ViewSnapshot$RootViewFinder:mCachedBitmap\011Lcom/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap;
      //   268: putfield 145\011com/mixpanel/android/viewcrawler/ViewSnapshot$RootViewInfo:screenshot\011Lcom/mixpanel/android/viewcrawler/ViewSnapshot$CachedBitmap;
      //   271: return
      //   272: astore 22
      //   274: getstatic 151\011com/mixpanel/android/mpmetrics/MPConfig:DEBUG\011Z
      //   277: istore 23
      //   279: aconst_null
      //   280: astore 5
      //   282: iload 23
      //   284: ifeq -194 -> 90
      //   287: ldc 153
      //   289: ldc 155
      //   291: aload 22
      //   293: invokestatic 161\011android/util/Log:v\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   296: pop
      //   297: aconst_null
      //   298: astore 5
      //   300: goto -210 -> 90
      //   303: astore 20
      //   305: ldc 153
      //   307: ldc 163
      //   309: aload 20
      //   311: invokestatic 166\011android/util/Log:d\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   314: pop
      //   315: aconst_null
      //   316: astore 5
      //   318: goto -228 -> 90
      //   321: astore 18
      //   323: ldc 153
      //   325: ldc 168
      //   327: aload 18
      //   329: invokestatic 171\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   332: pop
      //   333: aconst_null
      //   334: astore 5
      //   336: goto -246 -> 90
      //   339: astore 16
      //   341: ldc 153
      //   343: ldc 173
      //   345: aload 16
      //   347: invokestatic 171\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   350: pop
      //   351: aconst_null
      //   352: astore 5
      //   354: goto -264 -> 90
      //   357: astore_3
      //   358: ldc 153
      //   360: ldc 175
      //   362: aload_3
      //   363: invokestatic 171\011android/util/Log:e\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   366: pop
      //   367: aconst_null
      //   368: astore 5
      //   370: goto -280 -> 90
      //   373: astore 13
      //   375: getstatic 151\011com/mixpanel/android/mpmetrics/MPConfig:DEBUG\011Z
      //   378: ifeq -251 -> 127
      //   381: ldc 153
      //   383: new 177\011java/lang/StringBuilder
      //   386: dup
      //   387: invokespecial 178\011java/lang/StringBuilder:<init>\011()V
      //   390: ldc 180
      //   392: invokevirtual 184\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   395: aload_2
      //   396: invokevirtual 187\011java/lang/StringBuilder:append\011(Ljava/lang/Object;)Ljava/lang/StringBuilder;
      //   399: ldc 189
      //   401: invokevirtual 184\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
      //   404: invokevirtual 193\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
      //   407: aload 13
      //   409: invokestatic 161\011android/util/Log:v\011(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
      //   412: pop
      //   413: goto -286 -> 127
      //
      // Exception table:
      //   from\011to\011target\011type
      //   5\01190\011272\011java/lang/NoSuchMethodException
      //   5\01190\011303\011java/lang/IllegalArgumentException
      //   5\01190\011321\011java/lang/reflect/InvocationTargetException
      //   5\01190\011339\011java/lang/IllegalAccessException
      //   5\01190\011357\011java/lang/ClassCastException
      //   98\011123\011373\011java/lang/RuntimeException
    }

    public List<ViewSnapshot.RootViewInfo> call()
      throws Exception
    {
      this.mRootViews.clear();
      Iterator localIterator = this.mLiveActivities.getAll().iterator();
      while (localIterator.hasNext())
      {
        Activity localActivity = (Activity)localIterator.next();
        String str = localActivity.getClass().getCanonicalName();
        View localView = localActivity.getWindow().getDecorView().getRootView();
        localActivity.getWindowManager().getDefaultDisplay().getMetrics(this.mDisplayMetrics);
        ViewSnapshot.RootViewInfo localRootViewInfo = new ViewSnapshot.RootViewInfo(str, localView);
        this.mRootViews.add(localRootViewInfo);
      }
      int i = this.mRootViews.size();
      for (int j = 0; j < i; j++)
        takeScreenshot((ViewSnapshot.RootViewInfo)this.mRootViews.get(j));
      return this.mRootViews;
    }

    public void findInActivities(UIThreadSet<Activity> paramUIThreadSet)
    {
      this.mLiveActivities = paramUIThreadSet;
    }
  }

  private static class RootViewInfo
  {
    public final String activityName;
    public final View rootView;
    public float scale;
    public ViewSnapshot.CachedBitmap screenshot;

    public RootViewInfo(String paramString, View paramView)
    {
      this.activityName = paramString;
      this.rootView = paramView;
      this.screenshot = null;
      this.scale = 1.0F;
    }
  }
}