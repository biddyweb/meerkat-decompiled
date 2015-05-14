package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;

@GwtCompatible
final class CollectPreconditions
{
  static void checkEntryNotNull(Object paramObject1, Object paramObject2)
  {
    if (paramObject1 == null)
    {
      String str2 = String.valueOf(String.valueOf(paramObject2));
      throw new NullPointerException(24 + str2.length() + "null key in entry: null=" + str2);
    }
    if (paramObject2 == null)
    {
      String str1 = String.valueOf(String.valueOf(paramObject1));
      throw new NullPointerException(26 + str1.length() + "null value in entry: " + str1 + "=null");
    }
  }

  static int checkNonnegative(int paramInt, String paramString)
  {
    if (paramInt < 0)
    {
      String str = String.valueOf(String.valueOf(paramString));
      throw new IllegalArgumentException(40 + str.length() + str + " cannot be negative but was: " + paramInt);
    }
    return paramInt;
  }

  static void checkRemove(boolean paramBoolean)
  {
    Preconditions.checkState(paramBoolean, "no calls to next() since the last call to remove()");
  }
}