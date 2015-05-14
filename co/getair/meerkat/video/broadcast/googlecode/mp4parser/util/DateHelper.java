package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import java.util.Date;

public class DateHelper
{
  public static long convert(Date paramDate)
  {
    return 2082844800L + paramDate.getTime() / 1000L;
  }

  public static Date convert(long paramLong)
  {
    return new Date(1000L * (paramLong - 2082844800L));
  }
}