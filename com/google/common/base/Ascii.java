package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import javax.annotation.CheckReturnValue;

@GwtCompatible
public final class Ascii
{
  public static final byte ACK = 6;
  public static final byte BEL = 7;
  public static final byte BS = 8;
  public static final byte CAN = 24;
  public static final byte CR = 13;
  public static final byte DC1 = 17;
  public static final byte DC2 = 18;
  public static final byte DC3 = 19;
  public static final byte DC4 = 20;
  public static final byte DEL = 127;
  public static final byte DLE = 16;
  public static final byte EM = 25;
  public static final byte ENQ = 5;
  public static final byte EOT = 4;
  public static final byte ESC = 27;
  public static final byte ETB = 23;
  public static final byte ETX = 3;
  public static final byte FF = 12;
  public static final byte FS = 28;
  public static final byte GS = 29;
  public static final byte HT = 9;
  public static final byte LF = 10;
  public static final char MAX = '';
  public static final char MIN = '\000';
  public static final byte NAK = 21;
  public static final byte NL = 10;
  public static final byte NUL = 0;
  public static final byte RS = 30;
  public static final byte SI = 15;
  public static final byte SO = 14;
  public static final byte SOH = 1;
  public static final byte SP = 32;
  public static final byte SPACE = 32;
  public static final byte STX = 2;
  public static final byte SUB = 26;
  public static final byte SYN = 22;
  public static final byte US = 31;
  public static final byte VT = 11;
  public static final byte XOFF = 19;
  public static final byte XON = 17;

  @Beta
  public static boolean equalsIgnoreCase(CharSequence paramCharSequence1, CharSequence paramCharSequence2)
  {
    int i = paramCharSequence1.length();
    if (paramCharSequence1 == paramCharSequence2)
      return true;
    if (i != paramCharSequence2.length())
      return false;
    int j = 0;
    label28: char c1;
    char c2;
    if (j < i)
    {
      c1 = paramCharSequence1.charAt(j);
      c2 = paramCharSequence2.charAt(j);
      if (c1 != c2)
        break label64;
    }
    label64: int k;
    do
    {
      j++;
      break label28;
      break;
      k = getAlphaIndex(c1);
    }
    while ((k < 26) && (k == getAlphaIndex(c2)));
    return false;
  }

  private static int getAlphaIndex(char paramChar)
  {
    return (char)('\0#7' + (paramChar | 0x20));
  }

  public static boolean isLowerCase(char paramChar)
  {
    return (paramChar >= 'a') && (paramChar <= 'z');
  }

  public static boolean isUpperCase(char paramChar)
  {
    return (paramChar >= 'A') && (paramChar <= 'Z');
  }

  public static char toLowerCase(char paramChar)
  {
    if (isUpperCase(paramChar))
      paramChar = (char)(paramChar ^ 0x20);
    return paramChar;
  }

  public static String toLowerCase(CharSequence paramCharSequence)
  {
    if ((paramCharSequence instanceof String))
      return toLowerCase((String)paramCharSequence);
    int i = paramCharSequence.length();
    StringBuilder localStringBuilder = new StringBuilder(i);
    for (int j = 0; j < i; j++)
      localStringBuilder.append(toLowerCase(paramCharSequence.charAt(j)));
    return localStringBuilder.toString();
  }

  public static String toLowerCase(String paramString)
  {
    int i = paramString.length();
    for (int j = 0; ; j++)
      if (j < i)
      {
        if (isUpperCase(paramString.charAt(j)))
        {
          char[] arrayOfChar = paramString.toCharArray();
          while (j < i)
          {
            char c = arrayOfChar[j];
            if (isUpperCase(c))
              arrayOfChar[j] = ((char)(c ^ 0x20));
            j++;
          }
          paramString = String.valueOf(arrayOfChar);
        }
      }
      else
        return paramString;
  }

  public static char toUpperCase(char paramChar)
  {
    if (isLowerCase(paramChar))
      paramChar = (char)(paramChar & 0x5F);
    return paramChar;
  }

  public static String toUpperCase(CharSequence paramCharSequence)
  {
    if ((paramCharSequence instanceof String))
      return toUpperCase((String)paramCharSequence);
    int i = paramCharSequence.length();
    StringBuilder localStringBuilder = new StringBuilder(i);
    for (int j = 0; j < i; j++)
      localStringBuilder.append(toUpperCase(paramCharSequence.charAt(j)));
    return localStringBuilder.toString();
  }

  public static String toUpperCase(String paramString)
  {
    int i = paramString.length();
    for (int j = 0; ; j++)
      if (j < i)
      {
        if (isLowerCase(paramString.charAt(j)))
        {
          char[] arrayOfChar = paramString.toCharArray();
          while (j < i)
          {
            char c = arrayOfChar[j];
            if (isLowerCase(c))
              arrayOfChar[j] = ((char)(c & 0x5F));
            j++;
          }
          paramString = String.valueOf(arrayOfChar);
        }
      }
      else
        return paramString;
  }

  @CheckReturnValue
  @Beta
  public static String truncate(CharSequence paramCharSequence, int paramInt, String paramString)
  {
    Preconditions.checkNotNull(paramCharSequence);
    int i = paramInt - paramString.length();
    if (i >= 0);
    String str;
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      arrayOfObject[1] = Integer.valueOf(paramString.length());
      Preconditions.checkArgument(bool, "maxLength (%s) must be >= length of the truncation indicator (%s)", arrayOfObject);
      if (paramCharSequence.length() > paramInt)
        break label94;
      str = paramCharSequence.toString();
      if (str.length() > paramInt)
        break;
      return str;
    }
    paramCharSequence = str;
    label94: return paramString;
  }
}