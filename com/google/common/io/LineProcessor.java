package com.google.common.io;

import com.google.common.annotations.Beta;
import java.io.IOException;

@Beta
public abstract interface LineProcessor<T>
{
  public abstract T getResult();

  public abstract boolean processLine(String paramString)
    throws IOException;
}