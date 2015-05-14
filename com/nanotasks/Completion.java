package com.nanotasks;

import android.content.Context;

public abstract interface Completion<T>
{
  public abstract void onError(Context paramContext, Exception paramException);

  public abstract void onSuccess(Context paramContext, T paramT);
}