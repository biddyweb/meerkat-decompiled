package com.mixpanel.android.util;

public class Base64Coder
{
  private static char[] map1 = new char[64];
  private static byte[] map2;

  static
  {
    int i = 65;
    int i5;
    for (int j = 0; i <= 90; j = i5)
    {
      char[] arrayOfChar5 = map1;
      i5 = j + 1;
      arrayOfChar5[j] = i;
      i = (char)(i + 1);
    }
    int k = 97;
    while (k <= 122)
    {
      char[] arrayOfChar4 = map1;
      int i4 = j + 1;
      arrayOfChar4[j] = k;
      k = (char)(k + 1);
      j = i4;
    }
    int m = 48;
    while (m <= 57)
    {
      char[] arrayOfChar3 = map1;
      int i3 = j + 1;
      arrayOfChar3[j] = m;
      m = (char)(m + 1);
      j = i3;
    }
    char[] arrayOfChar1 = map1;
    int n = j + 1;
    arrayOfChar1[j] = '+';
    char[] arrayOfChar2 = map1;
    (n + 1);
    arrayOfChar2[n] = '/';
    map2 = new byte['\u0080'];
    for (int i1 = 0; i1 < map2.length; i1++)
      map2[i1] = -1;
    for (int i2 = 0; i2 < 64; i2++)
      map2[map1[i2]] = ((byte)i2);
  }

  public static byte[] decode(String paramString)
  {
    return decode(paramString.toCharArray());
  }

  public static byte[] decode(char[] paramArrayOfChar)
  {
    int i = paramArrayOfChar.length;
    if (i % 4 != 0)
      throw new IllegalArgumentException("Length of Base64 encoded input string is not a multiple of 4.");
    while ((i > 0) && (paramArrayOfChar[(i - 1)] == '='))
      i--;
    int j = i * 3 / 4;
    byte[] arrayOfByte = new byte[j];
    int k = 0;
    int m = 0;
    int i6;
    label170: label181: int i13;
    int i14;
    int i15;
    if (m < i)
    {
      int n = m + 1;
      int i1 = paramArrayOfChar[m];
      int i2 = n + 1;
      int i3 = paramArrayOfChar[n];
      int i4;
      int i5;
      if (i2 < i)
      {
        int i17 = i2 + 1;
        i4 = paramArrayOfChar[i2];
        i2 = i17;
        if (i2 >= i)
          break label170;
        i6 = i2 + 1;
        i5 = paramArrayOfChar[i2];
      }
      while (true)
      {
        if ((i1 <= 127) && (i3 <= 127) && (i4 <= 127) && (i5 <= 127))
          break label181;
        throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
        i4 = 65;
        break;
        i5 = 65;
        i6 = i2;
      }
      int i7 = map2[i1];
      int i8 = map2[i3];
      int i9 = map2[i4];
      int i10 = map2[i5];
      if ((i7 < 0) || (i8 < 0) || (i9 < 0) || (i10 < 0))
        throw new IllegalArgumentException("Illegal character in Base64 encoded data.");
      int i11 = i7 << 2 | i8 >>> 4;
      int i12 = (i8 & 0xF) << 4 | i9 >>> 2;
      i13 = i10 | (i9 & 0x3) << 6;
      i14 = k + 1;
      arrayOfByte[k] = ((byte)i11);
      if (i14 >= j)
        break label351;
      i15 = i14 + 1;
      arrayOfByte[i14] = ((byte)i12);
    }
    while (true)
    {
      int i16;
      if (i15 < j)
      {
        i16 = i15 + 1;
        arrayOfByte[i15] = ((byte)i13);
      }
      while (true)
      {
        k = i16;
        m = i6;
        break;
        return arrayOfByte;
        i16 = i15;
      }
      label351: i15 = i14;
    }
  }

  public static String decodeString(String paramString)
  {
    return new String(decode(paramString));
  }

  public static char[] encode(byte[] paramArrayOfByte)
  {
    return encode(paramArrayOfByte, paramArrayOfByte.length);
  }

  public static char[] encode(byte[] paramArrayOfByte, int paramInt)
  {
    int i = (2 + paramInt * 4) / 3;
    char[] arrayOfChar = new char[4 * ((paramInt + 2) / 3)];
    int j = 0;
    int k = 0;
    if (k < paramInt)
    {
      int m = k + 1;
      int n = 0xFF & paramArrayOfByte[k];
      int i1;
      int i2;
      label68: int i3;
      int i4;
      label90: int i8;
      int i11;
      label177: int i12;
      if (m < paramInt)
      {
        i1 = m + 1;
        i2 = 0xFF & paramArrayOfByte[m];
        if (i1 >= paramInt)
          break label232;
        i3 = i1 + 1;
        i4 = 0xFF & paramArrayOfByte[i1];
        int i5 = n >>> 2;
        int i6 = (n & 0x3) << 4 | i2 >>> 4;
        int i7 = (i2 & 0xF) << 2 | i4 >>> 6;
        i8 = i4 & 0x3F;
        int i9 = j + 1;
        arrayOfChar[j] = map1[i5];
        int i10 = i9 + 1;
        arrayOfChar[i9] = map1[i6];
        if (i10 >= i)
          break label242;
        i11 = map1[i7];
        arrayOfChar[i10] = i11;
        i12 = i10 + 1;
        if (i12 >= i)
          break label249;
      }
      label232: label242: label249: for (int i13 = map1[i8]; ; i13 = 61)
      {
        arrayOfChar[i12] = i13;
        j = i12 + 1;
        k = i3;
        break;
        i1 = m;
        i2 = 0;
        break label68;
        i3 = i1;
        i4 = 0;
        break label90;
        i11 = 61;
        break label177;
      }
    }
    return arrayOfChar;
  }

  public static String encodeString(String paramString)
  {
    return new String(encode(paramString.getBytes()));
  }
}