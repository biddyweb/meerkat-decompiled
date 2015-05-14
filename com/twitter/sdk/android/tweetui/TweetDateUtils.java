package com.twitter.sdk.android.tweetui;

import android.content.res.Resources;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

final class TweetDateUtils
{
  static final SimpleDateFormat DATE_TIME_RFC822 = new SimpleDateFormat("EEE MMM dd HH:mm:ss Z yyyy", Locale.ENGLISH);
  static final long INVALID_DATE = -1L;
  static final SimpleDateFormat RELATIVE_DATE_FORMAT = new SimpleDateFormat("MM/dd/yy", Locale.ENGLISH);

  static long apiTimeToLong(String paramString)
  {
    if (paramString == null)
      return -1L;
    try
    {
      long l = DATE_TIME_RFC822.parse(paramString).getTime();
      return l;
    }
    catch (ParseException localParseException)
    {
    }
    return -1L;
  }

  public static String dotPrefix(String paramString)
  {
    if (paramString.charAt(0) == '\u2022')
      return paramString;
    return "\u2022 " + paramString;
  }

  static String getRelativeTimeString(Resources paramResources, long paramLong1, long paramLong2)
  {
    long l = paramLong1 - paramLong2;
    if (l >= 0L)
    {
      if (l < 60000L)
      {
        int n = (int)(l / 1000L);
        int i1 = R.plurals.tw__time_secs;
        Object[] arrayOfObject3 = new Object[1];
        arrayOfObject3[0] = Integer.valueOf(n);
        return paramResources.getQuantityString(i1, n, arrayOfObject3);
      }
      if (l < 3600000L)
      {
        int k = (int)(l / 60000L);
        int m = R.plurals.tw__time_mins;
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Integer.valueOf(k);
        return paramResources.getQuantityString(m, k, arrayOfObject2);
      }
      if (l < 86400000L)
      {
        int i = (int)(l / 3600000L);
        int j = R.plurals.tw__time_hours;
        Object[] arrayOfObject1 = new Object[1];
        arrayOfObject1[0] = Integer.valueOf(i);
        return paramResources.getQuantityString(j, i, arrayOfObject1);
      }
      Calendar localCalendar1 = Calendar.getInstance();
      localCalendar1.setTimeInMillis(paramLong1);
      Calendar localCalendar2 = Calendar.getInstance();
      localCalendar2.setTimeInMillis(paramLong2);
      Date localDate = new Date(paramLong2);
      if (localCalendar1.get(1) == localCalendar2.get(1))
        RELATIVE_DATE_FORMAT.applyPattern(paramResources.getString(R.string.tw__relative_date_format_short));
      while (true)
      {
        return RELATIVE_DATE_FORMAT.format(localDate);
        RELATIVE_DATE_FORMAT.applyPattern(paramResources.getString(R.string.tw__relative_date_format_long));
      }
    }
    RELATIVE_DATE_FORMAT.applyPattern(paramResources.getString(R.string.tw__relative_date_format_long));
    return RELATIVE_DATE_FORMAT.format(new Date(paramLong2));
  }

  static boolean isValidTimestamp(String paramString)
  {
    return apiTimeToLong(paramString) != -1L;
  }
}