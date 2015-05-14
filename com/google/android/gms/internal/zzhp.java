package com.google.android.gms.internal;

import android.app.Activity;
import android.app.DownloadManager.Request;
import android.content.Context;
import android.net.Uri;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.Window;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import java.util.Collections;
import java.util.LinkedHashSet;
import java.util.Set;

@zzgi
public class zzhp
{
  public static zzhp zzz(int paramInt)
  {
    if (paramInt >= 19)
      return new zzhp.zzg();
    if (paramInt >= 18)
      return new zzhp.zze();
    if (paramInt >= 17)
      return new zzhp.zzd();
    if (paramInt >= 16)
      return new zzhp.zzf();
    if (paramInt >= 14)
      return new zzhp.zzc();
    if (paramInt >= 11)
      return new zzhp.zzb();
    if (paramInt >= 9)
      return new zzhp.zza();
    return new zzhp();
  }

  public String getDefaultUserAgent(Context paramContext)
  {
    return "";
  }

  public boolean zza(DownloadManager.Request paramRequest)
  {
    return false;
  }

  public boolean zza(Context paramContext, WebSettings paramWebSettings)
  {
    return false;
  }

  public boolean zza(Window paramWindow)
  {
    return false;
  }

  public boolean zza(WebView paramWebView)
  {
    return false;
  }

  public WebChromeClient zzb(zzic paramzzic)
  {
    return null;
  }

  public zzid zzb(zzic paramzzic, boolean paramBoolean)
  {
    return new zzid(paramzzic, paramBoolean);
  }

  public void zzb(Activity paramActivity, ViewTreeObserver.OnGlobalLayoutListener paramOnGlobalLayoutListener)
  {
    Window localWindow = paramActivity.getWindow();
    if ((localWindow != null) && (localWindow.getDecorView() != null) && (localWindow.getDecorView().getViewTreeObserver() != null))
      localWindow.getDecorView().getViewTreeObserver().removeGlobalOnLayoutListener(paramOnGlobalLayoutListener);
  }

  public boolean zzb(WebView paramWebView)
  {
    return false;
  }

  public Set<String> zze(Uri paramUri)
  {
    if (paramUri.isOpaque())
      return Collections.emptySet();
    String str = paramUri.getEncodedQuery();
    if (str == null)
      return Collections.emptySet();
    LinkedHashSet localLinkedHashSet = new LinkedHashSet();
    int i = 0;
    do
    {
      int j = str.indexOf('&', i);
      if (j == -1)
        j = str.length();
      int k = str.indexOf('=', i);
      if ((k > j) || (k == -1))
        k = j;
      localLinkedHashSet.add(Uri.decode(str.substring(i, k)));
      i = j + 1;
    }
    while (i < str.length());
    return Collections.unmodifiableSet(localLinkedHashSet);
  }

  public int zzex()
  {
    return 0;
  }

  public int zzey()
  {
    return 1;
  }

  public int zzez()
  {
    return 5;
  }

  public boolean zzi(View paramView)
  {
    return (paramView.getWindowToken() != null) || (paramView.getWindowVisibility() != 8);
  }

  public boolean zzj(View paramView)
  {
    return false;
  }

  public boolean zzk(View paramView)
  {
    return false;
  }
}