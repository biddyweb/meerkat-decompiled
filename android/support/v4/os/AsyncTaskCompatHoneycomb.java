package android.support.v4.os;

import android.os.AsyncTask;

class AsyncTaskCompatHoneycomb
{
  static <Params, Progress, Result> void executeParallel(AsyncTask<Params, Progress, Result> paramAsyncTask, Params[] paramArrayOfParams)
  {
    paramAsyncTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, paramArrayOfParams);
  }
}