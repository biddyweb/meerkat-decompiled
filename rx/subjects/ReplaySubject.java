package rx.subjects;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Observable.OnSubscribe;
import rx.Observer;
import rx.Scheduler;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.internal.operators.NotificationLite;
import rx.internal.util.UtilityFunctions;
import rx.schedulers.Timestamped;

public final class ReplaySubject<T> extends Subject<T, T>
{
  private static final Object[] EMPTY_ARRAY = new Object[0];
  final SubjectSubscriptionManager<T> ssm;
  final ReplayState<T, ?> state;

  ReplaySubject(Observable.OnSubscribe<T> paramOnSubscribe, SubjectSubscriptionManager<T> paramSubjectSubscriptionManager, ReplayState<T, ?> paramReplayState)
  {
    super(paramOnSubscribe);
    this.ssm = paramSubjectSubscriptionManager;
    this.state = paramReplayState;
  }

  private boolean caughtUp(SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver)
  {
    boolean bool = true;
    if (!paramSubjectObserver.caughtUp)
    {
      if (this.state.replayObserver(paramSubjectObserver))
      {
        paramSubjectObserver.caughtUp = bool;
        paramSubjectObserver.index(null);
      }
      bool = false;
    }
    return bool;
  }

  public static <T> ReplaySubject<T> create()
  {
    return create(16);
  }

