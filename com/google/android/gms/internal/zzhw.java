package com.google.android.gms.internal;

import android.content.ContentResolver;
import android.content.Context;
import android.content.res.Resources;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.provider.Settings.Secure;
import android.util.DisplayMetrics;
import android.util.TypedValue;
import android.view.Display;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.FrameLayout;
import android.widget.FrameLayout.LayoutParams;
import android.widget.TextView;
import com.google.android.gms.common.GooglePlayServicesUtil;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Locale;

@zzgi
public class zzhw
{
  public static final Handler zzzG = new Handler(Looper.getMainLooper());

  private void zza(ViewGroup paramViewGroup, zzba paramzzba, String paramString, int paramInt1, int paramInt2)
  {
    if (paramViewGroup.getChildCount() != 0)
      return;
    Context localContext = paramViewGroup.getContext();
    TextView localTextView = new TextView(localContext);
    localTextView.setGravity(17);
    localTextView.setText(paramString);
    localTextView.setTextColor(paramInt1);
    localTextView.setBackgroundColor(paramInt2);
    FrameLayout localFrameLayout = new FrameLayout(localContext);
    localFrameLayout.setBackgroundColor(paramInt1);
    int i = zzb(localContext, 3);
    localFrameLayout.addView(localTextView, new FrameLayout.LayoutParams(paramzzba.widthPixels - i, paramzzba.heightPixels - i, 17));
    paramViewGroup.addView(localFrameLayout, paramzzba.widthPixels, paramzzba.heightPixels);
  }

  public boolean zzA(Context paramContext)
  {
    return GooglePlayServicesUtil.isGooglePlayServicesAvailable(paramContext) == 0;
  }

  public String zzX(String paramString)
  {
    int i = 0;
    while (i < 2)
      try
      {
        MessageDigest localMessageDigest = MessageDigest.getInstance("MD5");
        localMessageDigest.update(paramString.getBytes());
        Locale localLocale = Locale.US;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = new BigInteger(1, localMessageDigest.digest());
        String str = String.format(localLocale, "%032X", arrayOfObject);
        return str;
      }
      catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
      {
        i++;
      }
    return null;
  }

  public int zza(DisplayMetrics paramDisplayMetrics, int paramInt)
  {
    return (int)TypedValue.applyDimension(1, paramInt, paramDisplayMetrics);
  }

  public void zza(ViewGroup paramViewGroup, zzba paramzzba, String paramString)
  {
    zza(paramViewGroup, paramzzba, paramString, -16777216, -1);
  }

  public void zza(ViewGroup paramViewGroup, zzba paramzzba, String paramString1, String paramString2)
  {
    zzhx.zzac(paramString2);
    zza(paramViewGroup, paramzzba, paramString1, -65536, -16777216);
  }

  public int zzb(Context paramContext, int paramInt)
  {
    return zza(paramContext.getResources().getDisplayMetrics(), paramInt);
  }

  public int zzb(DisplayMetrics paramDisplayMetrics, int paramInt)
  {
    return Math.round(paramInt / paramDisplayMetrics.density);
  }

  public int zzc(Context paramContext, int paramInt)
  {
    Display localDisplay = ((WindowManager)paramContext.getSystemService("window")).getDefaultDisplay();
    DisplayMetrics localDisplayMetrics = new DisplayMetrics();
    localDisplay.getMetrics(localDisplayMetrics);
    return zzb(localDisplayMetrics, paramInt);
  }

  public boolean zzeB()
  {
    return Build.DEVICE.startsWith("generic");
  }

  public boolean zzeC()
  {
    return Looper.myLooper() == Looper.getMainLooper();
  }

  public String zzz(Context paramContext)
  {
    ContentResolver localContentResolver = paramContext.getContentResolver();
    if (localContentResolver == null);
    for (String str = null; ; str = Settings.Secure.getString(localContentResolver, "android_id"))
    {
      if ((str == null) || (zzeB()))
        str = "emulator";
      return zzX(str);
    }
  }
}