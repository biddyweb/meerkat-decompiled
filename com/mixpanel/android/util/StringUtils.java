package com.mixpanel.android.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class StringUtils
{
  public static String inputStreamToString(InputStream paramInputStream)
    throws IOException
  {
    BufferedReader localBufferedReader = new BufferedReader(new InputStreamReader(paramInputStream));
    StringBuilder localStringBuilder = new StringBuilder();
    while (true)
    {
      String str = localBufferedReader.readLine();
      if (str == null)
        break;
      localStringBuilder.append(str + "\n");
    }
    localBufferedReader.close();
    return localStringBuilder.toString();
  }
}