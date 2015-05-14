package com.google.android.exoplayer.util;

import android.net.Uri;
import android.net.Uri.Builder;
import android.os.Build.VERSION;
import android.text.TextUtils;
import com.google.android.exoplayer.upstream.DataSource;
import java.io.IOException;
import java.math.BigDecimal;
import java.net.URL;
import java.text.ParseException;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public final class Util
{
  public static final int SDK_INT = Build.VERSION.SDK_INT;
  private static final Pattern XS_DATE_TIME_PATTERN = Pattern.compile("(\\d\\d\\d\\d)\\-(\\d\\d)\\-(\\d\\d)[Tt](\\d\\d):(\\d\\d):(\\d\\d)(\\.(\\d+))?([Zz]|((\\+|\\-)(\\d\\d):(\\d\\d)))?");
  private static final Pattern XS_DURATION_PATTERN = Pattern.compile("^(-)?P(([0-9]*)Y)?(([0-9]*)M)?(([0-9]*)D)?(T(([0-9]*)H)?(([0-9]*)M)?(([0-9.]*)S)?)?$");

  public static boolean areEqual(Object paramObject1, Object paramObject2)
  {
    if (paramObject1 == null)
      return paramObject2 == null;
    return paramObject1.equals(paramObject2);
  }

  public static <T> int binarySearchCeil(List<? extends Comparable<? super T>> paramList, T paramT, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = Collections.binarySearch(paramList, paramT);
    if (i < 0)
      i ^= -1;
    while (true)
    {
      if (paramBoolean2)
        i = Math.min(-1 + paramList.size(), i);
      return i;
      if (!paramBoolean1)
        i++;
    }
  }

  public static int binarySearchCeil(long[] paramArrayOfLong, long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = Arrays.binarySearch(paramArrayOfLong, paramLong);
    if (i < 0)
      i ^= -1;
    while (true)
    {
      if (paramBoolean2)
        i = Math.min(-1 + paramArrayOfLong.length, i);
      return i;
      if (!paramBoolean1)
        i++;
    }
  }

  public static <T> int binarySearchFloor(List<? extends Comparable<? super T>> paramList, T paramT, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = Collections.binarySearch(paramList, paramT);
    if (i < 0)
      i = -(i + 2);
    while (true)
    {
      if (paramBoolean2)
        i = Math.max(0, i);
      return i;
      if (!paramBoolean1)
        i--;
    }
  }

  public static int binarySearchFloor(long[] paramArrayOfLong, long paramLong, boolean paramBoolean1, boolean paramBoolean2)
  {
    int i = Arrays.binarySearch(paramArrayOfLong, paramLong);
    if (i < 0)
      i = -(i + 2);
    while (true)
    {
      if (paramBoolean2)
        i = Math.max(0, i);
      return i;
      if (!paramBoolean1)
        i--;
    }
  }

  public static void closeQuietly(DataSource paramDataSource)
  {
    try
    {
      paramDataSource.close();
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public static Uri getMergedUri(Uri paramUri, String paramString)
  {
    if (paramString == null)
      return paramUri;
    if (paramUri == null)
      return Uri.parse(paramString);
    if (paramString.startsWith("/"))
    {
      String str = paramString.substring(1);
      return new Uri.Builder().scheme(paramUri.getScheme()).authority(paramUri.getAuthority()).appendEncodedPath(str).build();
    }
    Uri localUri = Uri.parse(paramString);
    if (localUri.isAbsolute())
      return localUri;
    return Uri.withAppendedPath(paramUri, paramString);
  }

  public static boolean isUrlLocalFile(URL paramURL)
  {
    return paramURL.getProtocol().equals("file");
  }

  public static ExecutorService newSingleThreadExecutor(String paramString)
  {
    return Executors.newSingleThreadExecutor(new ThreadFactory()
    {
      public Thread newThread(Runnable paramAnonymousRunnable)
      {
        return new Thread(paramAnonymousRunnable, this.val$threadName);
      }
    });
  }

  public static ScheduledExecutorService newSingleThreadScheduledExecutor(String paramString)
  {
    return Executors.newSingleThreadScheduledExecutor(new ThreadFactory()
    {
      public Thread newThread(Runnable paramAnonymousRunnable)
      {
        return new Thread(paramAnonymousRunnable, this.val$threadName);
      }
    });
  }

  public static Uri parseBaseUri(String paramString)
  {
    return Uri.parse(paramString.substring(0, paramString.lastIndexOf('/')));
  }

  public static long parseXsDateTime(String paramString)
    throws ParseException
  {
    Matcher localMatcher = XS_DATE_TIME_PATTERN.matcher(paramString);
    if (!localMatcher.matches())
      throw new ParseException("Invalid date/time format: " + paramString, 0);
    int i;
    if (localMatcher.group(9) == null)
      i = 0;
    while (true)
    {
      GregorianCalendar localGregorianCalendar = new GregorianCalendar(TimeZone.getTimeZone("GMT"));
      localGregorianCalendar.clear();
      localGregorianCalendar.set(Integer.parseInt(localMatcher.group(1)), -1 + Integer.parseInt(localMatcher.group(2)), Integer.parseInt(localMatcher.group(3)), Integer.parseInt(localMatcher.group(4)), Integer.parseInt(localMatcher.group(5)), Integer.parseInt(localMatcher.group(6)));
      if (!TextUtils.isEmpty(localMatcher.group(8)))
        localGregorianCalendar.set(14, new BigDecimal("0." + localMatcher.group(8)).movePointRight(3).intValue());
      long l = localGregorianCalendar.getTimeInMillis();
      if (i != 0)
        l -= 60000 * i;
      return l;
      if (localMatcher.group(9).equalsIgnoreCase("Z"))
      {
        i = 0;
      }
      else
      {
        i = 60 * Integer.parseInt(localMatcher.group(12)) + Integer.parseInt(localMatcher.group(13));
        if (localMatcher.group(11).equals("-"))
          i *= -1;
      }
    }
  }

  public static long parseXsDuration(String paramString)
  {
    Matcher localMatcher = XS_DURATION_PATTERN.matcher(paramString);
    if (localMatcher.matches())
    {
      int i;
      double d1;
      label48: double d2;
      label71: double d4;
      label102: double d6;
      label133: double d8;
      label164: double d9;
      String str6;
      if (!TextUtils.isEmpty(localMatcher.group(1)))
      {
        i = 1;
        String str1 = localMatcher.group(3);
        if (str1 == null)
          break label220;
        d1 = 31556908.0D * Double.parseDouble(str1);
        String str2 = localMatcher.group(5);
        if (str2 == null)
          break label226;
        d2 = 2629739.0D * Double.parseDouble(str2);
        double d3 = d1 + d2;
        String str3 = localMatcher.group(7);
        if (str3 == null)
          break label232;
        d4 = 86400.0D * Double.parseDouble(str3);
        double d5 = d3 + d4;
        String str4 = localMatcher.group(10);
        if (str4 == null)
          break label238;
        d6 = 3600.0D * Double.parseDouble(str4);
        double d7 = d5 + d6;
        String str5 = localMatcher.group(12);
        if (str5 == null)
          break label244;
        d8 = 60.0D * Double.parseDouble(str5);
        d9 = d7 + d8;
        str6 = localMatcher.group(14);
        if (str6 == null)
          break label250;
      }
      label220: label226: label232: label238: label244: label250: for (double d10 = Double.parseDouble(str6); ; d10 = 0.0D)
      {
        long l = ()(1000.0D * (d9 + d10));
        if (i != 0)
          l = -l;
        return l;
        i = 0;
        break;
        d1 = 0.0D;
        break label48;
        d2 = 0.0D;
        break label71;
        d4 = 0.0D;
        break label102;
        d6 = 0.0D;
        break label133;
        d8 = 0.0D;
        break label164;
      }
    }
    return ()(1000.0D * (3600.0D * Double.parseDouble(paramString)));
  }

  public static long scaleLargeTimestamp(long paramLong1, long paramLong2, long paramLong3)
  {
    if ((paramLong3 >= paramLong2) && (paramLong3 % paramLong2 == 0L))
      return paramLong1 / (paramLong3 / paramLong2);
    if ((paramLong3 < paramLong2) && (paramLong2 % paramLong3 == 0L))
      return paramLong1 * (paramLong2 / paramLong3);
    return ()(paramLong2 / paramLong3 * paramLong1);
  }

  public static long[] scaleLargeTimestamps(List<Long> paramList, long paramLong1, long paramLong2)
  {
    long[] arrayOfLong = new long[paramList.size()];
    long l2;
    int k;
    if ((paramLong2 >= paramLong1) && (paramLong2 % paramLong1 == 0L))
    {
      l2 = paramLong2 / paramLong1;
      k = 0;
    }
    while (k < arrayOfLong.length)
    {
      arrayOfLong[k] = (((Long)paramList.get(k)).longValue() / l2);
      k++;
      continue;
      long l1;
      int j;
      if ((paramLong2 < paramLong1) && (paramLong1 % paramLong2 == 0L))
      {
        l1 = paramLong1 / paramLong2;
        j = 0;
      }
      while (j < arrayOfLong.length)
      {
        arrayOfLong[j] = (l1 * ((Long)paramList.get(j)).longValue());
        j++;
        continue;
        double d = paramLong1 / paramLong2;
        for (int i = 0; i < arrayOfLong.length; i++)
          arrayOfLong[i] = (()(d * ((Long)paramList.get(i)).longValue()));
      }
    }
    return arrayOfLong;
  }

  public static void scaleLargeTimestampsInPlace(long[] paramArrayOfLong, long paramLong1, long paramLong2)
  {
    long l2;
    int k;
    if ((paramLong2 >= paramLong1) && (paramLong2 % paramLong1 == 0L))
    {
      l2 = paramLong2 / paramLong1;
      k = 0;
    }
    while (k < paramArrayOfLong.length)
    {
      paramArrayOfLong[k] /= l2;
      k++;
      continue;
      long l1;
      int j;
      if ((paramLong2 < paramLong1) && (paramLong1 % paramLong2 == 0L))
      {
        l1 = paramLong1 / paramLong2;
        j = 0;
      }
      while (j < paramArrayOfLong.length)
      {
        paramArrayOfLong[j] = (l1 * paramArrayOfLong[j]);
        j++;
        continue;
        double d = paramLong1 / paramLong2;
        for (int i = 0; i < paramArrayOfLong.length; i++)
          paramArrayOfLong[i] = (()(d * paramArrayOfLong[i]));
      }
    }
  }

  public static int[] toArray(List<Integer> paramList)
  {
    int[] arrayOfInt;
    if (paramList == null)
      arrayOfInt = null;
    while (true)
    {
      return arrayOfInt;
      int i = paramList.size();
      arrayOfInt = new int[i];
      for (int j = 0; j < i; j++)
        arrayOfInt[j] = ((Integer)paramList.get(j)).intValue();
    }
  }

  public static String toLowerInvariant(String paramString)
  {
    if (paramString == null)
      return null;
    return paramString.toLowerCase(Locale.US);
  }
}