package co.getair.meerkat.video.broadcast.coremedia.iso;

import java.io.UnsupportedEncodingException;

public final class Ascii
{
  public static String convert(byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte != null);
    try
    {
      String str = new String(paramArrayOfByte, "us-ascii");
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
      byte[] arrayOfByte = paramString.getBytes("us-ascii");
      return arrayOfByte;
      return null;
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      throw new Error(localUnsupportedEncodingException);
    }
  }
}