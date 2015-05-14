package com.android.volley;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

class InternalUtils
{
  private static final char[] HEX_CHARS = "0123456789ABCDEF".toCharArray();

  private static String convertToHex(byte[] paramArrayOfByte)
  {
    char[] arrayOfChar = new char[2 * paramArrayOfByte.length];
    for (int i = 0; i < paramArrayOfByte.length; i++)
    {
      int j = 0xFF & paramArrayOfByte[i];
      arrayOfChar[(i * 2)] = HEX_CHARS[(j >>> 4)];
      arrayOfChar[(1 + i * 2)] = HEX_CHARS[(j & 0xF)];
    }
    return new String(arrayOfChar);
  }

  public static String sha1Hash(String paramString)
  {
    try
    {
      MessageDigest localMessageDigest = MessageDigest.getInstance("SHA-1");
      byte[] arrayOfByte = paramString.getBytes("UTF-8");
      localMessageDigest.update(arrayOfByte, 0, arrayOfByte.length);
      String str = convertToHex(localMessageDigest.digest());
      return str;
    }
    catch (NoSuchAlgorithmException localNoSuchAlgorithmException)
    {
      localNoSuchAlgorithmException.printStackTrace();
      return null;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      localUnsupportedEncodingException.printStackTrace();
    }
    return null;
  }
}