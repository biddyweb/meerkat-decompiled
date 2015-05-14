package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264;

import java.io.PrintStream;
import java.nio.ShortBuffer;

public class Debug
{
  public static final boolean debug;

  public static void print(int paramInt)
  {
  }

  public static void print(String paramString)
  {
  }

  public static void print(short[] paramArrayOfShort)
  {
    int i = 0;
    for (int j = 0; j < 8; j++)
    {
      for (int k = 0; k < 8; k++)
      {
        PrintStream localPrintStream = System.out;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Short.valueOf(paramArrayOfShort[i]);
        localPrintStream.printf("%3d, ", arrayOfObject);
        i++;
      }
      System.out.println();
    }
  }

  public static final void print8x8(ShortBuffer paramShortBuffer)
  {
    for (int i = 0; i < 8; i++)
    {
      for (int j = 0; j < 8; j++)
      {
        PrintStream localPrintStream = System.out;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Short.valueOf(paramShortBuffer.get());
        localPrintStream.printf("%3d, ", arrayOfObject);
      }
      System.out.println();
    }
  }

  public static final void print8x8(int[] paramArrayOfInt)
  {
    int i = 0;
    for (int j = 0; j < 8; j++)
    {
      for (int k = 0; k < 8; k++)
      {
        PrintStream localPrintStream = System.out;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(paramArrayOfInt[i]);
        localPrintStream.printf("%3d, ", arrayOfObject);
        i++;
      }
      System.out.println();
    }
  }

  public static final void print8x8(short[] paramArrayOfShort)
  {
    int i = 0;
    for (int j = 0; j < 8; j++)
    {
      for (int k = 0; k < 8; k++)
      {
        PrintStream localPrintStream = System.out;
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Short.valueOf(paramArrayOfShort[i]);
        localPrintStream.printf("%3d, ", arrayOfObject);
        i++;
      }
      System.out.println();
    }
  }

  public static void println(String paramString)
  {
  }

  public static void trace(String paramString, Object[] paramArrayOfObject)
  {
  }
}