package rx.internal.operators;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Observable.Operator;
import rx.Observer;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;
import rx.observers.SerializedObserver;
import rx.observers.SerializedSubscriber;

public final class OperatorWindowWithTime<T>
  implements Observable.Operator<Observable<T>, T>
{
  static final Object NEXT_SUBJECT = new Object();
  static final NotificationLite<Object> nl = NotificationLite.instance();
  final Scheduler scheduler;
  final int size;
  final long timeshift;
  final long timespan;
  final TimeUnit unit;

  public OperatorWindowWithTime(long paramLong1, long paramLong2, TimeUnit paramTimeUnit, int paramInt, Scheduler paramScheduler)
  {
    this.timespan = paramLong1;
    this.timeshift = paramLong2;
    this.unit = paramTimeUnit;
    this.size = paramInt;
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(Subscriber<? super Observable<T>> paramSubscriber)
  {
    Scheduler.Worker localWorker = this.scheduler.createWorker();
    paramSubscriber.add(localWorker);
    if (this.timespan == this.timeshift)
    {
      ExactSubscriber localExactSubscriber = new ExactSubscriber(paramSubscriber, localWorker);
      localExactSubscriber.scheduleExact();
      return localExactSubscriber;
    }
    InexactSubscriber localInexactSubscriber = new InexactSubscriber(paramSubscriber, localWorker);
    localInexactSubscriber.startNewChunk();
    localInexactSubscriber.scheduleChunk();
    return localInexactSubscriber;
  }

  static final class CountedSerializedSubject<T>
  {
    final Observer<T> consumer;
    int count;
    final Observable<T> producer;

    public CountedSerializedSubject(Observer<T> paramObserver, Observable<T> paramObservable)
    {
      this.consumer = new SerializedObserver(paramObserver);
      this.producer = paramObservable;
    }
  }

  final class ExactSubscriber extends Subscriber<T>
  {
    final Subscriber<? super Observable<T>> child;
    boolean emitting;
    final Object guard;
    List<Object> queue;
    volatile OperatorWindowWithTime.State<T> state;
    final Scheduler.Worker worker;

    public ExactSubscriber(Scheduler.Worker arg2)
    {
      super();
      this.child = new SerializedSubscriber(localSubscriber);
      Object localObject;
      this.worker = localObject;
      this.guard = new Object();
      this.state = OperatorWindowWithTime.State.empty();
    }

    void complete()
    {
      Observer localObserver = this.state.consumer;
      this.state = this.state.clear();
      if (localObserver != null)
        localObserver.onCompleted();
      this.child.onCompleted();
      unsubscribe();
    }

    void drain(List<Object> paramList)
    {
      if (paramList == null);
      while (true)
      {
        return;
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
        {
          Object localObject = localIterator.next();
          if (localObject == OperatorWindowWithTime.NEXT_SUBJECT)
          {
            replaceSubject();
          }
          else
          {
            if (OperatorWindowWithTime.nl.isError(localObject))
            {
              error(OperatorWindowWithTime.nl.getError(localObject));
              return;
            }
            if (OperatorWindowWithTime.nl.isCompleted(localObject))
            {
              complete();
              return;
            }
            emitValue(localObject);
          }
        }
      }
    }

    void emitValue(T paramT)
    {
      OperatorWindowWithTime.State localState1 = this.state;
      if (localState1.consumer == null)
      {
        replaceSubject();
        localState1 = this.state;
      }
      localState1.consumer.onNext(paramT);
      if (localState1.count == -1 + OperatorWindowWithTime.this.size)
        localState1.consumer.onCompleted();
      for (OperatorWindowWithTime.State localState2 = localState1.clear(); ; localState2 = localState1.next())
      {
        this.state = localState2;
        return;
      }
    }

    void error(Throwable paramThrowable)
    {
      Observer localObserver = this.state.consumer;
      this.state = this.state.clear();
      if (localObserver != null)
        localObserver.onError(paramThrowable);
      this.child.onError(paramThrowable);
      unsubscribe();
    }

    // ERROR //
    void nextWindow()
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   4: astore_1
      //   5: aload_1
      //   6: monitorenter
      //   7: aload_0
      //   8: getfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   11: ifeq +37 -> 48
      //   14: aload_0
      //   15: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   18: ifnonnull +14 -> 32
      //   21: aload_0
      //   22: new 144\011java/util/ArrayList
      //   25: dup
      //   26: invokespecial 145\011java/util/ArrayList:<init>\011()V
      //   29: putfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   32: aload_0
      //   33: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   36: getstatic 91\011rx/internal/operators/OperatorWindowWithTime:NEXT_SUBJECT\011Ljava/lang/Object;
      //   39: invokeinterface 148 2 0
      //   44: pop
      //   45: aload_1
      //   46: monitorexit
      //   47: return
      //   48: aload_0
      //   49: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   52: astore_3
      //   53: aload_0
      //   54: aconst_null
      //   55: putfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   58: aload_0
      //   59: iconst_1
      //   60: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   63: aload_1
      //   64: monitorexit
      //   65: iconst_1
      //   66: istore 4
      //   68: iconst_0
      //   69: istore 5
      //   71: aload_0
      //   72: aload_3
      //   73: invokevirtual 150\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:drain\011(Ljava/util/List;)V
      //   76: iload 4
      //   78: ifeq +10 -> 88
      //   81: iconst_0
      //   82: istore 4
      //   84: aload_0
      //   85: invokevirtual 94\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:replaceSubject\011()V
      //   88: aload_0
      //   89: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   92: astore 9
      //   94: aload 9
      //   96: monitorenter
      //   97: aload_0
      //   98: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   101: astore_3
      //   102: aload_0
      //   103: aconst_null
      //   104: putfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   107: aload_3
      //   108: ifnonnull +50 -> 158
      //   111: aload_0
      //   112: iconst_0
      //   113: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   116: iconst_1
      //   117: istore 5
      //   119: aload 9
      //   121: monitorexit
      //   122: iload 5
      //   124: ifne +124 -> 248
      //   127: aload_0
      //   128: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   131: astore 11
      //   133: aload 11
      //   135: monitorenter
      //   136: aload_0
      //   137: iconst_0
      //   138: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   141: aload 11
      //   143: monitorexit
      //   144: return
      //   145: astore 12
      //   147: aload 11
      //   149: monitorexit
      //   150: aload 12
      //   152: athrow
      //   153: astore_2
      //   154: aload_1
      //   155: monitorexit
      //   156: aload_2
      //   157: athrow
      //   158: aload 9
      //   160: monitorexit
      //   161: aload_0
      //   162: getfield 34\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:child\011Lrx/Subscriber;
      //   165: invokevirtual 153\011rx/Subscriber:isUnsubscribed\011()Z
      //   168: istore 13
      //   170: iload 13
      //   172: ifeq -101 -> 71
      //   175: iconst_0
      //   176: ifne +72 -> 248
      //   179: aload_0
      //   180: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   183: astore 14
      //   185: aload 14
      //   187: monitorenter
      //   188: aload_0
      //   189: iconst_0
      //   190: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   193: aload 14
      //   195: monitorexit
      //   196: return
      //   197: astore 15
      //   199: aload 14
      //   201: monitorexit
      //   202: aload 15
      //   204: athrow
      //   205: astore 10
      //   207: aload 9
      //   209: monitorexit
      //   210: aload 10
      //   212: athrow
      //   213: astore 6
      //   215: iload 5
      //   217: ifne +20 -> 237
      //   220: aload_0
      //   221: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   224: astore 7
      //   226: aload 7
      //   228: monitorenter
      //   229: aload_0
      //   230: iconst_0
      //   231: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   234: aload 7
      //   236: monitorexit
      //   237: aload 6
      //   239: athrow
      //   240: astore 8
      //   242: aload 7
      //   244: monitorexit
      //   245: aload 8
      //   247: athrow
      //   248: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   136\011144\011145\011finally
      //   147\011150\011145\011finally
      //   7\01132\011153\011finally
      //   32\01147\011153\011finally
      //   48\01165\011153\011finally
      //   154\011156\011153\011finally
      //   188\011196\011197\011finally
      //   199\011202\011197\011finally
      //   97\011107\011205\011finally
      //   111\011116\011205\011finally
      //   119\011122\011205\011finally
      //   158\011161\011205\011finally
      //   207\011210\011205\011finally
      //   71\01176\011213\011finally
      //   84\01188\011213\011finally
      //   88\01197\011213\011finally
      //   161\011170\011213\011finally
      //   210\011213\011213\011finally
      //   229\011237\011240\011finally
      //   242\011245\011240\011finally
    }

    public void onCompleted()
    {
      List localList;
      synchronized (this.guard)
      {
        if (this.emitting)
        {
          if (this.queue == null)
            this.queue = new ArrayList();
          this.queue.add(OperatorWindowWithTime.nl.completed());
          return;
        }
        localList = this.queue;
        this.queue = null;
        this.emitting = true;
      }
      try
      {
        drain(localList);
        complete();
        return;
        localObject2 = finally;
        throw localObject2;
      }
      catch (Throwable localThrowable)
      {
        error(localThrowable);
      }
    }

    public void onError(Throwable paramThrowable)
    {
      synchronized (this.guard)
      {
        if (this.emitting)
        {
          this.queue = Collections.singletonList(OperatorWindowWithTime.nl.error(paramThrowable));
          return;
        }
        this.queue = null;
        this.emitting = true;
        error(paramThrowable);
        return;
      }
    }

    // ERROR //
    public void onNext(T paramT)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   4: astore_2
      //   5: aload_2
      //   6: monitorenter
      //   7: aload_0
      //   8: getfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   11: ifeq +35 -> 46
      //   14: aload_0
      //   15: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   18: ifnonnull +14 -> 32
      //   21: aload_0
      //   22: new 144\011java/util/ArrayList
      //   25: dup
      //   26: invokespecial 145\011java/util/ArrayList:<init>\011()V
      //   29: putfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   32: aload_0
      //   33: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   36: aload_1
      //   37: invokeinterface 148 2 0
      //   42: pop
      //   43: aload_2
      //   44: monitorexit
      //   45: return
      //   46: aload_0
      //   47: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   50: astore 4
      //   52: aload_0
      //   53: aconst_null
      //   54: putfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   57: aload_0
      //   58: iconst_1
      //   59: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   62: aload_2
      //   63: monitorexit
      //   64: iconst_1
      //   65: istore 5
      //   67: iconst_0
      //   68: istore 6
      //   70: aload_0
      //   71: aload 4
      //   73: invokevirtual 150\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:drain\011(Ljava/util/List;)V
      //   76: iload 5
      //   78: ifeq +11 -> 89
      //   81: iconst_0
      //   82: istore 5
      //   84: aload_0
      //   85: aload_1
      //   86: invokevirtual 121\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitValue\011(Ljava/lang/Object;)V
      //   89: aload_0
      //   90: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   93: astore 10
      //   95: aload 10
      //   97: monitorenter
      //   98: aload_0
      //   99: getfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   102: astore 4
      //   104: aload_0
      //   105: aconst_null
      //   106: putfield 142\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:queue\011Ljava/util/List;
      //   109: aload 4
      //   111: ifnonnull +50 -> 161
      //   114: aload_0
      //   115: iconst_0
      //   116: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   119: iconst_1
      //   120: istore 6
      //   122: aload 10
      //   124: monitorexit
      //   125: iload 6
      //   127: ifne +124 -> 251
      //   130: aload_0
      //   131: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   134: astore 12
      //   136: aload 12
      //   138: monitorenter
      //   139: aload_0
      //   140: iconst_0
      //   141: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   144: aload 12
      //   146: monitorexit
      //   147: return
      //   148: astore 13
      //   150: aload 12
      //   152: monitorexit
      //   153: aload 13
      //   155: athrow
      //   156: astore_3
      //   157: aload_2
      //   158: monitorexit
      //   159: aload_3
      //   160: athrow
      //   161: aload 10
      //   163: monitorexit
      //   164: aload_0
      //   165: getfield 34\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:child\011Lrx/Subscriber;
      //   168: invokevirtual 153\011rx/Subscriber:isUnsubscribed\011()Z
      //   171: istore 14
      //   173: iload 14
      //   175: ifeq -105 -> 70
      //   178: iconst_0
      //   179: ifne +72 -> 251
      //   182: aload_0
      //   183: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   186: astore 15
      //   188: aload 15
      //   190: monitorenter
      //   191: aload_0
      //   192: iconst_0
      //   193: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   196: aload 15
      //   198: monitorexit
      //   199: return
      //   200: astore 16
      //   202: aload 15
      //   204: monitorexit
      //   205: aload 16
      //   207: athrow
      //   208: astore 11
      //   210: aload 10
      //   212: monitorexit
      //   213: aload 11
      //   215: athrow
      //   216: astore 7
      //   218: iload 6
      //   220: ifne +20 -> 240
      //   223: aload_0
      //   224: getfield 43\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:guard\011Ljava/lang/Object;
      //   227: astore 8
      //   229: aload 8
      //   231: monitorenter
      //   232: aload_0
      //   233: iconst_0
      //   234: putfield 140\011rx/internal/operators/OperatorWindowWithTime$ExactSubscriber:emitting\011Z
      //   237: aload 8
      //   239: monitorexit
      //   240: aload 7
      //   242: athrow
      //   243: astore 9
      //   245: aload 8
      //   247: monitorexit
      //   248: aload 9
      //   250: athrow
      //   251: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   139\011147\011148\011finally
      //   150\011153\011148\011finally
      //   7\01132\011156\011finally
      //   32\01145\011156\011finally
      //   46\01164\011156\011finally
      //   157\011159\011156\011finally
      //   191\011199\011200\011finally
      //   202\011205\011200\011finally
      //   98\011109\011208\011finally
      //   114\011119\011208\011finally
      //   122\011125\011208\011finally
      //   161\011164\011208\011finally
      //   210\011213\011208\011finally
      //   70\01176\011216\011finally
      //   84\01189\011216\011finally
      //   89\01198\011216\011finally
      //   164\011173\011216\011finally
      //   213\011216\011216\011finally
      //   232\011240\011243\011finally
      //   245\011248\011243\011finally
    }

    public void onStart()
    {
      request(9223372036854775807L);
    }

    void replaceSubject()
    {
      Observer localObserver = this.state.consumer;
      if (localObserver != null)
        localObserver.onCompleted();
      BufferUntilSubscriber localBufferUntilSubscriber = BufferUntilSubscriber.create();
      this.state = this.state.create(localBufferUntilSubscriber, localBufferUntilSubscriber);
      this.child.onNext(localBufferUntilSubscriber);
    }

    void scheduleExact()
    {
      this.worker.schedulePeriodically(new Action0()
      {
        public void call()
        {
          OperatorWindowWithTime.ExactSubscriber.this.nextWindow();
        }
      }
      , 0L, OperatorWindowWithTime.this.timespan, OperatorWindowWithTime.this.unit);
    }
  }

  final class InexactSubscriber extends Subscriber<T>
  {
    final Subscriber<? super Observable<T>> child;
    final List<OperatorWindowWithTime.CountedSerializedSubject<T>> chunks;
    boolean done;
    final Object guard;
    final Scheduler.Worker worker;

    public InexactSubscriber(Scheduler.Worker arg2)
    {
      super();
      this.child = localSubscriber;
      Object localObject;
      this.worker = localObject;
      this.guard = new Object();
      this.chunks = new LinkedList();
    }

    OperatorWindowWithTime.CountedSerializedSubject<T> createCountedSerializedSubject()
    {
      BufferUntilSubscriber localBufferUntilSubscriber = BufferUntilSubscriber.create();
      return new OperatorWindowWithTime.CountedSerializedSubject(localBufferUntilSubscriber, localBufferUntilSubscriber);
    }

    public void onCompleted()
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        this.done = true;
        ArrayList localArrayList = new ArrayList(this.chunks);
        this.chunks.clear();
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
          ((OperatorWindowWithTime.CountedSerializedSubject)localIterator.next()).consumer.onCompleted();
      }
      this.child.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        this.done = true;
        ArrayList localArrayList = new ArrayList(this.chunks);
        this.chunks.clear();
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
          ((OperatorWindowWithTime.CountedSerializedSubject)localIterator.next()).consumer.onError(paramThrowable);
      }
      this.child.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      ArrayList localArrayList;
      synchronized (this.guard)
      {
        if (this.done)
          return;
        localArrayList = new ArrayList(this.chunks);
        Iterator localIterator1 = this.chunks.iterator();
        while (localIterator1.hasNext())
        {
          OperatorWindowWithTime.CountedSerializedSubject localCountedSerializedSubject2 = (OperatorWindowWithTime.CountedSerializedSubject)localIterator1.next();
          int i = 1 + localCountedSerializedSubject2.count;
          localCountedSerializedSubject2.count = i;
          if (i == OperatorWindowWithTime.this.size)
            localIterator1.remove();
        }
      }
      Iterator localIterator2 = localArrayList.iterator();
      while (localIterator2.hasNext())
      {
        OperatorWindowWithTime.CountedSerializedSubject localCountedSerializedSubject1 = (OperatorWindowWithTime.CountedSerializedSubject)localIterator2.next();
        localCountedSerializedSubject1.consumer.onNext(paramT);
        if (localCountedSerializedSubject1.count == OperatorWindowWithTime.this.size)
          localCountedSerializedSubject1.consumer.onCompleted();
      }
    }

    public void onStart()
    {
      request(9223372036854775807L);
    }

    void scheduleChunk()
    {
      this.worker.schedulePeriodically(new Action0()
      {
        public void call()
        {
          OperatorWindowWithTime.InexactSubscriber.this.startNewChunk();
        }
      }
      , OperatorWindowWithTime.this.timeshift, OperatorWindowWithTime.this.timeshift, OperatorWindowWithTime.this.unit);
    }

    void startNewChunk()
    {
      final OperatorWindowWithTime.CountedSerializedSubject localCountedSerializedSubject = createCountedSerializedSubject();
      synchronized (this.guard)
      {
        if (this.done)
          return;
        this.chunks.add(localCountedSerializedSubject);
      }
      try
      {
        this.child.onNext(localCountedSerializedSubject.producer);
        this.worker.schedule(new Action0()
        {
          public void call()
          {
            OperatorWindowWithTime.InexactSubscriber.this.terminateChunk(localCountedSerializedSubject);
          }
        }
        , OperatorWindowWithTime.this.timespan, OperatorWindowWithTime.this.unit);
        return;
        localObject2 = finally;
        throw localObject2;
      }
      catch (Throwable localThrowable)
      {
        onError(localThrowable);
      }
    }

    void terminateChunk(OperatorWindowWithTime.CountedSerializedSubject<T> paramCountedSerializedSubject)
    {
      synchronized (this.guard)
      {
        if (this.done)
          return;
        Iterator localIterator = this.chunks.iterator();
        do
        {
          boolean bool = localIterator.hasNext();
          i = 0;
          if (!bool)
            break;
        }
        while ((OperatorWindowWithTime.CountedSerializedSubject)localIterator.next() != paramCountedSerializedSubject);
        int i = 1;
        localIterator.remove();
        if (i != 0)
        {
          paramCountedSerializedSubject.consumer.onCompleted();
          return;
        }
      }
    }
  }

  static final class State<T>
  {
    static final State<Object> EMPTY = new State(null, null, 0);
    final Observer<T> consumer;
    final int count;
    final Observable<T> producer;

    public State(Observer<T> paramObserver, Observable<T> paramObservable, int paramInt)
    {
      this.consumer = paramObserver;
      this.producer = paramObservable;
      this.count = paramInt;
    }

    public static <T> State<T> empty()
    {
      return EMPTY;
    }

    public State<T> clear()
    {
      return empty();
    }

    public State<T> create(Observer<T> paramObserver, Observable<T> paramObservable)
    {
      return new State(paramObserver, paramObservable, 0);
    }

    public State<T> next()
    {
      return new State(this.consumer, this.producer, 1 + this.count);
    }
  }
}