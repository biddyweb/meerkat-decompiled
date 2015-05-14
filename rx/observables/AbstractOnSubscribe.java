package rx.observables;

import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Producer;
import rx.Subscriber;
import rx.Subscription;
import rx.annotations.Experimental;
import rx.exceptions.CompositeException;
import rx.functions.Action1;
import rx.functions.Actions;
import rx.functions.Func1;

@Experimental
public abstract class AbstractOnSubscribe<T, S>
  implements Observable.OnSubscribe<T>
{
  private static final Func1<Object, Object> NULL_FUNC1 = new Func1()
  {
    public Object call(Object paramAnonymousObject)
    {
      return null;
    }
  };

  public static <T, S> AbstractOnSubscribe<T, S> create(Action1<SubscriptionState<T, S>> paramAction1)
  {
    return create(paramAction1, NULL_FUNC1, Actions.empty());
  }

  public static <T, S> AbstractOnSubscribe<T, S> create(Action1<SubscriptionState<T, S>> paramAction1, Func1<? super Subscriber<? super T>, ? extends S> paramFunc1)
  {
    return create(paramAction1, paramFunc1, Actions.empty());
  }

  public static <T, S> AbstractOnSubscribe<T, S> create(Action1<SubscriptionState<T, S>> paramAction1, Func1<? super Subscriber<? super T>, ? extends S> paramFunc1, Action1<? super S> paramAction11)
  {
    return new LambdaOnSubscribe(paramAction1, paramFunc1, paramAction11, null);
  }

  public final void call(Subscriber<? super T> paramSubscriber)
  {
    SubscriptionState localSubscriptionState = new SubscriptionState(this, paramSubscriber, onSubscribe(paramSubscriber), null);
    paramSubscriber.add(new SubscriptionCompleter(localSubscriptionState, null));
    paramSubscriber.setProducer(new SubscriptionProducer(localSubscriptionState, null));
  }

  protected abstract void next(SubscriptionState<T, S> paramSubscriptionState);

  protected S onSubscribe(Subscriber<? super T> paramSubscriber)
  {
    return null;
  }

  protected void onTerminated(S paramS)
  {
  }

  public final Observable<T> toObservable()
  {
    return Observable.create(this);
  }

  private static final class LambdaOnSubscribe<T, S> extends AbstractOnSubscribe<T, S>
  {
    final Action1<AbstractOnSubscribe.SubscriptionState<T, S>> next;
    final Func1<? super Subscriber<? super T>, ? extends S> onSubscribe;
    final Action1<? super S> onTerminated;

    private LambdaOnSubscribe(Action1<AbstractOnSubscribe.SubscriptionState<T, S>> paramAction1, Func1<? super Subscriber<? super T>, ? extends S> paramFunc1, Action1<? super S> paramAction11)
    {
      this.next = paramAction1;
      this.onSubscribe = paramFunc1;
      this.onTerminated = paramAction11;
    }

    protected void next(AbstractOnSubscribe.SubscriptionState<T, S> paramSubscriptionState)
    {
      this.next.call(paramSubscriptionState);
    }

    protected S onSubscribe(Subscriber<? super T> paramSubscriber)
    {
      return this.onSubscribe.call(paramSubscriber);
    }

    protected void onTerminated(S paramS)
    {
      this.onTerminated.call(paramS);
    }
  }

  private static final class SubscriptionCompleter<T, S> extends AtomicBoolean
    implements Subscription
  {
    private static final long serialVersionUID = 7993888274897325004L;
    private final AbstractOnSubscribe.SubscriptionState<T, S> state;

    private SubscriptionCompleter(AbstractOnSubscribe.SubscriptionState<T, S> paramSubscriptionState)
    {
      this.state = paramSubscriptionState;
    }

    public boolean isUnsubscribed()
    {
      return get();
    }

    public void unsubscribe()
    {
      if (compareAndSet(false, true))
        this.state.free();
    }
  }

  private static final class SubscriptionProducer<T, S>
    implements Producer
  {
    final AbstractOnSubscribe.SubscriptionState<T, S> state;

    private SubscriptionProducer(AbstractOnSubscribe.SubscriptionState<T, S> paramSubscriptionState)
    {
      this.state = paramSubscriptionState;
    }

    protected boolean doNext()
    {
      if (this.state.use());
      try
      {
        int i = this.state.phase();
        AbstractOnSubscribe.SubscriptionState.access$600(this.state).next(this.state);
        if (!this.state.verify())
          throw new IllegalStateException("No event produced or stop called @ Phase: " + i + " -> " + this.state.phase() + ", Calls: " + this.state.calls());
      }
      catch (Throwable localThrowable)
      {
        this.state.terminate();
        AbstractOnSubscribe.SubscriptionState.access$400(this.state).onError(localThrowable);
        return false;
        if ((this.state.accept()) || (this.state.stopRequested()))
        {
          this.state.terminate();
          return false;
        }
        AbstractOnSubscribe.SubscriptionState.access$708(this.state);
        return true;
      }
      finally
      {
        this.state.free();
      }
    }

    public void request(long paramLong)
    {
      if (paramLong == 9223372036854775807L)
        while ((!AbstractOnSubscribe.SubscriptionState.access$400(this.state).isUnsubscribed()) && (doNext()));
      do
        do
        {
          return;
          while ((paramLong <= 0L) || (AbstractOnSubscribe.SubscriptionState.access$500(this.state).getAndAdd(paramLong) != 0L) || (AbstractOnSubscribe.SubscriptionState.access$400(this.state).isUnsubscribed()));
        }
        while ((!doNext()) || (AbstractOnSubscribe.SubscriptionState.access$500(this.state).decrementAndGet() <= 0L));
      while (!AbstractOnSubscribe.SubscriptionState.access$400(this.state).isUnsubscribed());
    }
  }

  public static final class SubscriptionState<T, S>
  {
    private long calls;
    private boolean hasCompleted;
    private boolean hasOnNext;
    private final AtomicInteger inUse;
    private final AbstractOnSubscribe<T, S> parent;
    private int phase;
    private final AtomicLong requestCount;
    private final S state;
    private boolean stopRequested;
    private final Subscriber<? super T> subscriber;
    private Throwable theException;
    private T theValue;

    private SubscriptionState(AbstractOnSubscribe<T, S> paramAbstractOnSubscribe, Subscriber<? super T> paramSubscriber, S paramS)
    {
      this.parent = paramAbstractOnSubscribe;
      this.subscriber = paramSubscriber;
      this.state = paramS;
      this.requestCount = new AtomicLong();
      this.inUse = new AtomicInteger(1);
    }

    protected boolean accept()
    {
      Object localObject;
      if (this.hasOnNext)
      {
        localObject = this.theValue;
        this.theValue = null;
        this.hasOnNext = false;
      }
      try
      {
        this.subscriber.onNext(localObject);
        if (!this.hasCompleted)
          break label134;
        Throwable localThrowable1 = this.theException;
        this.theException = null;
        if (localThrowable1 != null)
        {
          this.subscriber.onError(localThrowable1);
          return true;
        }
      }
      catch (Throwable localThrowable2)
      {
        this.hasCompleted = true;
        Throwable localThrowable3 = this.theException;
        this.theException = null;
        if (localThrowable3 == null)
        {
          this.subscriber.onError(localThrowable2);
          return true;
        }
        this.subscriber.onError(new CompositeException(Arrays.asList(new Throwable[] { localThrowable2, localThrowable3 })));
        return true;
      }
      this.subscriber.onCompleted();
      return true;
      label134: return false;
    }

    public void advancePhase()
    {
      advancePhaseBy(1);
    }

    public void advancePhaseBy(int paramInt)
    {
      this.phase = (paramInt + this.phase);
    }

    public long calls()
    {
      return this.calls;
    }

    protected void free()
    {
      if (this.inUse.get() <= 0);
      while (this.inUse.decrementAndGet() != 0)
        return;
      this.parent.onTerminated(this.state);
    }

    public void onCompleted()
    {
      if (this.hasCompleted)
        throw new IllegalStateException("Already terminated", this.theException);
      this.hasCompleted = true;
    }

    public void onError(Throwable paramThrowable)
    {
      if (paramThrowable == null)
        throw new NullPointerException("e != null required");
      if (this.hasCompleted)
        throw new IllegalStateException("Already terminated", this.theException);
      this.theException = paramThrowable;
      this.hasCompleted = true;
    }

    public void onNext(T paramT)
    {
      if (this.hasOnNext)
        throw new IllegalStateException("onNext not consumed yet!");
      if (this.hasCompleted)
        throw new IllegalStateException("Already terminated", this.theException);
      this.theValue = paramT;
      this.hasOnNext = true;
    }

    public int phase()
    {
      return this.phase;
    }

    public void phase(int paramInt)
    {
      this.phase = paramInt;
    }

    public S state()
    {
      return this.state;
    }

    public void stop()
    {
      this.stopRequested = true;
    }

    protected boolean stopRequested()
    {
      return this.stopRequested;
    }

    protected void terminate()
    {
      int i;
      do
      {
        i = this.inUse.get();
        if (i <= 0)
          return;
      }
      while (!this.inUse.compareAndSet(i, 0));
      this.parent.onTerminated(this.state);
    }

    protected boolean use()
    {
      int i = 1;
      int j = this.inUse.get();
      if (j == 0)
        i = 0;
      while ((j == i) && (this.inUse.compareAndSet(i, 2)))
        return i;
      throw new IllegalStateException("This is not reentrant nor threadsafe!");
    }

    protected boolean verify()
    {
      return (this.hasOnNext) || (this.hasCompleted) || (this.stopRequested);
    }
  }
}