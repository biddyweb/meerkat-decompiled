package com.google.common.util.concurrent;

import java.util.concurrent.Executor;

 enum MoreExecutors$DirectExecutor
  implements Executor
{
  static
  {
    DirectExecutor[] arrayOfDirectExecutor = new DirectExecutor[1];
    arrayOfDirectExecutor[0] = INSTANCE;
  }

  public void execute(Runnable paramRunnable)
  {
    paramRunnable.run();
  }
}