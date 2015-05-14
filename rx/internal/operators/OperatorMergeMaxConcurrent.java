package rx.internal.operators;

import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;
import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.exceptions.MissingBackpressureException;
import rx.internal.util.RxRingBuffer;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;

public final class OperatorMergeMaxConcurrent<T>
  implements Observable.Operator<T, Observable<? extends T>>
{
  final int maxConcurrency;

  public OperatorMergeMaxConcurrent(int paramInt)
  {
    this.maxConcurrency = paramInt;
  }

  public Subscriber<? super Observable<? extends T>> call(Subscriber<? super T> paramSubscriber)
  {
    SerializedSubscriber localSerializedSubscriber = new SerializedSubscriber(paramSubscriber);
    CompositeSubscription localCompositeSubscription = new CompositeSubscription();
    paramSubscriber.add(localCompositeSubscription);
    SourceSubscriber localSourceSubscriber = new SourceSubscriber(this.maxConcurrency, localSerializedSubscriber, localCompositeSubscription);
    paramSubscriber.setProducer(new MergeMaxConcurrentProducer(localSourceSubscriber));
    return localSourceSubscriber;
  }

  static final class MergeMaxConcurrentProducer<T>
    implements Producer
  {
    final OperatorMergeMaxConcurrent.SourceSubscriber<T> ssub;

    public MergeMaxConcurrentProducer(OperatorMergeMaxConcurrent.SourceSubscriber<T> paramSourceSubscriber)
    {
      this.ssub = paramSourceSubscriber;
    }

    public void request(long paramLong)
    {
      this.ssub.downstreamRequest(paramLong);
    }
  }

  static final class SourceSubscriber<T> extends Subscriber<Observable<? extends T>>
  {
    static final AtomicLongFieldUpdater<SourceSubscriber> REQUESTED = AtomicLongFieldUpdater.newUpdater(SourceSubscriber.class, "requested");
    static final AtomicIntegerFieldUpdater<SourceSubscriber> SOURCE_INDEX;
    static final AtomicIntegerFieldUpdater<SourceSubscriber> WIP = AtomicIntegerFieldUpdater.newUpdater(SourceSubscriber.class, "wip");
    int active;
    final CompositeSubscription csub;
    boolean emitting;
    final Object guard;
    int lastIndex;
    final int maxConcurrency;
    int missedEmitting;
    final NotificationLite<T> nl = NotificationLite.instance();
    final Queue<Observable<? extends T>> queue;
    volatile long requested;
    final Subscriber<T> s;
    volatile int sourceIndex;
    final List<SourceSubscriber<T>.MergeItemSubscriber> subscribers;
    volatile int wip;

    static
    {
      SOURCE_INDEX = AtomicIntegerFieldUpdater.newUpdater(SourceSubscriber.class, "sourceIndex");
    }

    public SourceSubscriber(int paramInt, Subscriber<T> paramSubscriber, CompositeSubscription paramCompositeSubscription)
    {
      super();
      this.maxConcurrency = paramInt;
      this.s = paramSubscriber;
      this.csub = paramCompositeSubscription;
      this.guard = new Object();
      this.queue = new ArrayDeque(paramInt);
      this.subscribers = Collections.synchronizedList(new ArrayList());
      this.wip = 1;
    }

    protected void downstreamRequest(long paramLong)
    {
      long l1 = this.requested;
      long l2;
      if ((l1 != 9223372036854775807L) && (paramLong == 9223372036854775807L))
        l2 = 9223372036854775807L;
      while (REQUESTED.compareAndSet(this, l1, l2))
      {
        drain();
        return;
        if (l1 + paramLong < 0L)
          l2 = 9223372036854775807L;
        else
          l2 = l1 + paramLong;
      }
    }

    // ERROR //
    protected void drain()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 121\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:emitting\011Z
      //   6: ifeq +16 -> 22
      //   9: aload_0
      //   10: iconst_1
      //   11: aload_0
      //   12: getfield 123\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:missedEmitting\011I
      //   15: iadd
      //   16: putfield 123\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:missedEmitting\011I
      //   19: aload_0
      //   20: monitorexit
      //   21: return
      //   22: aload_0
      //   23: iconst_1
      //   24: putfield 121\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:emitting\011Z
      //   27: aload_0
      //   28: iconst_0
      //   29: putfield 123\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:missedEmitting\011I
      //   32: aload_0
      //   33: monitorexit
      //   34: aload_0
      //   35: getfield 104\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:subscribers\011Ljava/util/List;
      //   38: astore_2
      //   39: aload_0
      //   40: getfield 78\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:s\011Lrx/Subscriber;
      //   43: astore_3
      //   44: aload_2
      //   45: invokeinterface 129 1 0
      //   50: anewarray 82\011java/lang/Object
      //   53: astore 4
      //   55: aload_0
      //   56: getfield 110\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:requested\011J
      //   59: lstore 5
      //   61: lload 5
      //   63: lconst_0
      //   64: lcmp
      //   65: ifle +334 -> 399
      //   68: aload_0
      //   69: getfield 131\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:lastIndex\011I
      //   72: istore 8
      //   74: aload_2
      //   75: monitorenter
      //   76: aload_2
      //   77: invokeinterface 129 1 0
      //   82: aload 4
      //   84: arraylength
      //   85: if_icmpne +188 -> 273
      //   88: aload_2
      //   89: aload 4
      //   91: invokeinterface 135 2 0
      //   96: astore 4
      //   98: aload_2
      //   99: monitorexit
      //   100: iconst_0
      //   101: istore 10
      //   103: aload 4
      //   105: astore 11
      //   107: aload 11
      //   109: arraylength
      //   110: istore 12
      //   112: iconst_0
      //   113: istore 13
      //   115: iconst_0
      //   116: istore 14
      //   118: iload 13
      //   120: iload 12
      //   122: if_icmpge +23 -> 145
      //   125: aload 11
      //   127: iload 13
      //   129: aaload
      //   130: checkcast 137\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber
      //   133: getfield 140\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber:index\011I
      //   136: iload 8
      //   138: if_icmpne +153 -> 291
      //   141: iload 10
      //   143: istore 14
      //   145: iconst_0
      //   146: istore 15
      //   148: iconst_0
      //   149: istore 16
      //   151: iload 16
      //   153: aload 4
      //   155: arraylength
      //   156: if_icmpge +267 -> 423
      //   159: aload 4
      //   161: iload 16
      //   163: iload 14
      //   165: iadd
      //   166: aload 4
      //   168: arraylength
      //   169: irem
      //   170: aaload
      //   171: checkcast 137\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber
      //   174: astore 17
      //   176: aload 17
      //   178: getfield 144\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber:buffer\011Lrx/internal/util/RxRingBuffer;
      //   181: astore 18
      //   183: aload_0
      //   184: aload 17
      //   186: getfield 140\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber:index\011I
      //   189: putfield 131\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:lastIndex\011I
      //   192: aload 17
      //   194: getfield 147\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber:once\011Z
      //   197: ifne +111 -> 308
      //   200: aload 18
      //   202: invokevirtual 153\011rx/internal/util/RxRingBuffer:peek\011()Ljava/lang/Object;
      //   205: ifnonnull +103 -> 308
      //   208: aload_2
      //   209: aload 17
      //   211: invokeinterface 157 2 0
      //   216: pop
      //   217: aload_0
      //   218: getfield 86\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:guard\011Ljava/lang/Object;
      //   221: astore 25
      //   223: aload 25
      //   225: monitorenter
      //   226: aload_0
      //   227: iconst_m1
      //   228: aload_0
      //   229: getfield 159\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:active\011I
      //   232: iadd
      //   233: putfield 159\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:active\011I
      //   236: aload 25
      //   238: monitorexit
      //   239: aload_0
      //   240: getfield 80\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:csub\011Lrx/subscriptions/CompositeSubscription;
      //   243: aload 17
      //   245: invokevirtual 164\011rx/subscriptions/CompositeSubscription:remove\011(Lrx/Subscription;)V
      //   248: aload 17
      //   250: invokevirtual 167\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber:release\011()V
      //   253: aload_0
      //   254: invokevirtual 170\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:subscribeNext\011()V
      //   257: getstatic 50\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:WIP\011Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
      //   260: aload_0
      //   261: invokevirtual 174\011java/util/concurrent/atomic/AtomicIntegerFieldUpdater:decrementAndGet\011(Ljava/lang/Object;)I
      //   264: pop
      //   265: goto -210 -> 55
      //   268: astore_1
      //   269: aload_0
      //   270: monitorexit
      //   271: aload_1
      //   272: athrow
      //   273: aload_2
      //   274: invokeinterface 177 1 0
      //   279: astore 4
      //   281: goto -183 -> 98
      //   284: astore 9
      //   286: aload_2
      //   287: monitorexit
      //   288: aload 9
      //   290: athrow
      //   291: iinc 10 1
      //   294: iinc 13 1
      //   297: goto -182 -> 115
      //   300: astore 26
      //   302: aload 25
      //   304: monitorexit
      //   305: aload 26
      //   307: athrow
      //   308: iconst_0
      //   309: istore 19
      //   311: lload 5
      //   313: lconst_0
      //   314: lcmp
      //   315: ifle +45 -> 360
      //   318: aload 18
      //   320: invokevirtual 180\011rx/internal/util/RxRingBuffer:poll\011()Ljava/lang/Object;
      //   323: astore 22
      //   325: aload 22
      //   327: ifnull +33 -> 360
      //   330: aload_0
      //   331: getfield 74\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:nl\011Lrx/internal/operators/NotificationLite;
      //   334: aload_3
      //   335: aload 22
      //   337: invokevirtual 184\011rx/internal/operators/NotificationLite:accept\011(Lrx/Observer;Ljava/lang/Object;)Z
      //   340: pop
      //   341: aload_3
      //   342: invokevirtual 188\011rx/Subscriber:isUnsubscribed\011()Z
      //   345: ifne +120 -> 465
      //   348: lload 5
      //   350: lconst_1
      //   351: lsub
      //   352: lstore 5
      //   354: iinc 19 1
      //   357: goto -46 -> 311
      //   360: iload 19
      //   362: ifle +30 -> 392
      //   365: iload 15
      //   367: iload 19
      //   369: iadd
      //   370: istore 15
      //   372: getstatic 61\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:REQUESTED\011Ljava/util/concurrent/atomic/AtomicLongFieldUpdater;
      //   375: aload_0
      //   376: iload 19
      //   378: ineg
      //   379: i2l
      //   380: invokevirtual 192\011java/util/concurrent/atomic/AtomicLongFieldUpdater:addAndGet\011(Ljava/lang/Object;J)J
      //   383: pop2
      //   384: aload 17
      //   386: iload 19
      //   388: i2l
      //   389: invokevirtual 195\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber$MergeItemSubscriber:requestMore\011(J)V
      //   392: lload 5
      //   394: lconst_0
      //   395: lcmp
      //   396: ifne +21 -> 417
      //   399: aload 4
      //   401: arraylength
      //   402: ifne +29 -> 431
      //   405: aload_0
      //   406: getfield 106\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:wip\011I
      //   409: ifne +22 -> 431
      //   412: aload_3
      //   413: invokevirtual 198\011rx/Subscriber:onCompleted\011()V
      //   416: return
      //   417: iinc 16 1
      //   420: goto -269 -> 151
      //   423: iload 15
      //   425: ifne -370 -> 55
      //   428: goto -29 -> 399
      //   431: aload_0
      //   432: monitorenter
      //   433: aload_0
      //   434: getfield 123\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:missedEmitting\011I
      //   437: ifne +18 -> 455
      //   440: aload_0
      //   441: iconst_0
      //   442: putfield 121\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:emitting\011Z
      //   445: aload_0
      //   446: monitorexit
      //   447: return
      //   448: astore 7
      //   450: aload_0
      //   451: monitorexit
      //   452: aload 7
      //   454: athrow
      //   455: aload_0
      //   456: iconst_0
      //   457: putfield 123\011rx/internal/operators/OperatorMergeMaxConcurrent$SourceSubscriber:missedEmitting\011I
      //   460: aload_0
      //   461: monitorexit
      //   462: goto -407 -> 55
      //   465: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   2\01121\011268\011finally
      //   22\01134\011268\011finally
      //   269\011271\011268\011finally
      //   76\01198\011284\011finally
      //   98\011100\011284\011finally
      //   273\011281\011284\011finally
      //   286\011288\011284\011finally
      //   226\011239\011300\011finally
      //   302\011305\011300\011finally
      //   433\011447\011448\011finally
      //   450\011452\011448\011finally
      //   455\011462\011448\011finally
    }

    public void onCompleted()
    {
      WIP.decrementAndGet(this);
      drain();
    }

    public void onError(Throwable paramThrowable)
    {
      Object[] arrayOfObject;
      synchronized (this.subscribers)
      {
        arrayOfObject = this.subscribers.toArray();
        this.subscribers.clear();
      }
      try
      {
        this.s.onError(paramThrowable);
        unsubscribe();
        int k = arrayOfObject.length;
        int m = 0;
        while (m < k)
        {
          ((MergeItemSubscriber)arrayOfObject[m]).release();
          m++;
          continue;
          localObject1 = finally;
          throw localObject1;
        }
      }
      finally
      {
        int i = arrayOfObject.length;
        for (int j = 0; j < i; j++)
          ((MergeItemSubscriber)arrayOfObject[j]).release();
      }
    }

    public void onNext(Observable<? extends T> paramObservable)
    {
      synchronized (this.guard)
      {
        this.queue.add(paramObservable);
        subscribeNext();
        return;
      }
    }

    public void onStart()
    {
      request(this.maxConcurrency);
    }

    void subscribeNext()
    {
      synchronized (this.guard)
      {
        Observable localObservable = (Observable)this.queue.peek();
        if ((localObservable == null) || (this.active >= this.maxConcurrency))
          return;
        this.active = (1 + this.active);
        this.queue.poll();
        MergeItemSubscriber localMergeItemSubscriber = new MergeItemSubscriber(SOURCE_INDEX.getAndIncrement(this));
        this.subscribers.add(localMergeItemSubscriber);
        this.csub.add(localMergeItemSubscriber);
        WIP.incrementAndGet(this);
        localObservable.unsafeSubscribe(localMergeItemSubscriber);
        request(1L);
        return;
      }
    }

    final class MergeItemSubscriber extends Subscriber<T>
    {
      final RxRingBuffer buffer = RxRingBuffer.getSpmcInstance();
      final int index;
      volatile boolean once = true;

      public MergeItemSubscriber(int arg2)
      {
        int i;
        this.index = i;
      }

      public void onCompleted()
      {
        if (this.once)
        {
          this.once = false;
          OperatorMergeMaxConcurrent.SourceSubscriber.this.drain();
        }
      }

      public void onError(Throwable paramThrowable)
      {
        OperatorMergeMaxConcurrent.SourceSubscriber.this.onError(paramThrowable);
      }

      public void onNext(T paramT)
      {
        try
        {
          this.buffer.onNext(paramT);
          OperatorMergeMaxConcurrent.SourceSubscriber.this.drain();
          return;
        }
        catch (MissingBackpressureException localMissingBackpressureException)
        {
          onError(localMissingBackpressureException);
        }
      }

      public void onStart()
      {
        request(RxRingBuffer.SIZE);
      }

      void release()
      {
        this.buffer.release();
      }

      void requestMore(long paramLong)
      {
        request(paramLong);
      }
    }
  }
}