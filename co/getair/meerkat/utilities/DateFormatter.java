package co.getair.meerkat.utilities;

public class DateFormatter
{
  public static String futureTimeString(long paramLong, String paramString)
  {
    long l1 = paramLong - System.currentTimeMillis() / 1000L;
    String str = "hours";
    long l2;
    if (l1 > 3600L)
    {
      l2 = l1 / 3600L;
      if (l2 == 1L)
        str = "hour";
    }
    while (true)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Long.valueOf(l2);
      arrayOfObject[1] = str;
      return String.format(paramString, arrayOfObject);
      if (l1 > 60L)
      {
        l2 = l1 / 60L;
        if (l2 == 1L)
          str = "minute";
        else
          str = "minutes";
      }
      else
      {
        if ((l1 <= 0L) || (l1 > 60L))
          break;
        l2 = 1L;
        str = "minute";
      }
    }
    return null;
  }

  public static long timeToFuture(long paramLong)
  {
    return paramLong - System.currentTimeMillis();
  }
}