package org.joda.time;

import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;

public class IllegalInstantException extends IllegalArgumentException
{
  private static final long serialVersionUID = 2858712538216L;

  public IllegalInstantException(long paramLong, String paramString)
  {
    super(createMessage(paramLong, paramString));
  }

  public IllegalInstantException(String paramString)
  {
    super(paramString);
  }

  private static String createMessage(long paramLong, String paramString)
  {
    String str1 = DateTimeFormat.forPattern("yyyy-MM-dd'T'HH:mm:ss.SSS").print(new Instant(paramLong));
    if (paramString != null);
    for (String str2 = " (" + paramString + ")"; ; str2 = "")
      return "Illegal instant due to time zone offset transition (daylight savings time 'gap'): " + str1 + str2;
  }

  public static boolean isIllegalInstant(Throwable paramThrowable)
  {
    if ((paramThrowable instanceof IllegalInstantException))
      return true;
    if ((paramThrowable.getCause() != null) && (paramThrowable.getCause() != paramThrowable))
      return isIllegalInstant(paramThrowable.getCause());
    return false;
  }
}