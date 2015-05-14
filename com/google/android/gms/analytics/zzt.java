package com.google.android.gms.analytics;

import android.os.Build.VERSION;
import java.io.File;

public class zzt
{
  public static int version()
  {
    try
    {
      int i = Integer.parseInt(Build.VERSION.SDK);
      return i;
    }
    catch (NumberFormatException localNumberFormatException)
    {
      zzae.zzZ("Invalid version number: " + Build.VERSION.SDK);
    }
    return 0;
  }

  public static boolean zzam(String paramString)
  {
    if (version() < 9)
      return false;
    File localFile = new File(paramString);
    localFile.setReadable(false, false);
    localFile.setWritable(false, false);
    localFile.setReadable(true, true);
    localFile.setWritable(true, true);
    return true;
  }
}