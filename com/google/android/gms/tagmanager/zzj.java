package com.google.android.gms.tagmanager;

class zzj
{
  public static byte[] zzcL(String paramString)
  {
    int i = paramString.length();
    if (i % 2 != 0)
      throw new IllegalArgumentException("purported base16 string has odd number of characters");
    byte[] arrayOfByte = new byte[i / 2];
    for (int j = 0; j < i; j += 2)
    {
      int k = Character.digit(paramString.charAt(j), 16);
      int m = Character.digit(paramString.charAt(j + 1), 16);
      if ((k == -1) || (m == -1))
        throw new IllegalArgumentException("purported base16 string has illegal char");
      arrayOfByte[(j / 2)] = ((byte)(m + (k << 4)));
    }
    return arrayOfByte;
  }

  public static String zze(byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int i = paramArrayOfByte.length;
    for (int j = 0; j < i; j++)
    {
      int k = paramArrayOfByte[j];
      if ((k & 0xF0) == 0)
        localStringBuilder.append("0");
      localStringBuilder.append(Integer.toHexString(k & 0xFF));
    }
    return localStringBuilder.toString().toUpperCase();
  }
}