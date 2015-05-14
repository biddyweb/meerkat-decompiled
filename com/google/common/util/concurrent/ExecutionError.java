package com.google.common.util.concurrent;

import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@GwtCompatible
public class ExecutionError extends Error
{
  private static final long serialVersionUID;

  protected ExecutionError()
  {
  }

  public ExecutionError(@Nullable Error paramError)
  {
    super(paramError);
  }

  protected ExecutionError(@Nullable String paramString)
  {
    super(paramString);
  }

  public ExecutionError(@Nullable String paramString, @Nullable Error paramError)
  {
    super(paramString, paramError);
  }
}