package rx.internal.operators;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;

public final class OperatorSwitch<T>
  implements Observable.Operator<T, Observable<? extends T>>
{
  public static <T> OperatorSwitch<T> instance()
  {
    return Holder.INSTANCE;
  }

  public Subscriber<? super Observable<? extends T>> call(Subscriber<? super T> paramSubscriber)
  {
    SwitchSubscriber localSwitchSubscriber = new SwitchSubscriber(paramSubscriber);
    paramSubscriber.add(localSwitchSubscriber);
    return localSwitchSubscriber;
  }

  private static final class Holder
  {
    static final OperatorSwitch<Object> INSTANCE = new OperatorSwitch(null);
  }

  private static final class SwitchSubscriber<T> extends Subscriber<Observable<? extends T>>
  {
    boolean active;
    SwitchSubscriber<T>.InnerSubscriber currentSubscriber;
    boolean emitting;
    final Object guard = new Object();
    int index;
    volatile boolean infinite = false;
    long initialRequested;
    boolean mainDone;
    final NotificationLite<?> nl = NotificationLite.instance();
    List<Object> queue;
    final SerializedSubscriber<T> s;
    final SerialSubscription ssub;

    public SwitchSubscriber(Subscriber<? super T> paramSubscriber)
    {
      this.s = new SerializedSubscriber(paramSubscriber);
      this.ssub = new SerialSubscription();
      paramSubscriber.add(this.ssub);
      paramSubscriber.setProducer(new Producer()
      {
        public void request(long paramAnonymousLong)
        {
          if (OperatorSwitch.SwitchSubscriber.this.infinite);
          while (true)
          {
            return;
            if (paramAnonymousLong == 9223372036854775807L)
              OperatorSwitch.SwitchSubscriber.this.infinite = true;
            synchronized (OperatorSwitch.SwitchSubscriber.this.guard)
            {
              OperatorSwitch.SwitchSubscriber.InnerSubscriber localInnerSubscriber = OperatorSwitch.SwitchSubscriber.this.currentSubscriber;
              if (OperatorSwitch.SwitchSubscriber.this.currentSubscriber == null)
              {
                OperatorSwitch.SwitchSubscriber.this.initialRequested = paramAnonymousLong;
                if (localInnerSubscriber == null)
                  continue;
                localInnerSubscriber.requestMore(paramAnonymousLong);
                return;
              }
              OperatorSwitch.SwitchSubscriber.InnerSubscriber.access$114(OperatorSwitch.SwitchSubscriber.this.currentSubscriber, paramAnonymousLong);
            }
          }
        }
      });
    }

    void complete(int paramInt)
    {
      synchronized (this.guard)
      {
        if (paramInt != this.index)
          return;
        this.active = false;
        if (!this.mainDone)
          return;
      }
      if (this.emitting)
      {
        if (this.queue == null)
          this.queue = new ArrayList();
        this.queue.add(this.nl.completed());
        return;
      }
      List localList = this.queue;
      this.queue = null;
      this.emitting = true;
      drain(localList);
      this.s.onCompleted();
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
          if (this.nl.isCompleted(localObject))
          {
            this.s.onCompleted();
            return;
          }
          if (this.nl.isError(localObject))
          {
            this.s.onError(this.nl.getError(localObject));
            return;
          }
          this.s.onNext(localObject);
        }
      }
    }

    // ERROR //
    void emit(T paramT, int paramInt, SwitchSubscriber<T>.InnerSubscriber paramSwitchSubscriber)
    {
      // Byte code:
      //   0: aload_0
      //   1: getfield 40\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:guard\011Ljava/lang/Object;
      //   4: astore 4
      //   6: aload 4
      //   8: monitorenter
      //   9: iload_2
      //   10: aload_0
      //   11: getfield 78\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:index\011I
      //   14: if_icmpeq +7 -> 21
      //   17: aload 4
      //   19: monitorexit
      //   20: return
      //   21: aload_0
      //   22: getfield 84\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:emitting\011Z
      //   25: ifeq +49 -> 74
      //   28: aload_0
      //   29: getfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   32: ifnonnull +14 -> 46
      //   35: aload_0
      //   36: new 88\011java/util/ArrayList
      //   39: dup
      //   40: invokespecial 89\011java/util/ArrayList:<init>\011()V
      //   43: putfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   46: aload_3
      //   47: invokestatic 147\011rx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber:access$110\011(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;)J
      //   50: pop2
      //   51: aload_0
      //   52: getfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   55: aload_1
      //   56: invokeinterface 98 2 0
      //   61: pop
      //   62: aload 4
      //   64: monitorexit
      //   65: return
      //   66: astore 5
      //   68: aload 4
      //   70: monitorexit
      //   71: aload 5
      //   73: athrow
      //   74: aload_0
      //   75: getfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   78: astore 6
      //   80: aload_0
      //   81: aconst_null
      //   82: putfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   85: aload_0
      //   86: iconst_1
      //   87: putfield 84\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:emitting\011Z
      //   90: aload 4
      //   92: monitorexit
      //   93: iconst_1
      //   94: istore 7
      //   96: iconst_0
      //   97: istore 8
      //   99: aload_0
      //   100: aload 6
      //   102: invokevirtual 102\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:drain\011(Ljava/util/List;)V
      //   105: iload 7
      //   107: ifeq +31 -> 138
      //   110: iconst_0
      //   111: istore 7
      //   113: aload_0
      //   114: getfield 40\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:guard\011Ljava/lang/Object;
      //   117: astore 17
      //   119: aload 17
      //   121: monitorenter
      //   122: aload_3
      //   123: invokestatic 147\011rx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber:access$110\011(Lrx/internal/operators/OperatorSwitch$SwitchSubscriber$InnerSubscriber;)J
      //   126: pop2
      //   127: aload 17
      //   129: monitorexit
      //   130: aload_0
      //   131: getfield 56\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:s\011Lrx/observers/SerializedSubscriber;
      //   134: aload_1
      //   135: invokevirtual 139\011rx/observers/SerializedSubscriber:onNext\011(Ljava/lang/Object;)V
      //   138: aload_0
      //   139: getfield 40\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:guard\011Ljava/lang/Object;
      //   142: astore 12
      //   144: aload 12
      //   146: monitorenter
      //   147: aload_0
      //   148: getfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   151: astore 6
      //   153: aload_0
      //   154: aconst_null
      //   155: putfield 86\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:queue\011Ljava/util/List;
      //   158: aload 6
      //   160: ifnonnull +80 -> 240
      //   163: aload_0
      //   164: iconst_0
      //   165: putfield 84\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:emitting\011Z
      //   168: iconst_1
      //   169: istore 8
      //   171: aload 12
      //   173: monitorexit
      //   174: iload 8
      //   176: ifne +103 -> 279
      //   179: aload_0
      //   180: getfield 40\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:guard\011Ljava/lang/Object;
      //   183: astore 14
      //   185: aload 14
      //   187: monitorenter
      //   188: aload_0
      //   189: iconst_0
      //   190: putfield 84\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:emitting\011Z
      //   193: aload 14
      //   195: monitorexit
      //   196: return
      //   197: astore 15
      //   199: aload 14
      //   201: monitorexit
      //   202: aload 15
      //   204: athrow
      //   205: astore 18
      //   207: aload 17
      //   209: monitorexit
      //   210: aload 18
      //   212: athrow
      //   213: astore 9
      //   215: iload 8
      //   217: ifne +20 -> 237
      //   220: aload_0
      //   221: getfield 40\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:guard\011Ljava/lang/Object;
      //   224: astore 10
      //   226: aload 10
      //   228: monitorenter
      //   229: aload_0
      //   230: iconst_0
      //   231: putfield 84\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:emitting\011Z
      //   234: aload 10
      //   236: monitorexit
      //   237: aload 9
      //   239: athrow
      //   240: aload 12
      //   242: monitorexit
      //   243: aload_0
      //   244: getfield 56\011rx/internal/operators/OperatorSwitch$SwitchSubscriber:s\011Lrx/observers/SerializedSubscriber;
      //   247: invokevirtual 150\011rx/observers/SerializedSubscriber:isUnsubscribed\011()Z
      //   250: istore 16
      //   252: iload 16
      //   254: ifeq -155 -> 99
      //   257: iconst_0
      //   258: istore 8
      //   260: goto -86 -> 174
      //   263: astore 13
      //   265: aload 12
      //   267: monitorexit
      //   268: aload 13
      //   270: athrow
      //   271: astore 11
      //   273: aload 10
      //   275: monitorexit
      //   276: aload 11
      //   278: athrow
      //   279: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   9\01120\01166\011finally
      //   21\01146\01166\011finally
      //   46\01165\01166\011finally
      //   68\01171\01166\011finally
      //   74\01193\01166\011finally
      //   188\011196\011197\011finally
      //   199\011202\011197\011finally
      //   122\011130\011205\011finally
      //   207\011210\011205\011finally
      //   99\011105\011213\011finally
      //   113\011122\011213\011finally
      //   130\011138\011213\011finally
      //   138\011147\011213\011finally
      //   210\011213\011213\011finally
      //   243\011252\011213\011finally
      //   268\011271\011213\011finally
      //   147\011158\011263\011finally
      //   163\011168\011263\011finally
      //   171\011174\011263\011finally
      //   240\011243\011263\011finally
      //   265\011268\011263\011finally
      //   229\011237\011271\011finally
      //   273\011276\011271\011finally
    }

    void error(Throwable paramThrowable, int paramInt)
    {
      synchronized (this.guard)
      {
        if (paramInt != this.index)
          return;
        if (this.emitting)
        {
          if (this.queue == null)
            this.queue = new ArrayList();
          this.queue.add(this.nl.error(paramThrowable));
          return;
        }
      }
      List localList = this.queue;
      this.queue = null;
      this.emitting = true;
      drain(localList);
      this.s.onError(paramThrowable);
      unsubscribe();
    }

    public void onCompleted()
    {
      synchronized (this.guard)
      {
        this.mainDone = true;
        if (this.active)
          return;
        if (this.emitting)
        {
          if (this.queue == null)
            this.queue = new ArrayList();
          this.queue.add(this.nl.completed());
          return;
        }
      }
      List localList = this.queue;
      this.queue = null;
      this.emitting = true;
      drain(localList);
      this.s.onCompleted();
      unsubscribe();
    }

    public void onError(Throwable paramThrowable)
    {
      this.s.onError(paramThrowable);
      unsubscribe();
    }

    public void onNext(Observable<? extends T> paramObservable)
    {
      while (true)
        synchronized (this.guard)
        {
          int i = 1 + this.index;
          this.index = i;
          this.active = true;
          long l;
          if (this.infinite)
          {
            l = 9223372036854775807L;
            this.currentSubscriber = new InnerSubscriber(i, l);
            InnerSubscriber.access$102(this.currentSubscriber, l);
            this.ssub.set(this.currentSubscriber);
            paramObservable.unsafeSubscribe(this.currentSubscriber);
            return;
          }
          if (this.currentSubscriber == null)
            l = this.initialRequested;
          else
            l = this.currentSubscriber.requested;
        }
    }

    final class InnerSubscriber extends Subscriber<T>
    {
      private final int id;
      private final long initialRequested;
      private long requested = 0L;

      public InnerSubscriber(int paramLong, long arg3)
      {
        this.id = paramLong;
        Object localObject;
        this.initialRequested = localObject;
      }

      public void onCompleted()
      {
        OperatorSwitch.SwitchSubscriber.this.complete(this.id);
      }

      public void onError(Throwable paramThrowable)
      {
        OperatorSwitch.SwitchSubscriber.this.error(paramThrowable, this.id);
      }

      public void onNext(T paramT)
      {
        OperatorSwitch.SwitchSubscriber.this.emit(paramT, this.id, this);
      }

      public void onStart()
      {
        requestMore(this.initialRequested);
      }

      public void requestMore(long paramLong)
      {
        request(paramLong);
      }
    }
  }
}