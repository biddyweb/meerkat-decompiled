package com.digits.sdk.android;

import android.os.Bundle;

class BundleManager
{
  static boolean assertContains(Bundle paramBundle, String[] paramArrayOfString)
  {
    if ((paramBundle == null) || (paramArrayOfString == null))
      return false;
    int i = paramArrayOfString.length;
    for (int j = 0; ; j++)
    {
      if (j >= i)
        break label36;
      if (!paramBundle.containsKey(paramArrayOfString[j]))
        break;
    }
    label36: return true;
  }
}