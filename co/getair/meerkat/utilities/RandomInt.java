package co.getair.meerkat.utilities;

import java.util.concurrent.atomic.AtomicInteger;

public class RandomInt
{
  private static final AtomicInteger c = new AtomicInteger(0);

  public static int getInt()
  {
    return (int)(0xFFFFFFF & System.currentTimeMillis());
  }
}