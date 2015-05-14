package com.nanotasks;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.AsyncTask;
import android.os.Build.VERSION;
import java.util.concurrent.Executor;

public final class Tasks
{
  private Tasks()
  {
    throw new UnsupportedOperationException();
  }

  @TargetApi(11)
  public static <T> void executeInBackground(Context paramContext, BackgroundWork<T> paramBackgroundWork, Completion<T> paramCompletion)
  {
    if (Build.VERSION.SDK_INT >= 11)
    {
      executeInBackground(paramContext, paramBackgroundWork, paramCompletion, AsyncTask.THREAD_POOL_EXECUTOR);
      return;
    }
    new Task(paramContext, paramBackgroundWork, paramCompletion).execute(new Void[0]);
  }

  @TargetApi(11)
  public static <T> void executeInBackground(Context paramContext, BackgroundWork<T> paramBackgroundWork, Completion<T> paramCompletion, Executor paramExecutor)
  {
    if (Build.VERSION.SDK_INT >= 11)
    {
      new Task(paramContext, paramBackgroundWork, paramCompletion).executeOnExecutor(paramExecutor, new Void[0]);
      return;
    }
    throw new RuntimeException("you cannot use a custom executor on pre honeycomb devices");
  }
}