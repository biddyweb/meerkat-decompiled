package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable.Operator;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.SerialSubscription;

public final class OperatorDebounceWithTime<T>
  implements Observable.Operator<T, T>
{
  final Scheduler scheduler;
  final long timeout;
  final TimeUnit unit;

  public OperatorDebounceWithTime(long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    this.timeout = paramLong;
    this.unit = paramTimeUnit;
    this.scheduler = paramScheduler;
  }

  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    final Scheduler.Worker localWorker = this.scheduler.createWorker();
    final SerializedSubscriber localSerializedSubscriber = new SerializedSubscriber(paramSubscriber);
    final SerialSubscription localSerialSubscription = new SerialSubscription();
    localSerializedSubscriber.add(localWorker);
    localSerializedSubscriber.add(localSerialSubscription);
    return new Subscriber(paramSubscriber)
    {
      final Subscriber<?> self = this;
      final OperatorDebounceWithTime.DebounceState<T> state = new OperatorDebounceWithTime.DebounceState();

      public void onCompleted()
      {
        this.state.emitAndComplete(localSerializedSubscriber, this);
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        localSerializedSubscriber.onError(paramAnonymousThrowable);
        unsubscribe();
        this.state.clear();
      }

      public void onNext(T paramAnonymousT)
      {
        final int i = this.state.next(paramAnonymousT);
        localSerialSubscription.set(localWorker.schedule(new Action0()
        {
          public void call()
          {
            OperatorDebounceWithTime.1.this.state.emit(i, OperatorDebounceWithTime.1.this.val$s, OperatorDebounceWithTime.1.this.self);
          }
        }
        , OperatorDebounceWithTime.this.timeout, OperatorDebounceWithTime.this.unit));
      }
    };
  }

  static final class DebounceState<T>
  {
    boolean emitting;
    boolean hasValue;
    int index;
    boolean terminate;
    T value;

    public void clear()
    {
      try
      {
        this.index = (1 + this.index);
        this.value = null;
        this.hasValue = false;
        return;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }

    // ERROR //
    public void emit(int paramInt, Subscriber<T> paramSubscriber, Subscriber<?> paramSubscriber1)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 31\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:emitting\011Z
      //   6: ifne +18 -> 24
      //   9: aload_0
      //   10: getfield 25\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:hasValue\011Z
      //   13: ifeq +11 -> 24
      //   16: iload_1
      //   17: aload_0
      //   18: getfield 21\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:index\011I
      //   21: if_icmpeq +6 -> 27
      //   24: aload_0
      //   25: monitorexit
      //   26: return
      //   27: aload_0
      //   28: getfield 23\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:value\011Ljava/lang/Object;
      //   31: astore 5
      //   33: aload_0
      //   34: getfield 25\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:hasValue\011Z
      //   37: istore 6
      //   39: aload_0
      //   40: aconst_null
      //   41: putfield 23\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:value\011Ljava/lang/Object;
      //   44: aload_0
      //   45: iconst_0
      //   46: putfield 25\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:hasValue\011Z
      //   49: aload_0
      //   50: iconst_1
      //   51: putfield 31\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:emitting\011Z
      //   54: aload_0
      //   55: monitorexit
      //   56: iload 6
      //   58: ifeq +9 -> 67
      //   61: aload_2
      //   62: aload 5
      //   64: invokevirtual 37\011rx/Subscriber:onNext\011(Ljava/lang/Object;)V
      //   67: aload_0
      //   68: monitorenter
      //   69: aload_0
      //   70: getfield 39\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:terminate\011Z
      //   73: ifne +34 -> 107
      //   76: aload_0
      //   77: iconst_0
      //   78: putfield 31\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:emitting\011Z
      //   81: aload_0
      //   82: monitorexit
      //   83: return
      //   84: astore 7
      //   86: aload_0
      //   87: monitorexit
      //   88: aload 7
      //   90: athrow
      //   91: astore 4
      //   93: aload_0
      //   94: monitorexit
      //   95: aload 4
      //   97: athrow
      //   98: astore 8
      //   100: aload_3
      //   101: aload 8
      //   103: invokevirtual 43\011rx/Subscriber:onError\011(Ljava/lang/Throwable;)V
      //   106: return
      //   107: aload_0
      //   108: monitorexit
      //   109: aload_2
      //   110: invokevirtual 46\011rx/Subscriber:onCompleted\011()V
      //   113: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   69\01183\01184\011finally
      //   86\01188\01184\011finally
      //   107\011109\01184\011finally
      //   2\01124\01191\011finally
      //   24\01126\01191\011finally
      //   27\01156\01191\011finally
      //   93\01195\01191\011finally
      //   61\01167\01198\011java/lang/Throwable
    }

    // ERROR //
    public void emitAndComplete(Subscriber<T> paramSubscriber, Subscriber<?> paramSubscriber1)
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 31\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:emitting\011Z
      //   6: ifeq +11 -> 17
      //   9: aload_0
      //   10: iconst_1
      //   11: putfield 39\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:terminate\011Z
      //   14: aload_0
      //   15: monitorexit
      //   16: return
      //   17: aload_0
      //   18: getfield 23\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:value\011Ljava/lang/Object;
      //   21: astore 4
      //   23: aload_0
      //   24: getfield 25\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:hasValue\011Z
      //   27: istore 5
      //   29: aload_0
      //   30: aconst_null
      //   31: putfield 23\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:value\011Ljava/lang/Object;
      //   34: aload_0
      //   35: iconst_0
      //   36: putfield 25\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:hasValue\011Z
      //   39: aload_0
      //   40: iconst_1
      //   41: putfield 31\011rx/internal/operators/OperatorDebounceWithTime$DebounceState:emitting\011Z
      //   44: aload_0
      //   45: monitorexit
      //   46: iload 5
      //   48: ifeq +9 -> 57
      //   51: aload_1
      //   52: aload 4
      //   54: invokevirtual 37\011rx/Subscriber:onNext\011(Ljava/lang/Object;)V
      //   57: aload_1
      //   58: invokevirtual 46\011rx/Subscriber:onCompleted\011()V
      //   61: return
      //   62: astore_3
      //   63: aload_0
      //   64: monitorexit
      //   65: aload_3
      //   66: athrow
      //   67: astore 6
      //   69: aload_2
      //   70: aload 6
      //   72: invokevirtual 43\011rx/Subscriber:onError\011(Ljava/lang/Throwable;)V
      //   75: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   2\01116\01162\011finally
      //   17\01146\01162\011finally
      //   63\01165\01162\011finally
      //   51\01157\01167\011java/lang/Throwable
    }

    public int next(T paramT)
    {
      try
      {
        this.value = paramT;
        this.hasValue = true;
        int i = 1 + this.index;
        this.index = i;
        return i;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
  }
}