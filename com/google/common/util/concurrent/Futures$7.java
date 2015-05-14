package com.google.common.util.concurrent;

import com.google.common.base.Function;
import java.lang.reflect.Constructor;
import java.util.Arrays;
import java.util.List;

final class Futures$7
  implements Function<Constructor<?>, Boolean>
{
  public Boolean apply(Constructor<?> paramConstructor)
  {
    return Boolean.valueOf(Arrays.asList(paramConstructor.getParameterTypes()).contains(String.class));
  }
}