package rx.internal.operators;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.exceptions.CompositeException;
import rx.exceptions.MissingBackpressureException;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;
import rx.internal.util.RxRingBuffer;
import rx.internal.util.ScalarSynchronousObservable;
import rx.internal.util.SubscriptionIndexedRingBuffer;

public class OperatorMerge<T>
  implements Observable.Operator<T, Observable<? extends T>>
{
  private final boolean delayErrors;

  private OperatorMerge()
  {
    this.delayErrors = false;
  }

  private OperatorMerge(boolean paramBoolean)
  {
    this.delayErrors = paramBoolean;
  }

  public static <T> OperatorMerge<T> instance(boolean paramBoolean)
  {
    if (paramBoolean)
      return HolderDelayErrors.INSTANCE;
    return HolderNoDelay.INSTANCE;
  }

  public Subscriber<Observable<? extends T>> call(Subscriber<? super T> paramSubscriber)
  {
    return new MergeSubscriber(paramSubscriber, this.delayErrors);
  }

  private static final class HolderDelayErrors
  {
    static final OperatorMerge<Object> INSTANCE = new OperatorMerge(true, null);
  }

  private static final class HolderNoDelay
  {
    static final OperatorMerge<Object> INSTANCE = new OperatorMerge(false, null);
  }

  private static final class InnerSubscriber<T> extends Subscriber<T>
  {
    static final AtomicIntegerFieldUpdater<InnerSubscriber> ONCE_TERMINATED = AtomicIntegerFieldUpdater.newUpdater(InnerSubscriber.class, "terminated");
    final OperatorMerge.MergeSubscriber<T> parentSubscriber;
    final OperatorMerge.MergeProducer<T> producer;
    private final RxRingBuffer q = RxRingBuffer.getSpscInstance();
    public int sindex;
    volatile int terminated;

    public InnerSubscriber(OperatorMerge.MergeSubscriber<T> paramMergeSubscriber, OperatorMerge.MergeProducer<T> paramMergeProducer)
    {
      this.parentSubscriber = paramMergeSubscriber;
      this.producer = paramMergeProducer;
      add(this.q);
      request(this.q.capacity());
    }

    private int drainAll()
    {
      int i = 0;
      while (true)
      {
        Object localObject = this.q.poll();
        if (localObject == null)
          break;
        if (this.q.isCompleted(localObject))
          this.parentSubscriber.completeInner(this);
        else
          try
          {
            boolean bool = this.q.accept(localObject, this.parentSubscriber.actual);
            if (!bool)
              i++;
          }
          catch (Throwable localThrowable)
          {
            onError(OnErrorThrowable.addValueAsLastCause(localThrowable, localObject));
          }
      }
      return i;
    }

    private int drainQueue()
    {
      if (this.producer != null)
        return drainRequested();
      return drainAll();
    }

    private int drainRequested()
    {
      int i = 0;
      long l = OperatorMerge.MergeProducer.access$100(this.producer);
      int j = 0;
      Object localObject;
      if (j < l)
      {
        localObject = this.q.poll();
        if (localObject != null);
      }
      else
      {
        OperatorMerge.MergeProducer.REQUESTED.getAndAdd(this.producer, -i);
        return i;
      }
      if (this.q.isCompleted(localObject))
        this.parentSubscriber.completeInner(this);
      while (true)
      {
        j++;
        break;
        try
        {
          boolean bool = this.q.accept(localObject, this.parentSubscriber.actual);
          if (!bool)
            i++;
        }
        catch (Throwable localThrowable)
        {
          onError(OnErrorThrowable.addValueAsLastCause(localThrowable, localObject));
        }
      }
    }

    private void emit(T paramT, boolean paramBoolean)
    {
      int i = 1;
      boolean bool1 = OperatorMerge.MergeSubscriber.access$1000(this.parentSubscriber);
      boolean bool2 = false;
      if (bool1)
        i = 0;
      while (true)
      {
        long l;
        try
        {
          l = 0L + drainQueue();
          if (this.producer == null)
          {
            if (paramBoolean)
            {
              this.parentSubscriber.completeInner(this);
              bool2 = OperatorMerge.MergeSubscriber.access$1100(this.parentSubscriber);
              if (l > 0L)
                request(l);
              if (i != 0)
              {
                enqueue(paramT, paramBoolean);
                bool2 = true;
              }
              if (bool2);
              return;
            }
            try
            {
              this.parentSubscriber.actual.onNext(paramT);
              l += 1L;
              i = 0;
            }
            catch (Throwable localThrowable1)
            {
              onError(OnErrorThrowable.addValueAsLastCause(localThrowable1, paramT));
              continue;
            }
          }
        }
        finally
        {
          OperatorMerge.MergeSubscriber.access$1100(this.parentSubscriber);
        }
        if ((OperatorMerge.MergeProducer.access$100(this.producer) > 0L) && (this.q.count() == 0))
        {
          if (paramBoolean)
          {
            this.parentSubscriber.completeInner(this);
            i = 0;
          }
          else
          {
            try
            {
              this.parentSubscriber.actual.onNext(paramT);
              l += 1L;
              OperatorMerge.MergeProducer.REQUESTED.decrementAndGet(this.producer);
              i = 0;
            }
            catch (Throwable localThrowable2)
            {
              while (true)
                onError(OnErrorThrowable.addValueAsLastCause(localThrowable2, paramT));
            }
          }
        }
        else
          i = 1;
      }
    }

    private void enqueue(T paramT, boolean paramBoolean)
    {
      if (paramBoolean);
      try
      {
        this.q.onCompleted();
        return;
        this.q.onNext(paramT);
        return;
      }
      catch (MissingBackpressureException localMissingBackpressureException)
      {
        onError(localMissingBackpressureException);
      }
    }

    public void onCompleted()
    {
      if (ONCE_TERMINATED.compareAndSet(this, 0, 1))
        emit(null, true);
    }

    public void onError(Throwable paramThrowable)
    {
      if (ONCE_TERMINATED.compareAndSet(this, 0, 1))
        OperatorMerge.MergeSubscriber.access$900(this.parentSubscriber, paramThrowable, false);
    }

    public void onNext(T paramT)
    {
      emit(paramT, false);
    }

    public void requestMore(long paramLong)
    {
      request(paramLong);
    }
  }

  private static final class MergeProducer<T>
    implements Producer
  {
    static final AtomicLongFieldUpdater<MergeProducer> REQUESTED = AtomicLongFieldUpdater.newUpdater(MergeProducer.class, "requested");
    private final OperatorMerge.MergeSubscriber<T> ms;
    private volatile long requested = 0L;

    public MergeProducer(OperatorMerge.MergeSubscriber<T> paramMergeSubscriber)
    {
      this.ms = paramMergeSubscriber;
    }

    public void request(long paramLong)
    {
      if (this.requested == 9223372036854775807L);
      while (true)
      {
        return;
        if (paramLong == 9223372036854775807L)
        {
          this.requested = 9223372036854775807L;
          return;
        }
        BackpressureUtils.getAndAddRequest(REQUESTED, this, paramLong);
        if (!OperatorMerge.MergeSubscriber.access$500(this.ms))
          continue;
        synchronized (this.ms)
        {
          int i = OperatorMerge.MergeSubscriber.access$600(this.ms);
          int j = 0;
          if (i == 0)
          {
            RxRingBuffer localRxRingBuffer = OperatorMerge.MergeSubscriber.access$700(this.ms);
            j = 0;
            if (localRxRingBuffer != null)
            {
              boolean bool = OperatorMerge.MergeSubscriber.access$700(this.ms).isEmpty();
              j = 0;
              if (bool)
                j = 1;
            }
          }
          if (j == 0)
            continue;
          OperatorMerge.MergeSubscriber.access$800(this.ms);
          return;
        }
      }
    }
  }

  private static final class MergeSubscriber<T> extends Subscriber<Observable<? extends T>>
  {
    final Func1<OperatorMerge.InnerSubscriber<T>, Boolean> DRAIN_ACTION = new Func1()
    {
      public Boolean call(OperatorMerge.InnerSubscriber<T> paramAnonymousInnerSubscriber)
      {
        if (paramAnonymousInnerSubscriber.q != null)
        {
          long l = OperatorMerge.MergeSubscriber.access$300(OperatorMerge.MergeSubscriber.this).requested;
          int i = paramAnonymousInnerSubscriber.drainQueue();
          if (i > 0)
            paramAnonymousInnerSubscriber.requestMore(i);
          if (i == l)
            return Boolean.FALSE;
        }
        return Boolean.TRUE;
      }
    };
    final Subscriber<? super T> actual;
    private volatile SubscriptionIndexedRingBuffer<OperatorMerge.InnerSubscriber<T>> childrenSubscribers;
    private boolean completed;
    private final boolean delayErrors;
    private boolean emitLock = false;
    private ConcurrentLinkedQueue<Throwable> exceptions;
    int lastDrainedIndex = 0;
    private final OperatorMerge.MergeProducer<T> mergeProducer;
    private int missedEmitting = 0;
    final NotificationLite<T> on = NotificationLite.instance();
    private volatile RxRingBuffer scalarValueQueue = null;
    private int wip;

    public MergeSubscriber(Subscriber<? super T> paramSubscriber, boolean paramBoolean)
    {
      super();
      this.actual = paramSubscriber;
      this.mergeProducer = new OperatorMerge.MergeProducer(this);
      this.delayErrors = paramBoolean;
      paramSubscriber.add(this);
      paramSubscriber.setProducer(this.mergeProducer);
    }

    private void drainAndComplete()
    {
      int i = 1;
      if (i != 0)
        while (true)
        {
          try
          {
            while (true)
            {
              this.missedEmitting = 0;
              drainScalarValueQueue();
              drainChildrenQueues();
              try
              {
                if (this.missedEmitting > 0)
                {
                  i = 1;
                  break;
                }
              }
              finally
              {
              }
            }
          }
          finally
          {
          }
          i = 0;
        }
      RxRingBuffer localRxRingBuffer = this.scalarValueQueue;
      if ((localRxRingBuffer == null) || (localRxRingBuffer.isEmpty()))
      {
        if (!this.delayErrors);
      }
      else
      {
        ConcurrentLinkedQueue localConcurrentLinkedQueue;
        try
        {
          localConcurrentLinkedQueue = this.exceptions;
          if (localConcurrentLinkedQueue == null)
            break label166;
          if (localConcurrentLinkedQueue.isEmpty())
          {
            this.actual.onCompleted();
            return;
          }
        }
        finally
        {
        }
        if (localConcurrentLinkedQueue.size() == 1)
        {
          this.actual.onError((Throwable)localConcurrentLinkedQueue.poll());
          return;
        }
        this.actual.onError(new CompositeException(localConcurrentLinkedQueue));
        return;
        label166: this.actual.onCompleted();
        return;
      }
      this.actual.onCompleted();
    }

    private void drainChildrenQueues()
    {
      if (this.childrenSubscribers != null)
        this.lastDrainedIndex = this.childrenSubscribers.forEach(this.DRAIN_ACTION, this.lastDrainedIndex);
    }

    private boolean drainQueuesIfNeeded()
    {
      while (getEmitLock())
        try
        {
          int i = drainScalarValueQueue();
          drainChildrenQueues();
          boolean bool = releaseEmitLock();
          if (i > 0)
            request(i);
          if (!bool)
            return true;
        }
        finally
        {
          releaseEmitLock();
        }
      return false;
    }

    private int drainScalarValueQueue()
    {
      RxRingBuffer localRxRingBuffer = this.scalarValueQueue;
      if (localRxRingBuffer != null)
      {
        long l = this.mergeProducer.requested;
        int i = 0;
        if (l < 0L)
          while (true)
          {
            Object localObject2 = localRxRingBuffer.poll();
            if (localObject2 == null)
              break;
            this.on.accept(this.actual, localObject2);
            i++;
          }
        boolean bool = l < 0L;
        i = 0;
        if (bool);
        for (int j = 0; ; j++)
        {
          Object localObject1;
          if (j < l)
          {
            localObject1 = localRxRingBuffer.poll();
            if (localObject1 != null);
          }
          else
          {
            OperatorMerge.MergeProducer.REQUESTED.getAndAdd(this.mergeProducer, -i);
            return i;
          }
          this.on.accept(this.actual, localObject1);
          i++;
        }
      }
      return 0;
    }

    private boolean getEmitLock()
    {
      boolean bool = false;
      try
      {
        if (this.emitLock)
          this.missedEmitting = (1 + this.missedEmitting);
        while (true)
        {
          return bool;
          this.emitLock = true;
          this.missedEmitting = 0;
          bool = true;
        }
      }
      finally
      {
      }
    }

    private RxRingBuffer getOrCreateScalarValueQueue()
    {
      RxRingBuffer localRxRingBuffer = this.scalarValueQueue;
      if (localRxRingBuffer == null)
      {
        localRxRingBuffer = RxRingBuffer.getSpscInstance();
        this.scalarValueQueue = localRxRingBuffer;
      }
      return localRxRingBuffer;
    }

    private void handleNewSource(Observable<? extends T> paramObservable)
    {
      if (this.childrenSubscribers == null)
      {
        this.childrenSubscribers = new SubscriptionIndexedRingBuffer();
        add(this.childrenSubscribers);
      }
      boolean bool = this.mergeProducer.requested < 9223372036854775807L;
      OperatorMerge.MergeProducer localMergeProducer = null;
      if (bool)
        localMergeProducer = this.mergeProducer;
      OperatorMerge.InnerSubscriber localInnerSubscriber = new OperatorMerge.InnerSubscriber(this, localMergeProducer);
      localInnerSubscriber.sindex = this.childrenSubscribers.add(localInnerSubscriber);
      paramObservable.unsafeSubscribe(localInnerSubscriber);
      if (!isUnsubscribed())
        request(1L);
    }

    private void handleScalarSynchronousObservable(ScalarSynchronousObservable<? extends T> paramScalarSynchronousObservable)
    {
      if (this.mergeProducer.requested == 9223372036854775807L)
      {
        handleScalarSynchronousObservableWithoutRequestLimits(paramScalarSynchronousObservable);
        return;
      }
      handleScalarSynchronousObservableWithRequestLimits(paramScalarSynchronousObservable);
    }

    private void handleScalarSynchronousObservableWithRequestLimits(ScalarSynchronousObservable<? extends T> paramScalarSynchronousObservable)
    {
      if (getEmitLock())
        try
        {
          boolean bool = this.mergeProducer.requested < 0L;
          int i = 0;
          int j = 0;
          if (bool)
          {
            i = 1;
            this.actual.onNext(paramScalarSynchronousObservable.get());
            OperatorMerge.MergeProducer.REQUESTED.decrementAndGet(this.mergeProducer);
            j = 1;
          }
          if (releaseEmitLock())
            drainQueuesIfNeeded();
          if (i != 0)
            request(1L);
          if (j != 0)
            return;
        }
        finally
        {
          releaseEmitLock();
        }
      try
      {
        getOrCreateScalarValueQueue().onNext(paramScalarSynchronousObservable.get());
        return;
      }
      catch (MissingBackpressureException localMissingBackpressureException)
      {
        onError(localMissingBackpressureException);
      }
    }

    private void handleScalarSynchronousObservableWithoutRequestLimits(ScalarSynchronousObservable<? extends T> paramScalarSynchronousObservable)
    {
      Object localObject1 = paramScalarSynchronousObservable.get();
      if (getEmitLock())
        try
        {
          this.actual.onNext(localObject1);
          if (releaseEmitLock())
            drainQueuesIfNeeded();
          request(1L);
          return;
        }
        finally
        {
          releaseEmitLock();
        }
      try
      {
        getOrCreateScalarValueQueue().onNext(localObject1);
        return;
      }
      catch (MissingBackpressureException localMissingBackpressureException)
      {
        onError(localMissingBackpressureException);
      }
    }

    // ERROR //
    private void innerError(Throwable paramThrowable, boolean paramBoolean)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 70\011rx/internal/operators/OperatorMerge$MergeSubscriber:delayErrors\011Z
      //   4: ifeq +105 -> 109
      //   7: aload_0
      //   8: monitorenter
      //   9: aload_0
      //   10: getfield 125\011rx/internal/operators/OperatorMerge$MergeSubscriber:exceptions\011Ljava/util/concurrent/ConcurrentLinkedQueue;
      //   13: ifnonnull +14 -> 27
      //   16: aload_0
      //   17: new 241\011java/util/concurrent/ConcurrentLinkedQueue
      //   20: dup
      //   21: invokespecial 242\011java/util/concurrent/ConcurrentLinkedQueue:<init>\011()V
      //   24: putfield 125\011rx/internal/operators/OperatorMerge$MergeSubscriber:exceptions\011Ljava/util/concurrent/ConcurrentLinkedQueue;
      //   27: aload_0
      //   28: monitorexit
      //   29: aload_0
      //   30: getfield 125\011rx/internal/operators/OperatorMerge$MergeSubscriber:exceptions\011Ljava/util/concurrent/ConcurrentLinkedQueue;
      //   33: aload_1
      //   34: invokevirtual 245\011java/util/concurrent/ConcurrentLinkedQueue:add\011(Ljava/lang/Object;)Z
      //   37: pop
      //   38: aload_0
      //   39: monitorenter
      //   40: iload_2
      //   41: ifne +13 -> 54
      //   44: aload_0
      //   45: iconst_m1
      //   46: aload_0
      //   47: getfield 98\011rx/internal/operators/OperatorMerge$MergeSubscriber:wip\011I
      //   50: iadd
      //   51: putfield 98\011rx/internal/operators/OperatorMerge$MergeSubscriber:wip\011I
      //   54: aload_0
      //   55: getfield 98\011rx/internal/operators/OperatorMerge$MergeSubscriber:wip\011I
      //   58: ifne +10 -> 68
      //   61: aload_0
      //   62: getfield 247\011rx/internal/operators/OperatorMerge$MergeSubscriber:completed\011Z
      //   65: ifne +53 -> 118
      //   68: aload_0
      //   69: getfield 98\011rx/internal/operators/OperatorMerge$MergeSubscriber:wip\011I
      //   72: istore 6
      //   74: iconst_0
      //   75: istore 7
      //   77: iload 6
      //   79: ifge +6 -> 85
      //   82: goto +36 -> 118
      //   85: aload_0
      //   86: monitorexit
      //   87: iload 7
      //   89: ifeq +7 -> 96
      //   92: aload_0
      //   93: invokespecial 105\011rx/internal/operators/OperatorMerge$MergeSubscriber:drainAndComplete\011()V
      //   96: return
      //   97: astore_3
      //   98: aload_0
      //   99: monitorexit
      //   100: aload_3
      //   101: athrow
      //   102: astore 5
      //   104: aload_0
      //   105: monitorexit
      //   106: aload 5
      //   108: athrow
      //   109: aload_0
      //   110: getfield 63\011rx/internal/operators/OperatorMerge$MergeSubscriber:actual\011Lrx/Subscriber;
      //   113: aload_1
      //   114: invokevirtual 144\011rx/Subscriber:onError\011(Ljava/lang/Throwable;)V
      //   117: return
      //   118: iconst_1
      //   119: istore 7
      //   121: goto -36 -> 85
      //
      // Exception table:
      //   from\011to\011target\011type
      //   9\01127\01197\011finally
      //   27\01129\01197\011finally
      //   98\011100\01197\011finally
      //   44\01154\011102\011finally
      //   54\01168\011102\011finally
      //   68\01174\011102\011finally
      //   85\01187\011102\011finally
      //   104\011106\011102\011finally
    }

    private boolean releaseEmitLock()
    {
      try
      {
        this.emitLock = false;
        int i = this.missedEmitting;
        boolean bool = false;
        if (i == 0)
          return bool;
        bool = true;
      }
      finally
      {
      }
    }

    void completeInner(OperatorMerge.InnerSubscriber<T> paramInnerSubscriber)
    {
      try
      {
        this.wip = (-1 + this.wip);
        int i = this.wip;
        int j = 0;
        if (i == 0)
        {
          boolean bool = this.completed;
          j = 0;
          if (bool)
            j = 1;
        }
        this.childrenSubscribers.remove(paramInnerSubscriber.sindex);
        if (j != 0)
          drainAndComplete();
        return;
      }
      finally
      {
      }
    }

    public void onCompleted()
    {
      try
      {
        this.completed = true;
        int i = this.wip;
        int j = 0;
        if (i == 0)
          j = 1;
        if (j != 0)
          drainAndComplete();
        return;
      }
      finally
      {
      }
    }

    public void onError(Throwable paramThrowable)
    {
      if (!this.completed)
      {
        this.completed = true;
        innerError(paramThrowable, true);
      }
    }

    public void onNext(Observable<? extends T> paramObservable)
    {
      if ((paramObservable instanceof ScalarSynchronousObservable))
        handleScalarSynchronousObservable((ScalarSynchronousObservable)paramObservable);
      while ((paramObservable == null) || (isUnsubscribed()))
        return;
      try
      {
        this.wip = (1 + this.wip);
        handleNewSource(paramObservable);
        return;
      }
      finally
      {
      }
    }

    public void onStart()
    {
      request(RxRingBuffer.SIZE);
    }
  }
}