package com.nanotasks;

public abstract interface BackgroundWork<T>
{
  public abstract T doInBackground()
    throws Exception;
}