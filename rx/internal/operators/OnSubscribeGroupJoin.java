package rx.internal.operators;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Observer;
import rx.Subscriber;
import rx.Subscription;
import rx.functions.Func1;
import rx.functions.Func2;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.RefCountSubscription;

public final class OnSubscribeGroupJoin<T1, T2, D1, D2, R>
  implements Observable.OnSubscribe<R>
{
  protected final Observable<T1> left;
  protected final Func1<? super T1, ? extends Observable<D1>> leftDuration;
  protected final Func2<? super T1, ? super Observable<T2>, ? extends R> resultSelector;
  protected final Observable<T2> right;
  protected final Func1<? super T2, ? extends Observable<D2>> rightDuration;

  public OnSubscribeGroupJoin(Observable<T1> paramObservable, Observable<T2> paramObservable1, Func1<? super T1, ? extends Observable<D1>> paramFunc1, Func1<? super T2, ? extends Observable<D2>> paramFunc11, Func2<? super T1, ? super Observable<T2>, ? extends R> paramFunc2)
  {
    this.left = paramObservable;
    this.right = paramObservable1;
    this.leftDuration = paramFunc1;
    this.rightDuration = paramFunc11;
    this.resultSelector = paramFunc2;
  }

  public void call(Subscriber<? super R> paramSubscriber)
  {
    ResultManager localResultManager = new ResultManager(new SerializedSubscriber(paramSubscriber));
    paramSubscriber.add(localResultManager);
    localResultManager.init();
  }

  final class ResultManager
    implements Subscription
  {
    final RefCountSubscription cancel;
    final CompositeSubscription group;
    final Object guard = new Object();
    boolean leftDone;
    int leftIds;
    final Map<Integer, Observer<T2>> leftMap = new HashMap();
    boolean rightDone;
    int rightIds;
    final Map<Integer, T2> rightMap = new HashMap();
    final Subscriber<? super R> subscriber;

    public ResultManager()
    {
      Object localObject;
      this.subscriber = localObject;
      this.group = new CompositeSubscription();
      this.cancel = new RefCountSubscription(this.group);
    }

    void complete(List<Observer<T2>> paramList)
    {
      if (paramList != null)
      {
        Iterator localIterator = paramList.iterator();
        while (localIterator.hasNext())
          ((Observer)localIterator.next()).onCompleted();
        this.subscriber.onCompleted();
        this.cancel.unsubscribe();
      }
    }

    void errorAll(Throwable paramThrowable)
    {
      synchronized (this.guard)
      {
        ArrayList localArrayList = new ArrayList(this.leftMap.values());
        this.leftMap.clear();
        this.rightMap.clear();
        Iterator localIterator = localArrayList.iterator();
        if (localIterator.hasNext())
          ((Observer)localIterator.next()).onError(paramThrowable);
      }
      this.subscriber.onError(paramThrowable);
      this.cancel.unsubscribe();
    }

    void errorMain(Throwable paramThrowable)
    {
      synchronized (this.guard)
      {
        this.leftMap.clear();
        this.rightMap.clear();
        this.subscriber.onError(paramThrowable);
        this.cancel.unsubscribe();
        return;
      }
    }

    public void init()
    {
      LeftObserver localLeftObserver = new LeftObserver();
      RightObserver localRightObserver = new RightObserver();
      this.group.add(localLeftObserver);
      this.group.add(localRightObserver);
      OnSubscribeGroupJoin.this.left.unsafeSubscribe(localLeftObserver);
      OnSubscribeGroupJoin.this.right.unsafeSubscribe(localRightObserver);
    }

    public boolean isUnsubscribed()
    {
      return this.cancel.isUnsubscribed();
    }

    public void unsubscribe()
    {
      this.cancel.unsubscribe();
    }

    final class LeftDurationObserver extends Subscriber<D1>
    {
      final int id;
      boolean once = true;

      public LeftDurationObserver(int arg2)
      {
        int i;
        this.id = i;
      }

      public void onCompleted()
      {
        if (this.once)
          this.once = false;
        synchronized (OnSubscribeGroupJoin.ResultManager.this.guard)
        {
          Observer localObserver = (Observer)OnSubscribeGroupJoin.ResultManager.this.leftMap.remove(Integer.valueOf(this.id));
          if (localObserver != null)
            localObserver.onCompleted();
          OnSubscribeGroupJoin.ResultManager.this.group.remove(this);
          return;
        }
      }

      public void onError(Throwable paramThrowable)
      {
        OnSubscribeGroupJoin.ResultManager.this.errorMain(paramThrowable);
      }

      public void onNext(D1 paramD1)
      {
        onCompleted();
      }
    }

    final class LeftObserver extends Subscriber<T1>
    {
      LeftObserver()
      {
      }

      public void onCompleted()
      {
        Object localObject4;
        ArrayList localArrayList;
        synchronized (OnSubscribeGroupJoin.ResultManager.this.guard)
        {
          OnSubscribeGroupJoin.ResultManager.this.leftDone = true;
          boolean bool = OnSubscribeGroupJoin.ResultManager.this.rightDone;
          localObject4 = null;
          if (bool)
            localArrayList = new ArrayList(OnSubscribeGroupJoin.ResultManager.this.leftMap.values());
        }
        try
        {
          OnSubscribeGroupJoin.ResultManager.this.leftMap.clear();
          OnSubscribeGroupJoin.ResultManager.this.rightMap.clear();
          localObject4 = localArrayList;
          OnSubscribeGroupJoin.ResultManager.this.complete(localObject4);
          return;
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
        }
      }

      public void onError(Throwable paramThrowable)
      {
        OnSubscribeGroupJoin.ResultManager.this.errorAll(paramThrowable);
      }

      // ERROR //
      public void onNext(T1 paramT1)
      {
        // Byte code:
        //   0: invokestatic 68\011rx/subjects/PublishSubject:create\011()Lrx/subjects/PublishSubject;
        //   3: astore_3
        //   4: new 70\011rx/observers/SerializedObserver
        //   7: dup
        //   8: aload_3
        //   9: invokespecial 73\011rx/observers/SerializedObserver:<init>\011(Lrx/Observer;)V
        //   12: astore 4
        //   14: aload_0
        //   15: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   18: getfield 21\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:guard\011Ljava/lang/Object;
        //   21: astore 5
        //   23: aload 5
        //   25: monitorenter
        //   26: aload_0
        //   27: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   30: astore 7
        //   32: aload 7
        //   34: getfield 77\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:leftIds\011I
        //   37: istore 8
        //   39: aload 7
        //   41: iload 8
        //   43: iconst_1
        //   44: iadd
        //   45: putfield 77\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:leftIds\011I
        //   48: aload_0
        //   49: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   52: getfield 34\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:leftMap\011Ljava/util/Map;
        //   55: iload 8
        //   57: invokestatic 83\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
        //   60: aload 4
        //   62: invokeinterface 87 3 0
        //   67: pop
        //   68: aload 5
        //   70: monitorexit
        //   71: new 89\011rx/internal/operators/OnSubscribeGroupJoin$WindowObservableFunc
        //   74: dup
        //   75: aload_3
        //   76: aload_0
        //   77: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   80: getfield 93\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:cancel\011Lrx/subscriptions/RefCountSubscription;
        //   83: invokespecial 96\011rx/internal/operators/OnSubscribeGroupJoin$WindowObservableFunc:<init>\011(Lrx/Observable;Lrx/subscriptions/RefCountSubscription;)V
        //   86: invokestatic 101\011rx/Observable:create\011(Lrx/Observable$OnSubscribe;)Lrx/Observable;
        //   89: astore 10
        //   91: aload_0
        //   92: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   95: getfield 105\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:this$0\011Lrx/internal/operators/OnSubscribeGroupJoin;
        //   98: getfield 111\011rx/internal/operators/OnSubscribeGroupJoin:leftDuration\011Lrx/functions/Func1;
        //   101: aload_1
        //   102: invokeinterface 117 2 0
        //   107: checkcast 98\011rx/Observable
        //   110: astore 11
        //   112: new 119\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftDurationObserver
        //   115: dup
        //   116: aload_0
        //   117: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   120: iload 8
        //   122: invokespecial 122\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftDurationObserver:<init>\011(Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;I)V
        //   125: astore 12
        //   127: aload_0
        //   128: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   131: getfield 126\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:group\011Lrx/subscriptions/CompositeSubscription;
        //   134: aload 12
        //   136: invokevirtual 132\011rx/subscriptions/CompositeSubscription:add\011(Lrx/Subscription;)V
        //   139: aload 11
        //   141: aload 12
        //   143: invokevirtual 136\011rx/Observable:unsafeSubscribe\011(Lrx/Subscriber;)Lrx/Subscription;
        //   146: pop
        //   147: aload_0
        //   148: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   151: getfield 105\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:this$0\011Lrx/internal/operators/OnSubscribeGroupJoin;
        //   154: getfield 140\011rx/internal/operators/OnSubscribeGroupJoin:resultSelector\011Lrx/functions/Func2;
        //   157: aload_1
        //   158: aload 10
        //   160: invokeinterface 144 3 0
        //   165: astore 14
        //   167: aload_0
        //   168: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   171: getfield 21\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:guard\011Ljava/lang/Object;
        //   174: astore 15
        //   176: aload 15
        //   178: monitorenter
        //   179: new 30\011java/util/ArrayList
        //   182: dup
        //   183: aload_0
        //   184: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   187: getfield 49\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:rightMap\011Ljava/util/Map;
        //   190: invokeinterface 40 1 0
        //   195: invokespecial 43\011java/util/ArrayList:<init>\011(Ljava/util/Collection;)V
        //   198: astore 16
        //   200: aload 15
        //   202: monitorexit
        //   203: aload_0
        //   204: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   207: getfield 148\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:subscriber\011Lrx/Subscriber;
        //   210: aload 14
        //   212: invokevirtual 150\011rx/Subscriber:onNext\011(Ljava/lang/Object;)V
        //   215: aload 16
        //   217: invokeinterface 156 1 0
        //   222: astore 18
        //   224: aload 18
        //   226: invokeinterface 162 1 0
        //   231: ifeq +26 -> 257
        //   234: aload 4
        //   236: aload 18
        //   238: invokeinterface 166 1 0
        //   243: invokeinterface 169 2 0
        //   248: goto -24 -> 224
        //   251: astore_2
        //   252: aload_0
        //   253: aload_2
        //   254: invokevirtual 171\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$LeftObserver:onError\011(Ljava/lang/Throwable;)V
        //   257: return
        //   258: astore 6
        //   260: aload 5
        //   262: monitorexit
        //   263: aload 6
        //   265: athrow
        //   266: astore 17
        //   268: aload 15
        //   270: monitorexit
        //   271: aload 17
        //   273: athrow
        //
        // Exception table:
        //   from\011to\011target\011type
        //   0\01126\011251\011java/lang/Throwable
        //   71\011179\011251\011java/lang/Throwable
        //   203\011224\011251\011java/lang/Throwable
        //   224\011248\011251\011java/lang/Throwable
        //   263\011266\011251\011java/lang/Throwable
        //   271\011274\011251\011java/lang/Throwable
        //   26\01171\011258\011finally
        //   260\011263\011258\011finally
        //   179\011203\011266\011finally
        //   268\011271\011266\011finally
      }
    }

    final class RightDurationObserver extends Subscriber<D2>
    {
      final int id;
      boolean once = true;

      public RightDurationObserver(int arg2)
      {
        int i;
        this.id = i;
      }

      public void onCompleted()
      {
        if (this.once)
          this.once = false;
        synchronized (OnSubscribeGroupJoin.ResultManager.this.guard)
        {
          OnSubscribeGroupJoin.ResultManager.this.rightMap.remove(Integer.valueOf(this.id));
          OnSubscribeGroupJoin.ResultManager.this.group.remove(this);
          return;
        }
      }

      public void onError(Throwable paramThrowable)
      {
        OnSubscribeGroupJoin.ResultManager.this.errorMain(paramThrowable);
      }

      public void onNext(D2 paramD2)
      {
        onCompleted();
      }
    }

    final class RightObserver extends Subscriber<T2>
    {
      RightObserver()
      {
      }

      public void onCompleted()
      {
        Object localObject4;
        ArrayList localArrayList;
        synchronized (OnSubscribeGroupJoin.ResultManager.this.guard)
        {
          OnSubscribeGroupJoin.ResultManager.this.rightDone = true;
          boolean bool = OnSubscribeGroupJoin.ResultManager.this.leftDone;
          localObject4 = null;
          if (bool)
            localArrayList = new ArrayList(OnSubscribeGroupJoin.ResultManager.this.leftMap.values());
        }
        try
        {
          OnSubscribeGroupJoin.ResultManager.this.leftMap.clear();
          OnSubscribeGroupJoin.ResultManager.this.rightMap.clear();
          localObject4 = localArrayList;
          OnSubscribeGroupJoin.ResultManager.this.complete(localObject4);
          return;
          localObject2 = finally;
          throw localObject2;
        }
        finally
        {
        }
      }

      public void onError(Throwable paramThrowable)
      {
        OnSubscribeGroupJoin.ResultManager.this.errorAll(paramThrowable);
      }

      // ERROR //
      public void onNext(T2 paramT2)
      {
        // Byte code:
        //   0: aload_0
        //   1: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   4: getfield 21\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:guard\011Ljava/lang/Object;
        //   7: astore_3
        //   8: aload_3
        //   9: monitorenter
        //   10: aload_0
        //   11: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   14: astore 5
        //   16: aload 5
        //   18: getfield 66\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:rightIds\011I
        //   21: istore 6
        //   23: aload 5
        //   25: iload 6
        //   27: iconst_1
        //   28: iadd
        //   29: putfield 66\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:rightIds\011I
        //   32: aload_0
        //   33: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   36: getfield 49\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:rightMap\011Ljava/util/Map;
        //   39: iload 6
        //   41: invokestatic 72\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
        //   44: aload_1
        //   45: invokeinterface 76 3 0
        //   50: pop
        //   51: aload_3
        //   52: monitorexit
        //   53: aload_0
        //   54: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   57: getfield 80\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:this$0\011Lrx/internal/operators/OnSubscribeGroupJoin;
        //   60: getfield 86\011rx/internal/operators/OnSubscribeGroupJoin:rightDuration\011Lrx/functions/Func1;
        //   63: aload_1
        //   64: invokeinterface 92 2 0
        //   69: checkcast 94\011rx/Observable
        //   72: astore 8
        //   74: new 96\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightDurationObserver
        //   77: dup
        //   78: aload_0
        //   79: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   82: iload 6
        //   84: invokespecial 99\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightDurationObserver:<init>\011(Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;I)V
        //   87: astore 9
        //   89: aload_0
        //   90: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   93: getfield 103\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:group\011Lrx/subscriptions/CompositeSubscription;
        //   96: aload 9
        //   98: invokevirtual 109\011rx/subscriptions/CompositeSubscription:add\011(Lrx/Subscription;)V
        //   101: aload 8
        //   103: aload 9
        //   105: invokevirtual 113\011rx/Observable:unsafeSubscribe\011(Lrx/Subscriber;)Lrx/Subscription;
        //   108: pop
        //   109: aload_0
        //   110: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   113: getfield 21\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:guard\011Ljava/lang/Object;
        //   116: astore 11
        //   118: aload 11
        //   120: monitorenter
        //   121: new 30\011java/util/ArrayList
        //   124: dup
        //   125: aload_0
        //   126: getfield 11\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:this$1\011Lrx/internal/operators/OnSubscribeGroupJoin$ResultManager;
        //   129: getfield 34\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager:leftMap\011Ljava/util/Map;
        //   132: invokeinterface 40 1 0
        //   137: invokespecial 43\011java/util/ArrayList:<init>\011(Ljava/util/Collection;)V
        //   140: astore 12
        //   142: aload 11
        //   144: monitorexit
        //   145: aload 12
        //   147: invokeinterface 119 1 0
        //   152: astore 14
        //   154: aload 14
        //   156: invokeinterface 125 1 0
        //   161: ifeq +28 -> 189
        //   164: aload 14
        //   166: invokeinterface 129 1 0
        //   171: checkcast 131\011rx/Observer
        //   174: aload_1
        //   175: invokeinterface 133 2 0
        //   180: goto -26 -> 154
        //   183: astore_2
        //   184: aload_0
        //   185: aload_2
        //   186: invokevirtual 135\011rx/internal/operators/OnSubscribeGroupJoin$ResultManager$RightObserver:onError\011(Ljava/lang/Throwable;)V
        //   189: return
        //   190: astore 4
        //   192: aload_3
        //   193: monitorexit
        //   194: aload 4
        //   196: athrow
        //   197: astore 13
        //   199: aload 11
        //   201: monitorexit
        //   202: aload 13
        //   204: athrow
        //
        // Exception table:
        //   from\011to\011target\011type
        //   0\01110\011183\011java/lang/Throwable
        //   53\011121\011183\011java/lang/Throwable
        //   145\011154\011183\011java/lang/Throwable
        //   154\011180\011183\011java/lang/Throwable
        //   194\011197\011183\011java/lang/Throwable
        //   202\011205\011183\011java/lang/Throwable
        //   10\01153\011190\011finally
        //   192\011194\011190\011finally
        //   121\011145\011197\011finally
        //   199\011202\011197\011finally
      }
    }
  }

  static final class WindowObservableFunc<T>
    implements Observable.OnSubscribe<T>
  {
    final RefCountSubscription refCount;
    final Observable<T> underlying;

    public WindowObservableFunc(Observable<T> paramObservable, RefCountSubscription paramRefCountSubscription)
    {
      this.refCount = paramRefCountSubscription;
      this.underlying = paramObservable;
    }

    public void call(Subscriber<? super T> paramSubscriber)
    {
      Subscription localSubscription = this.refCount.get();
      WindowSubscriber localWindowSubscriber = new WindowSubscriber(paramSubscriber, localSubscription);
      localWindowSubscriber.add(localSubscription);
      this.underlying.unsafeSubscribe(localWindowSubscriber);
    }

    final class WindowSubscriber extends Subscriber<T>
    {
      private final Subscription ref;
      final Subscriber<? super T> subscriber;

      public WindowSubscriber(Subscription arg2)
      {
        super();
        this.subscriber = localSubscriber;
        Object localObject;
        this.ref = localObject;
      }

      public void onCompleted()
      {
        this.subscriber.onCompleted();
        this.ref.unsubscribe();
      }

      public void onError(Throwable paramThrowable)
      {
        this.subscriber.onError(paramThrowable);
        this.ref.unsubscribe();
      }

      public void onNext(T paramT)
      {
        this.subscriber.onNext(paramT);
      }
    }
  }
}