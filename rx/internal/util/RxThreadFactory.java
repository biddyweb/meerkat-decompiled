package rx.internal.util;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;

public final class RxThreadFactory
  implements ThreadFactory
{
  static final AtomicLongFieldUpdater<RxThreadFactory> COUNTER_UPDATER = AtomicLongFieldUpdater.newUpdater(RxThreadFactory.class, "counter");
  volatile long counter;
  final String prefix;

  public RxThreadFactory(String paramString)
  {
    this.prefix = paramString;
  }

  public Thread newThread(Runnable paramRunnable)
  {
    Thread localThread = new Thread(paramRunnable, this.prefix + COUNTER_UPDATER.incrementAndGet(this));
    localThread.setDaemon(true);
    return localThread;
  }
}