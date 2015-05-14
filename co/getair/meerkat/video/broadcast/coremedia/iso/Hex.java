package co.getair.meerkat.video.broadcast.coremedia.iso;

import java.io.ByteArrayOutputStream;

public class Hex
{
  private static final char[] DIGITS = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 65, 66, 67, 68, 69, 70 };

  public static byte[] decodeHex(String paramString)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    for (int i = 0; i < paramString.length(); i += 2)
      localByteArrayOutputStream.write(Integer.parseInt(paramString.substring(i, i + 2), 16));
    return localByteArrayOutputStream.toByteArray();
  }

  public static String encodeHex(byte[] paramArrayOfByte)
  {
    return encodeHex(paramArrayOfByte, 0);
  }

  public static String encodeHex(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramArrayOfByte.length;
    int j = i << 1;
    int k;
    char[] arrayOfChar;
    int m;
    int n;
    label30: int i1;
    if (paramInt > 0)
    {
      k = i / paramInt;
      arrayOfChar = new char[k + j];
      m = 0;
      n = 0;
      if (m >= i)
        break label128;
      if ((paramInt <= 0) || (m % paramInt != 0) || (n <= 0))
        break label138;
      i1 = n + 1;
      arrayOfChar[n] = '-';
    }
    while (true)
    {
      int i2 = i1 + 1;
      arrayOfChar[i1] = DIGITS[((0xF0 & paramArrayOfByte[m]) >>> 4)];
      int i3 = i2 + 1;
      arrayOfChar[i2] = DIGITS[(0xF & paramArrayOfByte[m])];
      m++;
      n = i3;
      break label30;
      k = 0;
      break;
      label128: return new String(arrayOfChar);
      label138: i1 = n;
    }
  }
}