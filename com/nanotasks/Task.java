package com.nanotasks;

import android.content.Context;
import java.lang.ref.WeakReference;

class Task<T> extends AbstractTask<T>
{
  private Completion<T> completion;
  private WeakReference<Context> weakContext;

  Task(Context paramContext, BackgroundWork<T> paramBackgroundWork, Completion<T> paramCompletion)
  {
    super(paramBackgroundWork);
    this.weakContext = new WeakReference(paramContext);
    this.completion = paramCompletion;
  }

  protected void onError(Exception paramException)
  {
    Context localContext = (Context)this.weakContext.get();
    if ((this.completion != null) && (localContext != null))
      this.completion.onError(localContext, paramException);
  }

  protected void onSuccess(T paramT)
  {
    Context localContext = (Context)this.weakContext.get();
    if ((this.completion != null) && (localContext != null))
      this.completion.onSuccess(localContext, paramT);
  }
}