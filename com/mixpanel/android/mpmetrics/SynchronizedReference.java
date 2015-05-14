package com.mixpanel.android.mpmetrics;

class SynchronizedReference<T>
{
  private T mContents = null;

  public T get()
  {
    try
    {
      Object localObject2 = this.mContents;
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public T getAndClear()
  {
    try
    {
      Object localObject2 = this.mContents;
      this.mContents = null;
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public void set(T paramT)
  {
    try
    {
      this.mContents = paramT;
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}