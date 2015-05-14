package com.google.common.escape;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;

@Beta
@GwtCompatible
public abstract class Escaper
{
  private final Function<String, String> asFunction = new Function()
  {
    public String apply(String paramAnonymousString)
    {
      return Escaper.this.escape(paramAnonymousString);
    }
  };

  public final Function<String, String> asFunction()
  {
    return this.asFunction;
  }

  public abstract String escape(String paramString);
}