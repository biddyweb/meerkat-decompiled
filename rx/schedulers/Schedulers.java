package rx.schedulers;

import java.util.concurrent.Executor;
import rx.Scheduler;
import rx.internal.schedulers.EventLoopsScheduler;
import rx.plugins.RxJavaPlugins;
import rx.plugins.RxJavaSchedulersHook;

public final class Schedulers
{
  private static final Schedulers INSTANCE = new Schedulers();
  private final Scheduler computationScheduler;
  private final Scheduler ioScheduler;
  private final Scheduler newThreadScheduler;

  private Schedulers()
  {
    Scheduler localScheduler1 = RxJavaPlugins.getInstance().getSchedulersHook().getComputationScheduler();
    Scheduler localScheduler2;
    if (localScheduler1 != null)
    {
      this.computationScheduler = localScheduler1;
      localScheduler2 = RxJavaPlugins.getInstance().getSchedulersHook().getIOScheduler();
      if (localScheduler2 == null)
        break label76;
    }
    label76: for (this.ioScheduler = localScheduler2; ; this.ioScheduler = new CachedThreadScheduler())
    {
      Scheduler localScheduler3 = RxJavaPlugins.getInstance().getSchedulersHook().getNewThreadScheduler();
      if (localScheduler3 == null)
        break label90;
      this.newThreadScheduler = localScheduler3;
      return;
      this.computationScheduler = new EventLoopsScheduler();
      break;
    }
    label90: this.newThreadScheduler = NewThreadScheduler.instance();
  }

  public static Scheduler computation()
  {
    return INSTANCE.computationScheduler;
  }

  public static Scheduler from(Executor paramExecutor)
  {
    return new ExecutorScheduler(paramExecutor);
  }

  public static Scheduler immediate()
  {
    return ImmediateScheduler.instance();
  }

  public static Scheduler io()
  {
    return INSTANCE.ioScheduler;
  }

  public static Scheduler newThread()
  {
    return INSTANCE.newThreadScheduler;
  }

  public static TestScheduler test()
  {
    return new TestScheduler();
  }

  public static Scheduler trampoline()
  {
    return TrampolineScheduler.instance();
  }
}