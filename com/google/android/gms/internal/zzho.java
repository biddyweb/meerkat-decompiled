package com.google.android.gms.internal;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningTaskInfo;
import android.app.AlertDialog.Builder;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Bundle;
import android.os.Handler;
import android.text.TextUtils;
import android.util.DisplayMetrics;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.PopupWindow;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

@zzgi
public class zzho
{
  private final Object zznh = new Object();
  private String zzyW;
  private boolean zzzq = true;
  private boolean zzzr = false;

  private JSONArray zza(Collection<?> paramCollection)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    Iterator localIterator = paramCollection.iterator();
    while (localIterator.hasNext())
      zza(localJSONArray, localIterator.next());
    return localJSONArray;
  }

  private void zza(JSONArray paramJSONArray, Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof Bundle))
    {
      paramJSONArray.put(zzg((Bundle)paramObject));
      return;
    }
    if ((paramObject instanceof Map))
    {
      paramJSONArray.put(zzw((Map)paramObject));
      return;
    }
    if ((paramObject instanceof Collection))
    {
      paramJSONArray.put(zza((Collection)paramObject));
      return;
    }
    if ((paramObject instanceof Object[]))
    {
      paramJSONArray.put(zza((Object[])paramObject));
      return;
    }
    paramJSONArray.put(paramObject);
  }

  private void zza(JSONObject paramJSONObject, String paramString, Object paramObject)
    throws JSONException
  {
    if ((paramObject instanceof Bundle))
    {
      paramJSONObject.put(paramString, zzg((Bundle)paramObject));
      return;
    }
    if ((paramObject instanceof Map))
    {
      paramJSONObject.put(paramString, zzw((Map)paramObject));
      return;
    }
    if ((paramObject instanceof Collection))
    {
      if (paramString != null);
      while (true)
      {
        paramJSONObject.put(paramString, zza((Collection)paramObject));
        return;
        paramString = "null";
      }
    }
    if ((paramObject instanceof Object[]))
    {
      paramJSONObject.put(paramString, zza(Arrays.asList((Object[])paramObject)));
      return;
    }
    paramJSONObject.put(paramString, paramObject);
  }

  private JSONObject zzg(Bundle paramBundle)
    throws JSONException
  {
    JSONObject localJSONObject = new JSONObject();
    Iterator localIterator = paramBundle.keySet().iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      zza(localJSONObject, str, paramBundle.get(str));
    }
    return localJSONObject;
  }

  public String zzS(String paramString)
  {
    return Uri.parse(paramString).buildUpon().query(null).build().toString();
  }

  public int zzT(String paramString)
  {
    try
    {
      int i = Integer.parseInt(paramString);
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzhx.zzac("Could not parse value:" + localNumberFormatException);
    }
    return 0;
  }

  public boolean zzU(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
      return false;
    return paramString.matches("([^\\s]+(\\.(?i)(jpg|png|gif|bmp|webp))$)");
  }

  public DisplayMetrics zza(WindowManager paramWindowManager)
  {
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    paramWindowManager.getDefaultDisplay().getMetrics(localDisplayMetrics);
    return localDisplayMetrics;
  }

  public PopupWindow zza(View paramView, int paramInt1, int paramInt2, boolean paramBoolean)
  {
    return new PopupWindow(paramView, paramInt1, paramInt2, paramBoolean);
  }

  public String zza(Context paramContext, View paramView, zzba paramzzba)
  {
    if (!((Boolean)zzca.zzqM.get()).booleanValue())
      return null;
    View localView;
    try
    {
      JSONObject localJSONObject1 = new JSONObject();
      JSONObject localJSONObject2 = new JSONObject();
      localJSONObject2.put("width", paramzzba.width);
      localJSONObject2.put("height", paramzzba.height);
      localJSONObject1.put("size", localJSONObject2);
      localJSONObject1.put("activity", zzy(paramContext));
      if (!paramzzba.zzpb)
      {
        JSONArray localJSONArray = new JSONArray();
        if (paramView != null)
        {
          ViewParent localViewParent = paramView.getParent();
          if (localViewParent != null)
          {
            int i = -1;
            if ((localViewParent instanceof ViewGroup))
              i = ((ViewGroup)localViewParent).indexOfChild(paramView);
            JSONObject localJSONObject3 = new JSONObject();
            localJSONObject3.put("type", localViewParent.getClass().getName());
            localJSONObject3.put("index_of_child", i);
            localJSONArray.put(localJSONObject3);
          }
          if ((localViewParent == null) || (!(localViewParent instanceof View)))
            break label249;
          localView = (View)localViewParent;
          break label243;
        }
        if (localJSONArray.length() > 0)
          localJSONObject1.put("parents", localJSONArray);
      }
      String str = localJSONObject1.toString();
      return str;
    }
    catch (JSONException localJSONException)
    {
      zzhx.zzd("Fail to get view hierarchy json", localJSONException);
      return null;
    }
    while (true)
    {
      label243: paramView = localView;
      break;
      label249: localView = null;
    }
  }

  public String zza(Context paramContext, zzk paramzzk, String paramString)
  {
    if (paramzzk == null)
      return paramString;
    try
    {
      Uri localUri = Uri.parse(paramString);
      if (paramzzk.zzc(localUri))
        localUri = paramzzk.zza(localUri, paramContext);
      String str = localUri.toString();
      return str;
    }
    catch (Exception localException)
    {
    }
    return paramString;
  }

  public String zza(InputStreamReader paramInputStreamReader)
    throws IOException
  {
    StringBuilder localStringBuilder = new StringBuilder(8192);
    char[] arrayOfChar = new char[2048];
    while (true)
    {
      int i = paramInputStreamReader.read(arrayOfChar);
      if (i == -1)
        break;
      localStringBuilder.append(arrayOfChar, 0, i);
    }
    return localStringBuilder.toString();
  }

  JSONArray zza(Object[] paramArrayOfObject)
    throws JSONException
  {
    JSONArray localJSONArray = new JSONArray();
    int i = paramArrayOfObject.length;
    for (int j = 0; j < i; j++)
      zza(localJSONArray, paramArrayOfObject[j]);
    return localJSONArray;
  }

  public void zza(Activity paramActivity, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
  {
    Window localWindow = paramActivity.getWindow();
    if ((localWindow != null) && (localWindow.getDecorView() != null) && (localWindow.getDecorView().getViewTreeObserver() != null))
      localWindow.getDecorView().getViewTreeObserver().addOnGlobalLayoutListener(paramOnGlobalLayoutListener);
  }

  public void zza(Context paramContext, String paramString, WebSettings paramWebSettings)
  {
    paramWebSettings.setUserAgentString(zze(paramContext, paramString));
  }

  public void zza(Context paramContext, String paramString, List<String> paramList)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      new zzhu(paramContext, paramString, (String)localIterator.next()).start();
  }

  public void zza(Context paramContext, String paramString1, List<String> paramList, String paramString2)
  {
    Iterator localIterator = paramList.iterator();
    while (localIterator.hasNext())
      new zzhu(paramContext, paramString1, (String)localIterator.next(), paramString2).start();
  }

  public void zza(Context paramContext, String paramString, boolean paramBoolean, HttpURLConnection paramHttpURLConnection)
  {
    zza(paramContext, paramString, paramBoolean, paramHttpURLConnection, false);
  }

  public void zza(Context paramContext, String paramString1, boolean paramBoolean, HttpURLConnection paramHttpURLConnection, String paramString2)
  {
    paramHttpURLConnection.setConnectTimeout(60000);
    paramHttpURLConnection.setInstanceFollowRedirects(paramBoolean);
    paramHttpURLConnection.setReadTimeout(60000);
    paramHttpURLConnection.setRequestProperty("User-Agent", paramString2);
    paramHttpURLConnection.setUseCaches(false);
  }

  public void zza(Context paramContext, String paramString, boolean paramBoolean1, HttpURLConnection paramHttpURLConnection, boolean paramBoolean2)
  {
    paramHttpURLConnection.setConnectTimeout(60000);
    paramHttpURLConnection.setInstanceFollowRedirects(paramBoolean1);
    paramHttpURLConnection.setReadTimeout(60000);
    paramHttpURLConnection.setRequestProperty("User-Agent", zze(paramContext, paramString));
    paramHttpURLConnection.setUseCaches(paramBoolean2);
  }

  public boolean zza(PackageManager paramPackageManager, String paramString1, String paramString2)
  {
    return paramPackageManager.checkPermission(paramString2, paramString1) == 0;
  }

  public boolean zza(ClassLoader paramClassLoader, Class<?> paramClass, String paramString)
  {
    try
    {
      boolean bool = paramClass.isAssignableFrom(Class.forName(paramString, false, paramClassLoader));
      return bool;
    }
    catch (Throwable localThrowable)
    {
    }
    return false;
  }

  public String zzb(zzic paramzzic, String paramString)
  {
    return zza(paramzzic.getContext(), paramzzic.zzeI(), paramString);
  }

  public void zzc(Context paramContext, String paramString1, String paramString2)
  {
    ArrayList localArrayList = new ArrayList();
    localArrayList.add(paramString2);
    zza(paramContext, paramString1, localArrayList);
  }

  public Map<String, String> zzd(Uri paramUri)
  {
    if (paramUri == null)
      return null;
    HashMap localHashMap = new HashMap();
    Iterator localIterator = zzab.zzaO().zze(paramUri).iterator();
    while (localIterator.hasNext())
    {
      String str = (String)localIterator.next();
      localHashMap.put(str, paramUri.getQueryParameter(str));
    }
    return localHashMap;
  }

  public String zze(Context paramContext, String paramString)
  {
    synchronized (this.zznh)
    {
      if (this.zzyW != null)
      {
        String str3 = this.zzyW;
        return str3;
      }
    }
    try
    {
      this.zzyW = zzab.zzaO().getDefaultUserAgent(paramContext);
      label36: if (TextUtils.isEmpty(this.zzyW))
        if (!zzbe.zzbD().zzeC())
        {
          this.zzyW = null;
          zzhw.zzzG.post(new zzho.1(this, paramContext));
          while (true)
          {
            String str2 = this.zzyW;
            if (str2 != null)
              break;
            try
            {
              this.zznh.wait();
            }
            catch (InterruptedException localInterruptedException)
            {
              this.zzyW = zzet();
              zzhx.zzac("Interrupted, use default user agent: " + this.zzyW);
            }
          }
          localObject2 = finally;
          throw localObject2;
        }
      try
      {
        this.zzyW = zzv(paramContext);
        this.zzyW = (this.zzyW + " (Mobile; " + paramString + ")");
        String str1 = this.zzyW;
        return str1;
      }
      catch (Exception localException2)
      {
        while (true)
          this.zzyW = zzet();
      }
    }
    catch (Exception localException1)
    {
      break label36;
    }
  }

  public boolean zzes()
  {
    return this.zzzq;
  }

  String zzet()
  {
    StringBuffer localStringBuffer = new StringBuffer(256);
    localStringBuffer.append("Mozilla/5.0 (Linux; U; Android");
    if (Build.VERSION.RELEASE != null)
      localStringBuffer.append(" ").append(Build.VERSION.RELEASE);
    localStringBuffer.append("; ").append(Locale.getDefault());
    if (Build.DEVICE != null)
    {
      localStringBuffer.append("; ").append(Build.DEVICE);
      if (Build.DISPLAY != null)
        localStringBuffer.append(" Build/").append(Build.DISPLAY);
    }
    localStringBuffer.append(") AppleWebKit/533 Version/4.0 Safari/533");
    return localStringBuffer.toString();
  }

  public String zzeu()
  {
    UUID localUUID = UUID.randomUUID();
    byte[] arrayOfByte1 = BigInteger.valueOf(localUUID.getLeastSignificantBits()).toByteArray();
    byte[] arrayOfByte2 = BigInteger.valueOf(localUUID.getMostSignificantBits()).toByteArray();
    Object localObject = new BigInteger(1, arrayOfByte1).toString();
    int i = 0;
    while (true)
    {
      if (i < 2);
      try
      {
        MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
        localMessageDigest.update(arrayOfByte1);
        localMessageDigest.update(arrayOfByte2);
        byte[] arrayOfByte3 = new byte[8];
        System.arraycopy(localMessageDigest.digest(), 0, arrayOfByte3, 0, 8);
        String str = new BigInteger(1, arrayOfByte3).toString();
        localObject = str;
        label108: i++;
        continue;
        return localObject;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        break label108;
      }
    }
  }

  public String zzev()
  {
    String str1 = Build.MANUFACTURER;
    String str2 = Build.MODEL;
    if (str2.startsWith(str1))
      return str2;
    return str1 + " " + str2;
  }

  protected int[] zzew()
  {
    return new int[] { 0, 0 };
  }

  public int[] zzg(Activity paramActivity)
  {
    Window localWindow = paramActivity.getWindow();
    if (localWindow != null)
    {
      View localView = localWindow.findViewById(16908290);
      if (localView != null)
      {
        int[] arrayOfInt = new int[2];
        arrayOfInt[0] = localView.getWidth();
        arrayOfInt[1] = localView.getHeight();
        return arrayOfInt;
      }
    }
    return zzew();
  }

  public Bitmap zzh(View paramView)
  {
    paramView.setDrawingCacheEnabled(true);
    Bitmap localBitmap = Bitmap.createBitmap(paramView.getDrawingCache());
    paramView.setDrawingCacheEnabled(false);
    return localBitmap;
  }

  public int[] zzh(Activity paramActivity)
  {
    int[] arrayOfInt1 = zzg(paramActivity);
    int[] arrayOfInt2 = new int[2];
    arrayOfInt2[0] = zzbe.zzbD().zzc(paramActivity, arrayOfInt1[0]);
    arrayOfInt2[1] = zzbe.zzbD().zzc(paramActivity, arrayOfInt1[1]);
    return arrayOfInt2;
  }

  public int[] zzi(Activity paramActivity)
  {
    Window localWindow = paramActivity.getWindow();
    if (localWindow != null)
    {
      View localView = localWindow.findViewById(16908290);
      if (localView != null)
      {
        int[] arrayOfInt = new int[2];
        arrayOfInt[0] = localView.getTop();
        arrayOfInt[1] = localView.getBottom();
        return arrayOfInt;
      }
    }
    return zzew();
  }

  public int[] zzj(Activity paramActivity)
  {
    int[] arrayOfInt1 = zzi(paramActivity);
    int[] arrayOfInt2 = new int[2];
    arrayOfInt2[0] = zzbe.zzbD().zzc(paramActivity, arrayOfInt1[0]);
    arrayOfInt2[1] = zzbe.zzbD().zzc(paramActivity, arrayOfInt1[1]);
    return arrayOfInt2;
  }

  public int zzk(Activity paramActivity)
  {
    if (paramActivity == null)
    {
      zzhx.zzac("Fail to get AdActivity type since it is null");
      return 0;
    }
    zzeo localzzeo = zzeo.zzb(paramActivity.getIntent());
    if (localzzeo == null)
    {
      zzhx.zzac("Fail to get AdOverlayInfo");
      return 0;
    }
    switch (localzzeo.zzuw)
    {
    default:
      return 0;
    case 1:
      return 1;
    case 2:
      return 2;
    case 3:
    }
    return 3;
  }

  public boolean zzt(Context paramContext)
  {
    Intent localIntent = new Intent();
    localIntent.setClassName(paramContext, "com.google.android.gms.ads.AdActivity");
    ResolveInfo localResolveInfo = paramContext.getPackageManager().resolveActivity(localIntent, 65536);
    if ((localResolveInfo == null) || (localResolveInfo.activityInfo == null))
    {
      zzhx.zzac("Could not find com.google.android.gms.ads.AdActivity, please make sure it is declared in AndroidManifest.xml.");
      return false;
    }
    if ((0x10 & localResolveInfo.activityInfo.configChanges) == 0)
      zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "keyboard" }));
    for (boolean bool = false; ; bool = true)
    {
      if ((0x20 & localResolveInfo.activityInfo.configChanges) == 0)
      {
        zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "keyboardHidden" }));
        bool = false;
      }
      if ((0x80 & localResolveInfo.activityInfo.configChanges) == 0)
      {
        zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "orientation" }));
        bool = false;
      }
      if ((0x100 & localResolveInfo.activityInfo.configChanges) == 0)
      {
        zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "screenLayout" }));
        bool = false;
      }
      if ((0x200 & localResolveInfo.activityInfo.configChanges) == 0)
      {
        zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "uiMode" }));
        bool = false;
      }
      if ((0x400 & localResolveInfo.activityInfo.configChanges) == 0)
      {
        zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "screenSize" }));
        bool = false;
      }
      if ((0x800 & localResolveInfo.activityInfo.configChanges) == 0)
      {
        zzhx.zzac(String.format("com.google.android.gms.ads.AdActivity requires the android:configChanges value to contain \"%s\".", new Object[] { "smallestScreenSize" }));
        return false;
      }
      return bool;
    }
  }

  public boolean zzu(Context paramContext)
  {
    if (this.zzzr)
      return false;
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("android.intent.action.USER_PRESENT");
    localIntentFilter.addAction("android.intent.action.SCREEN_OFF");
    paramContext.getApplicationContext().registerReceiver(new zzho.zza(this, null), localIntentFilter);
    this.zzzr = true;
    return true;
  }

  protected String zzv(Context paramContext)
  {
    return new WebView(paramContext).getSettings().getUserAgentString();
  }

  public AlertDialog.Builder zzw(Context paramContext)
  {
    return new AlertDialog.Builder(paramContext);
  }

  public JSONObject zzw(Map<String, ?> paramMap)
    throws JSONException
  {
    JSONObject localJSONObject;
    try
    {
      localJSONObject = new JSONObject();
      Iterator localIterator = paramMap.keySet().iterator();
      while (localIterator.hasNext())
      {
        String str = (String)localIterator.next();
        zza(localJSONObject, str, paramMap.get(str));
      }
    }
    catch (ClassCastException localClassCastException)
    {
      throw new JSONException("Could not convert map to JSON: " + localClassCastException.getMessage());
    }
    return localJSONObject;
  }

  public zzbu zzx(Context paramContext)
  {
    return new zzbu(paramContext);
  }

  public String zzy(Context paramContext)
  {
    ActivityManager localActivityManager = (ActivityManager)paramContext.getSystemService("activity");
    if (localActivityManager == null)
      return null;
    List localList = localActivityManager.getRunningTasks(1);
    if ((localList != null) && (!localList.isEmpty()))
    {
      ActivityManager.RunningTaskInfo localRunningTaskInfo = (ActivityManager.RunningTaskInfo)localList.get(0);
      if ((localRunningTaskInfo != null) && (localRunningTaskInfo.topActivity != null))
        return localRunningTaskInfo.topActivity.getClassName();
    }
    return null;
  }
}