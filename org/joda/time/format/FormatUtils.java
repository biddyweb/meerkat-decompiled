package org.joda.time.format;

import java.io.IOException;
import java.io.Writer;

public class FormatUtils
{
  private static final double LOG_10 = Math.log(10.0D);

  public static void appendPaddedInteger(Appendable paramAppendable, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt1 < 0)
    {
      paramAppendable.append('-');
      if (paramInt1 != -2147483648)
        paramInt1 = -paramInt1;
    }
    else
    {
      if (paramInt1 >= 10)
        break label92;
      while (paramInt2 > 1)
      {
        paramAppendable.append('0');
        paramInt2--;
      }
    }
    while (paramInt2 > 10)
    {
      paramAppendable.append('0');
      paramInt2--;
    }
    paramAppendable.append("2147483648");
    return;
    paramAppendable.append((char)(paramInt1 + 48));
    return;
    label92: if (paramInt1 < 100)
    {
      while (paramInt2 > 2)
      {
        paramAppendable.append('0');
        paramInt2--;
      }
      int j = 13421772 * (paramInt1 + 1) >> 27;
      paramAppendable.append((char)(j + 48));
      paramAppendable.append((char)(48 + (paramInt1 - (j << 3) - (j << 1))));
      return;
    }
    int i;
    if (paramInt1 < 1000)
      i = 3;
    while (paramInt2 > i)
    {
      paramAppendable.append('0');
      paramInt2--;
      continue;
      if (paramInt1 < 10000)
        i = 4;
      else
        i = 1 + (int)(Math.log(paramInt1) / LOG_10);
    }
    paramAppendable.append(Integer.toString(paramInt1));
  }

  public static void appendPaddedInteger(Appendable paramAppendable, long paramLong, int paramInt)
    throws IOException
  {
    int i = (int)paramLong;
    if (i == paramLong)
    {
      appendPaddedInteger(paramAppendable, i, paramInt);
      return;
    }
    if (paramInt <= 19)
    {
      paramAppendable.append(Long.toString(paramLong));
      return;
    }
    if (paramLong < 0L)
    {
      paramAppendable.append('-');
      if (paramLong != -9223372036854775808L)
        paramLong = -paramLong;
    }
    else
    {
      int j = 1 + (int)(Math.log(paramLong) / LOG_10);
      while (paramInt > j)
      {
        paramAppendable.append('0');
        paramInt--;
      }
    }
    while (paramInt > 19)
    {
      paramAppendable.append('0');
      paramInt--;
    }
    paramAppendable.append("9223372036854775808");
    return;
    paramAppendable.append(Long.toString(paramLong));
  }

  public static void appendPaddedInteger(StringBuffer paramStringBuffer, int paramInt1, int paramInt2)
  {
    try
    {
      appendPaddedInteger(paramStringBuffer, paramInt1, paramInt2);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public static void appendPaddedInteger(StringBuffer paramStringBuffer, long paramLong, int paramInt)
  {
    try
    {
      appendPaddedInteger(paramStringBuffer, paramLong, paramInt);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public static void appendUnpaddedInteger(Appendable paramAppendable, int paramInt)
    throws IOException
  {
    if (paramInt < 0)
    {
      paramAppendable.append('-');
      if (paramInt != -2147483648)
        paramInt = -paramInt;
    }
    else
    {
      if (paramInt >= 10)
        break label51;
      paramAppendable.append((char)(paramInt + 48));
      return;
    }
    paramAppendable.append("2147483648");
    return;
    label51: if (paramInt < 100)
    {
      int i = 13421772 * (paramInt + 1) >> 27;
      paramAppendable.append((char)(i + 48));
      paramAppendable.append((char)(48 + (paramInt - (i << 3) - (i << 1))));
      return;
    }
    paramAppendable.append(Integer.toString(paramInt));
  }

  public static void appendUnpaddedInteger(Appendable paramAppendable, long paramLong)
    throws IOException
  {
    int i = (int)paramLong;
    if (i == paramLong)
    {
      appendUnpaddedInteger(paramAppendable, i);
      return;
    }
    paramAppendable.append(Long.toString(paramLong));
  }

  public static void appendUnpaddedInteger(StringBuffer paramStringBuffer, int paramInt)
  {
    try
    {
      appendUnpaddedInteger(paramStringBuffer, paramInt);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public static void appendUnpaddedInteger(StringBuffer paramStringBuffer, long paramLong)
  {
    try
    {
      appendUnpaddedInteger(paramStringBuffer, paramLong);
      return;
    }
    catch (IOException localIOException)
    {
    }
  }

  public static int calculateDigitCount(long paramLong)
  {
    if (paramLong < 0L)
    {
      if (paramLong != -9223372036854775808L)
        return 1 + calculateDigitCount(-paramLong);
      return 20;
    }
    if (paramLong < 10L)
      return 1;
    if (paramLong < 100L)
      return 2;
    if (paramLong < 1000L)
      return 3;
    if (paramLong < 10000L)
      return 4;
    return 1 + (int)(Math.log(paramLong) / LOG_10);
  }

  static String createErrorMessage(String paramString, int paramInt)
  {
    int i = paramInt + 32;
    if (paramString.length() <= i + 3);
    for (String str = paramString; paramInt <= 0; str = paramString.substring(0, i).concat("..."))
      return "Invalid format: \"" + str + '"';
    if (paramInt >= paramString.length())
      return "Invalid format: \"" + str + "\" is too short";
    return "Invalid format: \"" + str + "\" is malformed at \"" + str.substring(paramInt) + '"';
  }

  static int parseTwoDigits(CharSequence paramCharSequence, int paramInt)
  {
    int i = '\0*0' + paramCharSequence.charAt(paramInt);
    return -48 + ((i << 3) + (i << 1) + paramCharSequence.charAt(paramInt + 1));
  }

  public static void writePaddedInteger(Writer paramWriter, int paramInt1, int paramInt2)
    throws IOException
  {
    if (paramInt1 < 0)
    {
      paramWriter.write(45);
      if (paramInt1 != -2147483648)
        paramInt1 = -paramInt1;
    }
    else
    {
      if (paramInt1 >= 10)
        break label76;
      while (paramInt2 > 1)
      {
        paramWriter.write(48);
        paramInt2--;
      }
    }
    while (paramInt2 > 10)
    {
      paramWriter.write(48);
      paramInt2--;
    }
    paramWriter.write("2147483648");
    return;
    paramWriter.write(paramInt1 + 48);
    return;
    label76: if (paramInt1 < 100)
    {
      while (paramInt2 > 2)
      {
        paramWriter.write(48);
        paramInt2--;
      }
      int j = 13421772 * (paramInt1 + 1) >> 27;
      paramWriter.write(j + 48);
      paramWriter.write(48 + (paramInt1 - (j << 3) - (j << 1)));
      return;
    }
    int i;
    if (paramInt1 < 1000)
      i = 3;
    while (paramInt2 > i)
    {
      paramWriter.write(48);
      paramInt2--;
      continue;
      if (paramInt1 < 10000)
        i = 4;
      else
        i = 1 + (int)(Math.log(paramInt1) / LOG_10);
    }
    paramWriter.write(Integer.toString(paramInt1));
  }

  public static void writePaddedInteger(Writer paramWriter, long paramLong, int paramInt)
    throws IOException
  {
    int i = (int)paramLong;
    if (i == paramLong)
    {
      writePaddedInteger(paramWriter, i, paramInt);
      return;
    }
    if (paramInt <= 19)
    {
      paramWriter.write(Long.toString(paramLong));
      return;
    }
    if (paramLong < 0L)
    {
      paramWriter.write(45);
      if (paramLong != -9223372036854775808L)
        paramLong = -paramLong;
    }
    else
    {
      int j = 1 + (int)(Math.log(paramLong) / LOG_10);
      while (paramInt > j)
      {
        paramWriter.write(48);
        paramInt--;
      }
    }
    while (paramInt > 19)
    {
      paramWriter.write(48);
      paramInt--;
    }
    paramWriter.write("9223372036854775808");
    return;
    paramWriter.write(Long.toString(paramLong));
  }

  public static void writeUnpaddedInteger(Writer paramWriter, int paramInt)
    throws IOException
  {
    if (paramInt < 0)
    {
      paramWriter.write(45);
      if (paramInt != -2147483648)
        paramInt = -paramInt;
    }
    else
    {
      if (paramInt >= 10)
        break label41;
      paramWriter.write(paramInt + 48);
      return;
    }
    paramWriter.write("2147483648");
    return;
    label41: if (paramInt < 100)
    {
      int i = 13421772 * (paramInt + 1) >> 27;
      paramWriter.write(i + 48);
      paramWriter.write(48 + (paramInt - (i << 3) - (i << 1)));
      return;
    }
    paramWriter.write(Integer.toString(paramInt));
  }

  public static void writeUnpaddedInteger(Writer paramWriter, long paramLong)
    throws IOException
  {
    int i = (int)paramLong;
    if (i == paramLong)
    {
      writeUnpaddedInteger(paramWriter, i);
      return;
    }
    paramWriter.write(Long.toString(paramLong));
  }
}