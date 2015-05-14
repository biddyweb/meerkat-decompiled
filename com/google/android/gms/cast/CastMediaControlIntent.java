package com.google.android.gms.cast;

import android.text.TextUtils;
import com.google.android.gms.internal.zzjv;
import java.util.Collection;
import java.util.Iterator;
import java.util.Locale;

public final class CastMediaControlIntent
{
  public static final String ACTION_SYNC_STATUS = "com.google.android.gms.cast.ACTION_SYNC_STATUS";

  @Deprecated
  public static final String CATEGORY_CAST = "com.google.android.gms.cast.CATEGORY_CAST";
  public static final String DEFAULT_MEDIA_RECEIVER_APPLICATION_ID = "CC1AD845";
  public static final int ERROR_CODE_REQUEST_FAILED = 1;
  public static final int ERROR_CODE_SESSION_START_FAILED = 2;
  public static final int ERROR_CODE_TEMPORARILY_DISCONNECTED = 3;
  public static final String EXTRA_CAST_APPLICATION_ID = "com.google.android.gms.cast.EXTRA_CAST_APPLICATION_ID";
  public static final String EXTRA_CAST_LANGUAGE_CODE = "com.google.android.gms.cast.EXTRA_CAST_LANGUAGE_CODE";
  public static final String EXTRA_CAST_RELAUNCH_APPLICATION = "com.google.android.gms.cast.EXTRA_CAST_RELAUNCH_APPLICATION";
  public static final String EXTRA_CAST_STOP_APPLICATION_WHEN_SESSION_ENDS = "com.google.android.gms.cast.EXTRA_CAST_STOP_APPLICATION_WHEN_SESSION_ENDS";
  public static final String EXTRA_CUSTOM_DATA = "com.google.android.gms.cast.EXTRA_CUSTOM_DATA";
  public static final String EXTRA_DEBUG_LOGGING_ENABLED = "com.google.android.gms.cast.EXTRA_DEBUG_LOGGING_ENABLED";
  public static final String EXTRA_ERROR_CODE = "com.google.android.gms.cast.EXTRA_ERROR_CODE";

  public static String categoryForCast(String paramString)
    throws IllegalArgumentException
  {
    if (paramString == null)
      throw new IllegalArgumentException("applicationId cannot be null");
    return zza("com.google.android.gms.cast.CATEGORY_CAST", paramString, null);
  }

  public static String categoryForCast(String paramString, Collection<String> paramCollection)
  {
    if (paramString == null)
      throw new IllegalArgumentException("applicationId cannot be null");
    if (paramCollection == null)
      throw new IllegalArgumentException("namespaces cannot be null");
    return zza("com.google.android.gms.cast.CATEGORY_CAST", paramString, paramCollection);
  }

  public static String categoryForCast(Collection<String> paramCollection)
    throws IllegalArgumentException
  {
    if (paramCollection == null)
      throw new IllegalArgumentException("namespaces cannot be null");
    return zza("com.google.android.gms.cast.CATEGORY_CAST", null, paramCollection);
  }

  public static String categoryForRemotePlayback()
  {
    return zza("com.google.android.gms.cast.CATEGORY_CAST_REMOTE_PLAYBACK", null, null);
  }

  public static String categoryForRemotePlayback(String paramString)
    throws IllegalArgumentException
  {
    if (TextUtils.isEmpty(paramString))
      throw new IllegalArgumentException("applicationId cannot be null or empty");
    return zza("com.google.android.gms.cast.CATEGORY_CAST_REMOTE_PLAYBACK", paramString, null);
  }

  public static String languageTagForLocale(Locale paramLocale)
  {
    return zzjv.zzb(paramLocale);
  }

  private static String zza(String paramString1, String paramString2, Collection<String> paramCollection)
    throws IllegalArgumentException
  {
    StringBuffer localStringBuffer = new StringBuffer(paramString1);
    if (paramString2 != null)
    {
      String str2 = paramString2.toUpperCase();
      if (!str2.matches("[A-F0-9]+"))
        throw new IllegalArgumentException("Invalid application ID: " + paramString2);
      localStringBuffer.append("/").append(str2);
    }
    if (paramCollection != null)
    {
      if (paramCollection.isEmpty())
        throw new IllegalArgumentException("Must specify at least one namespace");
      Iterator localIterator = paramCollection.iterator();
      while (localIterator.hasNext())
      {
        String str1 = (String)localIterator.next();
        if ((TextUtils.isEmpty(str1)) || (str1.trim().equals("")))
          throw new IllegalArgumentException("Namespaces must not be null or empty");
      }
      if (paramString2 == null)
        localStringBuffer.append("/");
      localStringBuffer.append("/").append(TextUtils.join(",", paramCollection));
    }
    return localStringBuffer.toString();
  }
}