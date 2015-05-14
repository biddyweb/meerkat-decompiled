package com.google.android.exoplayer.util;

public class VerboseLogUtil
{
  private static volatile boolean enableAllTags;
  private static volatile String[] enabledTags;

  public static boolean areAllTagsEnabled()
  {
    return enableAllTags;
  }

  public static boolean isTagEnabled(String paramString)
  {
    if (enableAllTags)
      return true;
    String[] arrayOfString = enabledTags;
    if ((arrayOfString == null) || (arrayOfString.length == 0))
      return false;
    for (int i = 0; ; i++)
    {
      if (i >= arrayOfString.length)
        break label47;
      if (arrayOfString[i].equals(paramString))
        break;
    }
    label47: return false;
  }

  public static void setEnableAllTags(boolean paramBoolean)
  {
    enableAllTags = paramBoolean;
  }

  public static void setEnabledTags(String[] paramArrayOfString)
  {
    enabledTags = paramArrayOfString;
    enableAllTags = false;
  }
}