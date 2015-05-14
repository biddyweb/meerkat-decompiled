package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.net.Uri.Builder;
import android.view.MotionEvent;

public class zzk
{
  private String zzkU = "googleads.g.doubleclick.net";
  private String zzkV = "/pagead/ads";
  private String zzkW = "ad.doubleclick.net";
  private String[] zzkX = { ".doubleclick.net", ".googleadservices.com", ".googlesyndication.com" };
  private zzg zzkY;

  public zzk(zzg paramzzg)
  {
    this.zzkY = paramzzg;
  }

  private Uri zza(Uri paramUri, Context paramContext, String paramString, boolean paramBoolean)
    throws zzl
  {
    boolean bool;
    try
    {
      bool = zza(paramUri);
      if (bool)
      {
        if (!paramUri.toString().contains("dc_ms="))
          break label65;
        throw new zzl("Parameter already exists: dc_ms");
      }
    }
    catch (UnsupportedOperationException localUnsupportedOperationException)
    {
      throw new zzl("Provided Uri is not in a valid state");
    }
    if (paramUri.getQueryParameter("ms") != null)
      throw new zzl("Query parameter already exists: ms");
    label65: if (paramBoolean);
    for (String str = this.zzkY.zza(paramContext, paramString); bool; str = this.zzkY.zza(paramContext))
      return zzb(paramUri, "dc_ms", str);
    Uri localUri = zza(paramUri, "ms", str);
    return localUri;
  }

  private Uri zza(Uri paramUri, String paramString1, String paramString2)
    throws UnsupportedOperationException
  {
    String str = paramUri.toString();
    int i = str.indexOf("&adurl");
    if (i == -1)
      i = str.indexOf("?adurl");
    if (i != -1)
      return Uri.parse(str.substring(0, i + 1) + paramString1 + "=" + paramString2 + "&" + str.substring(i + 1));
    return paramUri.buildUpon().appendQueryParameter(paramString1, paramString2).build();
  }

  private Uri zzb(Uri paramUri, String paramString1, String paramString2)
  {
    String str1 = paramUri.toString();
    int i = str1.indexOf(";adurl");
    if (i != -1)
      return Uri.parse(str1.substring(0, i + 1) + paramString1 + "=" + paramString2 + ";" + str1.substring(i + 1));
    String str2 = paramUri.getEncodedPath();
    int j = str1.indexOf(str2);
    return Uri.parse(str1.substring(0, j + str2.length()) + ";" + paramString1 + "=" + paramString2 + ";" + str1.substring(j + str2.length()));
  }

  public zzg zzC()
  {
    return this.zzkY;
  }

  public Uri zza(Uri paramUri, Context paramContext)
    throws zzl
  {
    try
    {
      Uri localUri = zza(paramUri, paramContext, paramUri.getQueryParameter("ai"), true);
      return localUri;
    }
    catch (UnsupportedOperationException localUnsupportedOperationException)
    {
    }
    throw new zzl("Provided Uri is not in a valid state");
  }

  public void zza(MotionEvent paramMotionEvent)
  {
    this.zzkY.zza(paramMotionEvent);
  }

  public boolean zza(Uri paramUri)
  {
    if (paramUri == null)
      throw new NullPointerException();
    try
    {
      boolean bool = paramUri.getHost().equals(this.zzkW);
      return bool;
    }
    catch (NullPointerException localNullPointerException)
    {
    }
    return false;
  }

  public boolean zzb(Uri paramUri)
  {
    if (paramUri == null)
      throw new NullPointerException();
    try
    {
      String str = paramUri.getHost();
      String[] arrayOfString = this.zzkX;
      int i = arrayOfString.length;
      for (int j = 0; ; j++)
      {
        boolean bool1 = false;
        if (j < i)
        {
          boolean bool2 = str.endsWith(arrayOfString[j]);
          if (bool2)
            bool1 = true;
        }
        else
        {
          return bool1;
        }
      }
    }
    catch (NullPointerException localNullPointerException)
    {
    }
    return false;
  }

  public boolean zzc(Uri paramUri)
  {
    return (zzb(paramUri)) && (paramUri.getPath().endsWith("/aclk"));
  }
}