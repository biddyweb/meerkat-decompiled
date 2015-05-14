package com.google.common.base;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@Beta
@GwtCompatible
public final class Verify
{
  public static void verify(boolean paramBoolean)
  {
    if (!paramBoolean)
      throw new VerifyException();
  }

  public static void verify(boolean paramBoolean, @Nullable String paramString, @Nullable Object[] paramArrayOfObject)
  {
    if (!paramBoolean)
      throw new VerifyException(Preconditions.format(paramString, paramArrayOfObject));
  }

  public static <T> T verifyNotNull(@Nullable T paramT)
  {
    return verifyNotNull(paramT, "expected a non-null reference", new Object[0]);
  }

  public static <T> T verifyNotNull(@Nullable T paramT, @Nullable String paramString, @Nullable Object[] paramArrayOfObject)
  {
    if (paramT != null);
    for (boolean bool = true; ; bool = false)
    {
      verify(bool, paramString, paramArrayOfObject);
      return paramT;
    }
  }
}