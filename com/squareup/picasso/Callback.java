package com.squareup.picasso;

public abstract interface Callback
{
  public abstract void onError();

  public abstract void onSuccess();

  public static class EmptyCallback
    implements Callback
  {
    public void onError()
    {
    }

    public void onSuccess()
    {
    }
  }
}