  public static <T> ReplaySubject<T> create(int paramInt)
  {
    UnboundedReplayState localUnboundedReplayState = new UnboundedReplayState(paramInt);
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    localSubjectSubscriptionManager.onStart = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        paramAnonymousSubjectObserver.index(Integer.valueOf(this.val$state.replayObserverFromIndex(Integer.valueOf(0), paramAnonymousSubjectObserver).intValue()));
      }
    };
    localSubjectSubscriptionManager.onAdded = new Action1()
    {
      // ERROR //
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        // Byte code:
        //   0: aload_1
        //   1: monitorenter
        //   2: aload_1
        //   3: getfield 32\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:first\011Z
        //   6: ifeq +10 -> 16
        //   9: aload_1
        //   10: getfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   13: ifeq +6 -> 19
        //   16: aload_1
        //   17: monitorexit
        //   18: return
        //   19: aload_1
        //   20: iconst_0
        //   21: putfield 32\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:first\011Z
        //   24: aload_1
        //   25: iconst_1
        //   26: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   29: aload_1
        //   30: monitorexit
        //   31: iconst_0
        //   32: istore_3
        //   33: aload_1
        //   34: invokevirtual 39\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:index\011()Ljava/lang/Object;
        //   37: checkcast 41\011java/lang/Integer
        //   40: invokevirtual 45\011java/lang/Integer:intValue\011()I
        //   43: istore 6
        //   45: aload_0
        //   46: getfield 18\011rx/subjects/ReplaySubject$2:val$state\011Lrx/subjects/ReplaySubject$UnboundedReplayState;
        //   49: getfield 50\011rx/subjects/ReplaySubject$UnboundedReplayState:index\011I
        //   52: istore 7
        //   54: iconst_0
        //   55: istore_3
        //   56: iload 6
        //   58: iload 7
        //   60: if_icmpeq +20 -> 80
        //   63: aload_1
        //   64: aload_0
        //   65: getfield 18\011rx/subjects/ReplaySubject$2:val$state\011Lrx/subjects/ReplaySubject$UnboundedReplayState;
        //   68: iload 6
        //   70: invokestatic 54\011java/lang/Integer:valueOf\011(I)Ljava/lang/Integer;
        //   73: aload_1
        //   74: invokevirtual 58\011rx/subjects/ReplaySubject$UnboundedReplayState:replayObserverFromIndex\011(Ljava/lang/Integer;Lrx/subjects/SubjectSubscriptionManager$SubjectObserver;)Ljava/lang/Integer;
        //   77: invokevirtual 60\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:index\011(Ljava/lang/Object;)V
        //   80: aload_1
        //   81: monitorenter
        //   82: iload 7
        //   84: aload_0
        //   85: getfield 18\011rx/subjects/ReplaySubject$2:val$state\011Lrx/subjects/ReplaySubject$UnboundedReplayState;
        //   88: getfield 50\011rx/subjects/ReplaySubject$UnboundedReplayState:index\011I
        //   91: if_icmpne +38 -> 129
        //   94: aload_1
        //   95: iconst_0
        //   96: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   99: iconst_1
        //   100: istore_3
        //   101: aload_1
        //   102: monitorexit
        //   103: iload_3
        //   104: ifne +62 -> 166
        //   107: aload_1
        //   108: monitorenter
        //   109: aload_1
        //   110: iconst_0
        //   111: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   114: aload_1
        //   115: monitorexit
        //   116: return
        //   117: astore 9
        //   119: aload_1
        //   120: monitorexit
        //   121: aload 9
        //   123: athrow
        //   124: astore_2
        //   125: aload_1
        //   126: monitorexit
        //   127: aload_2
        //   128: athrow
        //   129: aload_1
        //   130: monitorexit
        //   131: goto -98 -> 33
        //   134: astore 8
        //   136: aload_1
        //   137: monitorexit
        //   138: aload 8
        //   140: athrow
        //   141: astore 4
        //   143: iload_3
        //   144: ifne +12 -> 156
        //   147: aload_1
        //   148: monitorenter
        //   149: aload_1
        //   150: iconst_0
        //   151: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   154: aload_1
        //   155: monitorexit
        //   156: aload 4
        //   158: athrow
        //   159: astore 5
        //   161: aload_1
        //   162: monitorexit
        //   163: aload 5
        //   165: athrow
        //   166: return
        //
        // Exception table:
        //   from\011to\011target\011type
        //   109\011116\011117\011finally
        //   119\011121\011117\011finally
        //   2\01116\011124\011finally
        //   16\01118\011124\011finally
        //   19\01131\011124\011finally
        //   125\011127\011124\011finally
        //   82\01199\011134\011finally
        //   101\011103\011134\011finally
        //   129\011131\011134\011finally
        //   136\011138\011134\011finally
        //   33\01154\011141\011finally
        //   63\01180\011141\011finally
        //   80\01182\011141\011finally
        //   138\011141\011141\011finally
        //   149\011156\011159\011finally
        //   161\011163\011159\011finally
      }
    };
    localSubjectSubscriptionManager.onTerminated = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        Integer localInteger = (Integer)paramAnonymousSubjectObserver.index();
        if (localInteger == null)
          localInteger = Integer.valueOf(0);
        this.val$state.replayObserverFromIndex(localInteger, paramAnonymousSubjectObserver);
      }
    };
    return new ReplaySubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager, localUnboundedReplayState);
  }

  static <T> ReplaySubject<T> createUnbounded()
  {
    BoundedState localBoundedState = new BoundedState(new EmptyEvictionPolicy(), UtilityFunctions.identity(), UtilityFunctions.identity());
    return createWithState(localBoundedState, new DefaultOnAdd(localBoundedState));
  }

  public static <T> ReplaySubject<T> createWithSize(int paramInt)
  {
    BoundedState localBoundedState = new BoundedState(new SizeEvictionPolicy(paramInt), UtilityFunctions.identity(), UtilityFunctions.identity());
    return createWithState(localBoundedState, new DefaultOnAdd(localBoundedState));
  }

  static final <T> ReplaySubject<T> createWithState(BoundedState<T> paramBoundedState, Action1<SubjectSubscriptionManager.SubjectObserver<T>> paramAction1)
  {
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    localSubjectSubscriptionManager.onStart = paramAction1;
    localSubjectSubscriptionManager.onAdded = new Action1()
    {
      // ERROR //
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        // Byte code:
        //   0: aload_1
        //   1: monitorenter
        //   2: aload_1
        //   3: getfield 32\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:first\011Z
        //   6: ifeq +10 -> 16
        //   9: aload_1
        //   10: getfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   13: ifeq +6 -> 19
        //   16: aload_1
        //   17: monitorexit
        //   18: return
        //   19: aload_1
        //   20: iconst_0
        //   21: putfield 32\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:first\011Z
        //   24: aload_1
        //   25: iconst_1
        //   26: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   29: aload_1
        //   30: monitorexit
        //   31: iconst_0
        //   32: istore_3
        //   33: aload_1
        //   34: invokevirtual 39\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:index\011()Ljava/lang/Object;
        //   37: checkcast 41\011rx/subjects/ReplaySubject$NodeList$Node
        //   40: astore 6
        //   42: aload_0
        //   43: getfield 18\011rx/subjects/ReplaySubject$4:val$state\011Lrx/subjects/ReplaySubject$BoundedState;
        //   46: invokevirtual 47\011rx/subjects/ReplaySubject$BoundedState:tail\011()Lrx/subjects/ReplaySubject$NodeList$Node;
        //   49: astore 7
        //   51: iconst_0
        //   52: istore_3
        //   53: aload 6
        //   55: aload 7
        //   57: if_acmpeq +17 -> 74
        //   60: aload_1
        //   61: aload_0
        //   62: getfield 18\011rx/subjects/ReplaySubject$4:val$state\011Lrx/subjects/ReplaySubject$BoundedState;
        //   65: aload 6
        //   67: aload_1
        //   68: invokevirtual 51\011rx/subjects/ReplaySubject$BoundedState:replayObserverFromIndex\011(Lrx/subjects/ReplaySubject$NodeList$Node;Lrx/subjects/SubjectSubscriptionManager$SubjectObserver;)Lrx/subjects/ReplaySubject$NodeList$Node;
        //   71: invokevirtual 53\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:index\011(Ljava/lang/Object;)V
        //   74: aload_1
        //   75: monitorenter
        //   76: aload 7
        //   78: aload_0
        //   79: getfield 18\011rx/subjects/ReplaySubject$4:val$state\011Lrx/subjects/ReplaySubject$BoundedState;
        //   82: invokevirtual 47\011rx/subjects/ReplaySubject$BoundedState:tail\011()Lrx/subjects/ReplaySubject$NodeList$Node;
        //   85: if_acmpne +38 -> 123
        //   88: aload_1
        //   89: iconst_0
        //   90: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   93: iconst_1
        //   94: istore_3
        //   95: aload_1
        //   96: monitorexit
        //   97: iload_3
        //   98: ifne +62 -> 160
        //   101: aload_1
        //   102: monitorenter
        //   103: aload_1
        //   104: iconst_0
        //   105: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   108: aload_1
        //   109: monitorexit
        //   110: return
        //   111: astore 9
        //   113: aload_1
        //   114: monitorexit
        //   115: aload 9
        //   117: athrow
        //   118: astore_2
        //   119: aload_1
        //   120: monitorexit
        //   121: aload_2
        //   122: athrow
        //   123: aload_1
        //   124: monitorexit
        //   125: goto -92 -> 33
        //   128: astore 8
        //   130: aload_1
        //   131: monitorexit
        //   132: aload 8
        //   134: athrow
        //   135: astore 4
        //   137: iload_3
        //   138: ifne +12 -> 150
        //   141: aload_1
        //   142: monitorenter
        //   143: aload_1
        //   144: iconst_0
        //   145: putfield 35\011rx/subjects/SubjectSubscriptionManager$SubjectObserver:emitting\011Z
        //   148: aload_1
        //   149: monitorexit
        //   150: aload 4
        //   152: athrow
        //   153: astore 5
        //   155: aload_1
        //   156: monitorexit
        //   157: aload 5
        //   159: athrow
        //   160: return
        //
        // Exception table:
        //   from\011to\011target\011type
        //   103\011110\011111\011finally
        //   113\011115\011111\011finally
        //   2\01116\011118\011finally
        //   16\01118\011118\011finally
        //   19\01131\011118\011finally
        //   119\011121\011118\011finally
        //   76\01193\011128\011finally
        //   95\01197\011128\011finally
        //   123\011125\011128\011finally
        //   130\011132\011128\011finally
        //   33\01151\011135\011finally
        //   60\01174\011135\011finally
        //   74\01176\011135\011finally
        //   132\011135\011135\011finally
        //   143\011150\011153\011finally
        //   155\011157\011153\011finally
      }
    };
    localSubjectSubscriptionManager.onTerminated = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        ReplaySubject.NodeList.Node localNode = (ReplaySubject.NodeList.Node)paramAnonymousSubjectObserver.index();
        if (localNode == null)
          localNode = this.val$state.head();
        this.val$state.replayObserverFromIndex(localNode, paramAnonymousSubjectObserver);
      }
    };
    return new ReplaySubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager, paramBoundedState);
  }

  public static <T> ReplaySubject<T> createWithTime(long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    BoundedState localBoundedState = new BoundedState(new TimeEvictionPolicy(paramTimeUnit.toMillis(paramLong), paramScheduler), new AddTimestamped(paramScheduler), new RemoveTimestamped());
    return createWithState(localBoundedState, new TimedOnAdd(localBoundedState, paramScheduler));
  }

  public static <T> ReplaySubject<T> createWithTimeAndSize(long paramLong, TimeUnit paramTimeUnit, int paramInt, Scheduler paramScheduler)
  {
    BoundedState localBoundedState = new BoundedState(new PairEvictionPolicy(new SizeEvictionPolicy(paramInt), new TimeEvictionPolicy(paramTimeUnit.toMillis(paramLong), paramScheduler)), new AddTimestamped(paramScheduler), new RemoveTimestamped());
    return createWithState(localBoundedState, new TimedOnAdd(localBoundedState, paramScheduler));
  }

  @Experimental
  public Throwable getThrowable()
  {
    NotificationLite localNotificationLite = this.ssm.nl;
    Object localObject = this.ssm.get();
    if (localNotificationLite.isError(localObject))
      return localNotificationLite.getError(localObject);
    return null;
  }

  @Experimental
  public Object[] getValues()
  {
    return this.state.toArray((Object[])EMPTY_ARRAY);
  }

  @Experimental
  public T[] getValues(T[] paramArrayOfT)
  {
    return this.state.toArray(paramArrayOfT);
  }

  @Experimental
  public boolean hasAnyValue()
  {
    return !this.state.isEmpty();
  }

  @Experimental
  public boolean hasCompleted()
  {
    NotificationLite localNotificationLite = this.ssm.nl;
    Object localObject = this.ssm.get();
    return (localObject != null) && (!localNotificationLite.isError(localObject));
  }

  public boolean hasObservers()
  {
    return this.ssm.observers().length > 0;
  }

  @Experimental
  public boolean hasThrowable()
  {
    return this.ssm.nl.isError(this.ssm.get());
  }

  public void onCompleted()
  {
    if (this.ssm.active)
    {
      this.state.complete();
      for (SubjectSubscriptionManager.SubjectObserver localSubjectObserver : this.ssm.terminate(NotificationLite.instance().completed()))
        if (caughtUp(localSubjectObserver))
          localSubjectObserver.onCompleted();
    }
  }

  public void onError(Throwable paramThrowable)
  {
    if (this.ssm.active)
    {
      this.state.error(paramThrowable);
      ArrayList localArrayList = null;
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.ssm.terminate(NotificationLite.instance().error(paramThrowable));
      int i = arrayOfSubjectObserver.length;
      int j = 0;
      while (true)
        if (j < i)
        {
          SubjectSubscriptionManager.SubjectObserver localSubjectObserver = arrayOfSubjectObserver[j];
          try
          {
            if (caughtUp(localSubjectObserver))
              localSubjectObserver.onError(paramThrowable);
            j++;
          }
          catch (Throwable localThrowable)
          {
            while (true)
            {
              if (localArrayList == null)
                localArrayList = new ArrayList();
              localArrayList.add(localThrowable);
            }
          }
        }
      Exceptions.throwIfAny(localArrayList);
    }
  }

  public void onNext(T paramT)
  {
    if (this.ssm.active)
    {
      this.state.next(paramT);
      for (SubjectSubscriptionManager.SubjectObserver localSubjectObserver : this.ssm.observers())
        if (caughtUp(localSubjectObserver))
          localSubjectObserver.onNext(paramT);
    }
  }

  @Experimental
  public int size()
  {
    return this.state.size();
  }

  int subscriberCount()
  {
    return this.ssm.state.observers.length;
  }

  static final class AddTimestamped
    implements Func1<Object, Object>
  {
    final Scheduler scheduler;

    public AddTimestamped(Scheduler paramScheduler)
    {
      this.scheduler = paramScheduler;
    }

    public Object call(Object paramObject)
    {
      return new Timestamped(this.scheduler.now(), paramObject);
    }
  }

  static final class BoundedState<T>
    implements ReplaySubject.ReplayState<T, ReplaySubject.NodeList.Node<Object>>
  {
    final Func1<Object, Object> enterTransform;
    final ReplaySubject.EvictionPolicy evictionPolicy;
    final Func1<Object, Object> leaveTransform;
    final ReplaySubject.NodeList<Object> list = new ReplaySubject.NodeList();
    final NotificationLite<T> nl = NotificationLite.instance();
    volatile ReplaySubject.NodeList.Node<Object> tail = this.list.tail;
    volatile boolean terminated;

    public BoundedState(ReplaySubject.EvictionPolicy paramEvictionPolicy, Func1<Object, Object> paramFunc11, Func1<Object, Object> paramFunc12)
    {
      this.evictionPolicy = paramEvictionPolicy;
      this.enterTransform = paramFunc11;
      this.leaveTransform = paramFunc12;
    }

    public void accept(Observer<? super T> paramObserver, ReplaySubject.NodeList.Node<Object> paramNode)
    {
      this.nl.accept(paramObserver, this.leaveTransform.call(paramNode.value));
    }

    public void acceptTest(Observer<? super T> paramObserver, ReplaySubject.NodeList.Node<Object> paramNode, long paramLong)
    {
      Object localObject = paramNode.value;
      if (!this.evictionPolicy.test(localObject, paramLong))
        this.nl.accept(paramObserver, this.leaveTransform.call(localObject));
    }

    public void complete()
    {
      if (!this.terminated)
      {
        this.terminated = true;
        this.list.addLast(this.enterTransform.call(this.nl.completed()));
        this.evictionPolicy.evictFinal(this.list);
        this.tail = this.list.tail;
      }
    }

    public void error(Throwable paramThrowable)
    {
      if (!this.terminated)
      {
        this.terminated = true;
        this.list.addLast(this.enterTransform.call(this.nl.error(paramThrowable)));
        this.evictionPolicy.evictFinal(this.list);
        this.tail = this.list.tail;
      }
    }

    public ReplaySubject.NodeList.Node<Object> head()
    {
      return this.list.head;
    }

    public boolean isEmpty()
    {
      ReplaySubject.NodeList.Node localNode = head().next;
      if (localNode == null);
      Object localObject;
      do
      {
        return true;
        localObject = this.leaveTransform.call(localNode.value);
      }
      while ((this.nl.isError(localObject)) || (this.nl.isCompleted(localObject)));
      return false;
    }

    public void next(T paramT)
    {
      if (!this.terminated)
      {
        this.list.addLast(this.enterTransform.call(this.nl.next(paramT)));
        this.evictionPolicy.evict(this.list);
        this.tail = this.list.tail;
      }
    }

    public boolean replayObserver(SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver)
    {
      try
      {
        paramSubjectObserver.first = false;
        if (paramSubjectObserver.emitting)
          return false;
        paramSubjectObserver.index(replayObserverFromIndex((ReplaySubject.NodeList.Node)paramSubjectObserver.index(), paramSubjectObserver));
        return true;
      }
      finally
      {
      }
    }

    public ReplaySubject.NodeList.Node<Object> replayObserverFromIndex(ReplaySubject.NodeList.Node<Object> paramNode, SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver)
    {
      while (paramNode != tail())
      {
        accept(paramSubjectObserver, paramNode.next);
        paramNode = paramNode.next;
      }
      return paramNode;
    }

    public ReplaySubject.NodeList.Node<Object> replayObserverFromIndexTest(ReplaySubject.NodeList.Node<Object> paramNode, SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver, long paramLong)
    {
      while (paramNode != tail())
      {
        acceptTest(paramSubjectObserver, paramNode.next, paramLong);
        paramNode = paramNode.next;
      }
      return paramNode;
    }

    public int size()
    {
      int i = 0;
      Object localObject1 = head();
      for (ReplaySubject.NodeList.Node localNode = ((ReplaySubject.NodeList.Node)localObject1).next; localNode != null; localNode = localNode.next)
      {
        i++;
        localObject1 = localNode;
      }
      if (((ReplaySubject.NodeList.Node)localObject1).value != null)
      {
        Object localObject2 = this.leaveTransform.call(((ReplaySubject.NodeList.Node)localObject1).value);
        if ((localObject2 != null) && ((this.nl.isError(localObject2)) || (this.nl.isCompleted(localObject2))))
          i--;
      }
      return i;
    }

    public ReplaySubject.NodeList.Node<Object> tail()
    {
      return this.tail;
    }

    public boolean terminated()
    {
      return this.terminated;
    }

    public T[] toArray(T[] paramArrayOfT)
    {
      ArrayList localArrayList = new ArrayList();
      for (ReplaySubject.NodeList.Node localNode = head().next; ; localNode = localNode.next)
      {
        Object localObject;
        if (localNode != null)
        {
          localObject = this.leaveTransform.call(localNode.value);
          if ((localNode.next != null) || ((!this.nl.isError(localObject)) && (!this.nl.isCompleted(localObject))));
        }
        else
        {
          return localArrayList.toArray(paramArrayOfT);
        }
        localArrayList.add(localObject);
      }
    }
  }

  static final class DefaultOnAdd<T>
    implements Action1<SubjectSubscriptionManager.SubjectObserver<T>>
  {
    final ReplaySubject.BoundedState<T> state;

    public DefaultOnAdd(ReplaySubject.BoundedState<T> paramBoundedState)
    {
      this.state = paramBoundedState;
    }

    public void call(SubjectSubscriptionManager.SubjectObserver<T> paramSubjectObserver)
    {
      paramSubjectObserver.index(this.state.replayObserverFromIndex(this.state.head(), paramSubjectObserver));
    }
  }

  static final class EmptyEvictionPolicy
    implements ReplaySubject.EvictionPolicy
  {
    public void evict(ReplaySubject.NodeList<Object> paramNodeList)
    {
    }

    public void evictFinal(ReplaySubject.NodeList<Object> paramNodeList)
    {
    }

    public boolean test(Object paramObject, long paramLong)
    {
      return true;
    }
  }

  static abstract interface EvictionPolicy
  {
    public abstract void evict(ReplaySubject.NodeList<Object> paramNodeList);

    public abstract void evictFinal(ReplaySubject.NodeList<Object> paramNodeList);

    public abstract boolean test(Object paramObject, long paramLong);
  }

  static final class NodeList<T>
  {
    final Node<T> head = new Node(null);
    int size;
    Node<T> tail = this.head;

    public void addLast(T paramT)
    {
      Node localNode1 = this.tail;
      Node localNode2 = new Node(paramT);
      localNode1.next = localNode2;
      this.tail = localNode2;
      this.size = (1 + this.size);
    }

    public void clear()
    {
      this.tail = this.head;
      this.size = 0;
    }

    public boolean isEmpty()
    {
      return this.size == 0;
    }

    public T removeFirst()
    {
      if (this.head.next == null)
        throw new IllegalStateException("Empty!");
      Node localNode = this.head.next;
      this.head.next = localNode.next;
      if (this.head.next == null)
        this.tail = this.head;
      this.size = (-1 + this.size);
      return localNode.value;
    }

    public int size()
    {
      return this.size;
    }

    static final class Node<T>
    {
      volatile Node<T> next;
      final T value;

      Node(T paramT)
      {
        this.value = paramT;
      }
    }
  }

  static final class PairEvictionPolicy
    implements ReplaySubject.EvictionPolicy
  {
    final ReplaySubject.EvictionPolicy first;
    final ReplaySubject.EvictionPolicy second;

    public PairEvictionPolicy(ReplaySubject.EvictionPolicy paramEvictionPolicy1, ReplaySubject.EvictionPolicy paramEvictionPolicy2)
    {
      this.first = paramEvictionPolicy1;
      this.second = paramEvictionPolicy2;
    }

    public void evict(ReplaySubject.NodeList<Object> paramNodeList)
    {
      this.first.evict(paramNodeList);
      this.second.evict(paramNodeList);
    }

    public void evictFinal(ReplaySubject.NodeList<Object> paramNodeList)
    {
      this.first.evictFinal(paramNodeList);
      this.second.evictFinal(paramNodeList);
    }

    public boolean test(Object paramObject, long paramLong)
    {
      return (this.first.test(paramObject, paramLong)) || (this.second.test(paramObject, paramLong));
    }
  }

  static final class RemoveTimestamped
    implements Func1<Object, Object>
  {
    public Object call(Object paramObject)
    {
      return ((Timestamped)paramObject).getValue();
    }
  }

  static abstract interface ReplayState<T, I>
  {
    public abstract void complete();

    public abstract void error(Throwable paramThrowable);

    public abstract boolean isEmpty();

    public abstract void next(T paramT);

    public abstract boolean replayObserver(SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver);

    public abstract I replayObserverFromIndex(I paramI, SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver);

    public abstract I replayObserverFromIndexTest(I paramI, SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver, long paramLong);

    public abstract int size();

    public abstract boolean terminated();

    public abstract T[] toArray(T[] paramArrayOfT);
  }

  static final class SizeEvictionPolicy
    implements ReplaySubject.EvictionPolicy
  {
    final int maxSize;

    public SizeEvictionPolicy(int paramInt)
    {
      this.maxSize = paramInt;
    }

    public void evict(ReplaySubject.NodeList<Object> paramNodeList)
    {
      while (paramNodeList.size() > this.maxSize)
        paramNodeList.removeFirst();
    }

    public void evictFinal(ReplaySubject.NodeList<Object> paramNodeList)
    {
      while (paramNodeList.size() > 1 + this.maxSize)
        paramNodeList.removeFirst();
    }

    public boolean test(Object paramObject, long paramLong)
    {
      return false;
    }
  }

  static final class TimeEvictionPolicy
    implements ReplaySubject.EvictionPolicy
  {
    final long maxAgeMillis;
    final Scheduler scheduler;

    public TimeEvictionPolicy(long paramLong, Scheduler paramScheduler)
    {
      this.maxAgeMillis = paramLong;
      this.scheduler = paramScheduler;
    }

    public void evict(ReplaySubject.NodeList<Object> paramNodeList)
    {
      long l = this.scheduler.now();
      while ((!paramNodeList.isEmpty()) && (test(paramNodeList.head.next.value, l)))
        paramNodeList.removeFirst();
    }

    public void evictFinal(ReplaySubject.NodeList<Object> paramNodeList)
    {
      long l = this.scheduler.now();
      while ((paramNodeList.size > 1) && (test(paramNodeList.head.next.value, l)))
        paramNodeList.removeFirst();
    }

    public boolean test(Object paramObject, long paramLong)
    {
      return ((Timestamped)paramObject).getTimestampMillis() <= paramLong - this.maxAgeMillis;
    }
  }

  static final class TimedOnAdd<T>
    implements Action1<SubjectSubscriptionManager.SubjectObserver<T>>
  {
    final Scheduler scheduler;
    final ReplaySubject.BoundedState<T> state;

    public TimedOnAdd(ReplaySubject.BoundedState<T> paramBoundedState, Scheduler paramScheduler)
    {
      this.state = paramBoundedState;
      this.scheduler = paramScheduler;
    }

    public void call(SubjectSubscriptionManager.SubjectObserver<T> paramSubjectObserver)
    {
      if (!this.state.terminated);
      for (ReplaySubject.NodeList.Node localNode = this.state.replayObserverFromIndexTest(this.state.head(), paramSubjectObserver, this.scheduler.now()); ; localNode = this.state.replayObserverFromIndex(this.state.head(), paramSubjectObserver))
      {
        paramSubjectObserver.index(localNode);
        return;
      }
    }
  }

  static final class UnboundedReplayState<T>
    implements ReplaySubject.ReplayState<T, Integer>
  {
    static final AtomicIntegerFieldUpdater<UnboundedReplayState> INDEX_UPDATER = AtomicIntegerFieldUpdater.newUpdater(UnboundedReplayState.class, "index");
    volatile int index;
    private final ArrayList<Object> list;
    private final NotificationLite<T> nl = NotificationLite.instance();
    private volatile boolean terminated;

    public UnboundedReplayState(int paramInt)
    {
      this.list = new ArrayList(paramInt);
    }

    public void accept(Observer<? super T> paramObserver, int paramInt)
    {
      this.nl.accept(paramObserver, this.list.get(paramInt));
    }

    public void complete()
    {
      if (!this.terminated)
      {
        this.terminated = true;
        this.list.add(this.nl.completed());
        INDEX_UPDATER.getAndIncrement(this);
      }
    }

    public void error(Throwable paramThrowable)
    {
      if (!this.terminated)
      {
        this.terminated = true;
        this.list.add(this.nl.error(paramThrowable));
        INDEX_UPDATER.getAndIncrement(this);
      }
    }

    public boolean isEmpty()
    {
      return size() == 0;
    }

    public void next(T paramT)
    {
      if (!this.terminated)
      {
        this.list.add(this.nl.next(paramT));
        INDEX_UPDATER.getAndIncrement(this);
      }
    }

    public boolean replayObserver(SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver)
    {
      try
      {
        paramSubjectObserver.first = false;
        if (paramSubjectObserver.emitting)
          return false;
        Integer localInteger = (Integer)paramSubjectObserver.index();
        if (localInteger != null)
        {
          paramSubjectObserver.index(Integer.valueOf(replayObserverFromIndex(localInteger, paramSubjectObserver).intValue()));
          return true;
        }
      }
      finally
      {
      }
      throw new IllegalStateException("failed to find lastEmittedLink for: " + paramSubjectObserver);
    }

    public Integer replayObserverFromIndex(Integer paramInteger, SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver)
    {
      for (int i = paramInteger.intValue(); i < this.index; i++)
        accept(paramSubjectObserver, i);
      return Integer.valueOf(i);
    }

    public Integer replayObserverFromIndexTest(Integer paramInteger, SubjectSubscriptionManager.SubjectObserver<? super T> paramSubjectObserver, long paramLong)
    {
      return replayObserverFromIndex(paramInteger, paramSubjectObserver);
    }

    public int size()
    {
      int i = this.index;
      if (i > 0)
      {
        Object localObject = this.list.get(i - 1);
        if ((this.nl.isCompleted(localObject)) || (this.nl.isError(localObject)))
          i--;
      }
      return i;
    }

    public boolean terminated()
    {
      return this.terminated;
    }

    public T[] toArray(T[] paramArrayOfT)
    {
      int i = size();
      if (i > 0)
      {
        if (i > paramArrayOfT.length)
          paramArrayOfT = (Object[])Array.newInstance(paramArrayOfT.getClass().getComponentType(), i);
        for (int j = 0; j < i; j++)
          paramArrayOfT[j] = this.list.get(j);
        if (i < -1 + paramArrayOfT.length)
          paramArrayOfT[i] = null;
      }
      return paramArrayOfT;
    }
  }
}