package com.nanotasks;

import android.os.AsyncTask;
import android.util.Log;

abstract class AbstractTask<T> extends AsyncTask<Void, Void, T>
{
  private BackgroundWork<T> backgroundWork;
  private Exception exception;

  AbstractTask(BackgroundWork<T> paramBackgroundWork)
  {
    this.backgroundWork = paramBackgroundWork;
  }

  protected final T doInBackground(Void[] paramArrayOfVoid)
  {
    try
    {
      Object localObject = this.backgroundWork.doInBackground();
      return localObject;
    }
    catch (Exception localException)
    {
      this.exception = localException;
    }
    return null;
  }

  protected abstract void onError(Exception paramException);

  protected final void onPostExecute(T paramT)
  {
    if (!isCancelled())
    {
      if (this.exception == null)
        onSuccess(paramT);
    }
    else
      return;
    Log.w(getClass().getSimpleName(), this.exception);
    onError(this.exception);
  }

  protected abstract void onSuccess(T paramT);
}