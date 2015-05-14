package com.google.android.exoplayer.util;

import android.annotation.TargetApi;
import android.os.Trace;

public class TraceUtil
{
  public static void beginSection(String paramString)
  {
    if (Util.SDK_INT >= 18)
      beginSectionV18(paramString);
  }

  @TargetApi(18)
  private static void beginSectionV18(String paramString)
  {
    Trace.beginSection(paramString);
  }

  public static void endSection()
  {
    if (Util.SDK_INT >= 18)
      endSectionV18();
  }

  @TargetApi(18)
  private static void endSectionV18()
  {
    Trace.endSection();
  }
}