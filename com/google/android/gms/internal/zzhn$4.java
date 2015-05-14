package com.google.android.gms.internal;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

final class zzhn$4
  implements ThreadFactory
{
  private final AtomicInteger zzzp = new AtomicInteger(1);

  public Thread newThread(Runnable paramRunnable)
  {
    return new Thread(paramRunnable, "AdWorker #" + this.zzzp.getAndIncrement());
  }
}