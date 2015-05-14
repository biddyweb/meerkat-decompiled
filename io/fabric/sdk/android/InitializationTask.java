package io.fabric.sdk.android;

import io.fabric.sdk.android.services.common.TimingMetric;
import io.fabric.sdk.android.services.concurrency.Priority;
import io.fabric.sdk.android.services.concurrency.PriorityAsyncTask;

class InitializationTask<Result> extends PriorityAsyncTask<Void, Void, Result>
{
  private static final String TIMING_METRIC_TAG = "KitInitialization";
  final Kit<Result> kit;

  public InitializationTask(Kit<Result> paramKit)
  {
    this.kit = paramKit;
  }

  private TimingMetric createAndStartTimingMetric(String paramString)
  {
    TimingMetric localTimingMetric = new TimingMetric(this.kit.getIdentifier() + "." + paramString, "KitInitialization");
    localTimingMetric.startMeasuring();
    return localTimingMetric;
  }

  protected Result doInBackground(Void[] paramArrayOfVoid)
  {
    TimingMetric localTimingMetric = createAndStartTimingMetric("doInBackground");
    boolean bool = isCancelled();
    Object localObject = null;
    if (!bool)
      localObject = this.kit.doInBackground();
    localTimingMetric.stopMeasuring();
    return localObject;
  }

  public Priority getPriority()
  {
    return Priority.HIGH;
  }

  protected void onCancelled(Result paramResult)
  {
    this.kit.onCancelled(paramResult);
    InitializationException localInitializationException = new InitializationException(this.kit.getIdentifier() + " Initialization was cancelled");
    this.kit.initializationCallback.failure(localInitializationException);
  }

  protected void onPostExecute(Result paramResult)
  {
    this.kit.onPostExecute(paramResult);
    this.kit.initializationCallback.success(paramResult);
  }

  // ERROR //
  protected void onPreExecute()
  {
    // Byte code:
    //   0: aload_0
    //   1: invokespecial 109\011io/fabric/sdk/android/services/concurrency/PriorityAsyncTask:onPreExecute\011()V
    //   4: aload_0
    //   5: ldc 110
    //   7: invokespecial 57\011io/fabric/sdk/android/InitializationTask:createAndStartTimingMetric\011(Ljava/lang/String;)Lio/fabric/sdk/android/services/common/TimingMetric;
    //   10: astore_1
    //   11: aload_0
    //   12: getfield 19\011io/fabric/sdk/android/InitializationTask:kit\011Lio/fabric/sdk/android/Kit;
    //   15: invokevirtual 112\011io/fabric/sdk/android/Kit:onPreExecute\011()Z
    //   18: istore 7
    //   20: aload_1
    //   21: invokevirtual 67\011io/fabric/sdk/android/services/common/TimingMetric:stopMeasuring\011()V
    //   24: iload 7
    //   26: ifne +9 -> 35
    //   29: aload_0
    //   30: iconst_1
    //   31: invokevirtual 116\011io/fabric/sdk/android/InitializationTask:cancel\011(Z)Z
    //   34: pop
    //   35: return
    //   36: astore 6
    //   38: aload 6
    //   40: athrow
    //   41: astore 4
    //   43: aload_1
    //   44: invokevirtual 67\011io/fabric/sdk/android/services/common/TimingMetric:stopMeasuring\011()V
    //   47: iconst_0
    //   48: ifne +9 -> 57
    //   51: aload_0
    //   52: iconst_1
    //   53: invokevirtual 116\011io/fabric/sdk/android/InitializationTask:cancel\011(Z)Z
    //   56: pop
    //   57: aload 4
    //   59: athrow
    //   60: astore_2
    //   61: invokestatic 122\011io/fabric/sdk/android/Fabric:getLogger\011()Lio/fabric/sdk/android/Logger;
    //   64: ldc 124
    //   66: ldc 126
    //   68: aload_2
    //   69: invokeinterface 132 4 0
    //   74: aload_1
    //   75: invokevirtual 67\011io/fabric/sdk/android/services/common/TimingMetric:stopMeasuring\011()V
    //   78: iconst_0
    //   79: ifne -44 -> 35
    //   82: aload_0
    //   83: iconst_1
    //   84: invokevirtual 116\011io/fabric/sdk/android/InitializationTask:cancel\011(Z)Z
    //   87: pop
    //   88: return
    //
    // Exception table:
    //   from\011to\011target\011type
    //   11\01120\01136\011io/fabric/sdk/android/services/concurrency/UnmetDependencyException
    //   11\01120\01141\011finally
    //   38\01141\01141\011finally
    //   61\01174\01141\011finally
    //   11\01120\01160\011java/lang/Exception
  }
}