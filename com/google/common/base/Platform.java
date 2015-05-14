package com.google.common.base;

import com.google.common.annotations.GwtCompatible;
import java.lang.ref.WeakReference;
import java.util.Map;

@GwtCompatible(emulated=true)
final class Platform
{
  static <T extends Enum<T>> Optional<T> getEnumIfPresent(Class<T> paramClass, String paramString)
  {
    WeakReference localWeakReference = (WeakReference)Enums.getEnumConstants(paramClass).get(paramString);
    if (localWeakReference == null)
      return Optional.absent();
    return Optional.of(paramClass.cast(localWeakReference.get()));
  }

  static CharMatcher precomputeCharMatcher(CharMatcher paramCharMatcher)
  {
    return paramCharMatcher.precomputedInternal();
  }

  static long systemNanoTime()
  {
    return System.nanoTime();
  }
}