package com.squareup.mimecraft;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

final class Utils
{
  static void copyStream(InputStream paramInputStream, OutputStream paramOutputStream, byte[] paramArrayOfByte)
    throws IOException
  {
    while (true)
    {
      int i = paramInputStream.read(paramArrayOfByte);
      if (i == -1)
        break;
      paramOutputStream.write(paramArrayOfByte, 0, i);
    }
  }

  static void isNotEmpty(String paramString1, String paramString2)
  {
    isNotNull(paramString1, paramString2);
    if ("".equals(paramString1.trim()))
      throw new IllegalStateException(paramString2);
  }

  static void isNotNull(Object paramObject, String paramString)
  {
    if (paramObject == null)
      throw new IllegalStateException(paramString);
  }

  static void isNotZero(int paramInt, String paramString)
  {
    if (paramInt != 0)
      throw new IllegalStateException(paramString);
  }

  static void isNull(Object paramObject, String paramString)
  {
    if (paramObject != null)
      throw new IllegalStateException(paramString);
  }
}