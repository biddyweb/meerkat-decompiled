package co.getair.meerkat.video.broadcast.coremedia.iso;

import java.io.UnsupportedEncodingException;

public final class Utf8
{
  public static String convert(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte != null);
    try
    {
      String str = new String(paramArrayOfByte, "UTF-8");
      return str;
      return null;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new Error(localUnsupportedEncodingException);
    }
  }

  public static byte[] convert(String paramString)
  {
    if (paramString != null);
    try
    {
      byte[] arrayOfByte = paramString.getBytes("UTF-8");
      return arrayOfByte;
      return null;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new Error(localUnsupportedEncodingException);
    }
  }

  public static int utf8StringLengthInBytes(String paramString)
  {
    if (paramString != null);
    try
    {
      int i = paramString.getBytes("UTF-8").length;
      return i;
      return 0;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
    }
    throw new RuntimeException();
  }
}