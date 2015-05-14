package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

public class CastUtils
{
  public static int l2i(long paramLong)
  {
    if ((paramLong > 2147483647L) || (paramLong < -2147483648L))
      throw new RuntimeException("A cast to int has gone wrong. Please contact the mp4parser discussion group (" + paramLong + ")");
    return (int)paramLong;
  }
}