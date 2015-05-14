package rx.internal.operators;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Observable;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.functions.Func1;
import rx.observers.SerializedSubscriber;
import rx.subscriptions.CompositeSubscription;

public final class OperatorBufferWithStartEndObservable<T, TOpening, TClosing>
  implements Observable.Operator<List<T>, T>
{
  final Func1<? super TOpening, ? extends Observable<? extends TClosing>> bufferClosing;
  final Observable<? extends TOpening> bufferOpening;

  public OperatorBufferWithStartEndObservable(Observable<? extends TOpening> paramObservable, Func1<? super TOpening, ? extends Observable<? extends TClosing>> paramFunc1)
  {
    this.bufferOpening = paramObservable;
    this.bufferClosing = paramFunc1;
  }

  public Subscriber<? super T> call(Subscriber<? super List<T>> paramSubscriber)
  {
    final BufferingSubscriber localBufferingSubscriber = new BufferingSubscriber(new SerializedSubscriber(paramSubscriber));
    Subscriber local1 = new Subscriber()
    {
      public void onCompleted()
      {
        localBufferingSubscriber.onCompleted();
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
        localBufferingSubscriber.onError(paramAnonymousThrowable);
      }

      public void onNext(TOpening paramAnonymousTOpening)
      {
        localBufferingSubscriber.startBuffer(paramAnonymousTOpening);
      }
    };
    paramSubscriber.add(local1);
    paramSubscriber.add(localBufferingSubscriber);
    this.bufferOpening.unsafeSubscribe(local1);
    return localBufferingSubscriber;
  }

  final class BufferingSubscriber extends Subscriber<T>
  {
    final Subscriber<? super List<T>> child;
    final List<List<T>> chunks;
    final CompositeSubscription closingSubscriptions;
    boolean done;

    public BufferingSubscriber()
    {
      Object localObject;
      this.child = localObject;
      this.chunks = new LinkedList();
      this.closingSubscriptions = new CompositeSubscription();
      add(this.closingSubscriptions);
    }

    void endBuffer(List<T> paramList)
    {
      try
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
        while ((List)localIterator.next() != paramList);
        int i = 1;
        localIterator.remove();
        if (i != 0)
        {
          this.child.onNext(paramList);
          return;
        }
      }
      finally
      {
      }
    }

    // ERROR //
    public void onCompleted()
    {
      // Byte code:
      //   0: aload_0
      //   1: monitorenter
      //   2: aload_0
      //   3: getfield 44\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:done\011Z
      //   6: ifeq +6 -> 12
      //   9: aload_0
      //   10: monitorexit
      //   11: return
      //   12: aload_0
      //   13: iconst_1
      //   14: putfield 44\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:done\011Z
      //   17: new 28\011java/util/LinkedList
      //   20: dup
      //   21: aload_0
      //   22: getfield 31\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:chunks\011Ljava/util/List;
      //   25: invokespecial 73\011java/util/LinkedList:<init>\011(Ljava/util/Collection;)V
      //   28: astore_3
      //   29: aload_0
      //   30: getfield 31\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:chunks\011Ljava/util/List;
      //   33: invokeinterface 76 1 0
      //   38: aload_0
      //   39: monitorexit
      //   40: aload_3
      //   41: invokeinterface 50 1 0
      //   46: astore 4
      //   48: aload 4
      //   50: invokeinterface 56 1 0
      //   55: ifeq +42 -> 97
      //   58: aload 4
      //   60: invokeinterface 60 1 0
      //   65: checkcast 46\011java/util/List
      //   68: astore 5
      //   70: aload_0
      //   71: getfield 26\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:child\011Lrx/Subscriber;
      //   74: aload 5
      //   76: invokevirtual 67\011rx/Subscriber:onNext\011(Ljava/lang/Object;)V
      //   79: goto -31 -> 48
      //   82: astore_1
      //   83: aload_0
      //   84: getfield 26\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:child\011Lrx/Subscriber;
      //   87: aload_1
      //   88: invokevirtual 80\011rx/Subscriber:onError\011(Ljava/lang/Throwable;)V
      //   91: return
      //   92: astore_2
      //   93: aload_0
      //   94: monitorexit
      //   95: aload_2
      //   96: athrow
      //   97: aload_0
      //   98: getfield 26\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:child\011Lrx/Subscriber;
      //   101: invokevirtual 82\011rx/Subscriber:onCompleted\011()V
      //   104: aload_0
      //   105: invokevirtual 85\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:unsubscribe\011()V
      //   108: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   0\0112\01182\011java/lang/Throwable
      //   40\01148\01182\011java/lang/Throwable
      //   48\01179\01182\011java/lang/Throwable
      //   95\01197\01182\011java/lang/Throwable
      //   2\01111\01192\011finally
      //   12\01140\01192\011finally
      //   93\01195\01192\011finally
    }

    public void onError(Throwable paramThrowable)
    {
      try
      {
        if (this.done)
          return;
        this.done = true;
        this.chunks.clear();
        this.child.onError(paramThrowable);
        unsubscribe();
        return;
      }
      finally
      {
      }
    }

    public void onNext(T paramT)
    {
      try
      {
        Iterator localIterator = this.chunks.iterator();
        while (localIterator.hasNext())
          ((List)localIterator.next()).add(paramT);
      }
      finally
      {
      }
    }

    // ERROR //
    void startBuffer(TOpening paramTOpening)
    {
      // Byte code:
      //   0: new 91\011java/util/ArrayList
      //   3: dup
      //   4: invokespecial 92\011java/util/ArrayList:<init>\011()V
      //   7: astore_2
      //   8: aload_0
      //   9: monitorenter
      //   10: aload_0
      //   11: getfield 44\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:done\011Z
      //   14: ifeq +6 -> 20
      //   17: aload_0
      //   18: monitorexit
      //   19: return
      //   20: aload_0
      //   21: getfield 31\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:chunks\011Ljava/util/List;
      //   24: aload_2
      //   25: invokeinterface 88 2 0
      //   30: pop
      //   31: aload_0
      //   32: monitorexit
      //   33: aload_0
      //   34: getfield 21\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:this$0\011Lrx/internal/operators/OperatorBufferWithStartEndObservable;
      //   37: getfield 98\011rx/internal/operators/OperatorBufferWithStartEndObservable:bufferClosing\011Lrx/functions/Func1;
      //   40: aload_1
      //   41: invokeinterface 104 2 0
      //   46: checkcast 106\011rx/Observable
      //   49: astore 6
      //   51: new 108\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber$1
      //   54: dup
      //   55: aload_0
      //   56: aload_2
      //   57: invokespecial 111\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber$1:<init>\011(Lrx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber;Ljava/util/List;)V
      //   60: astore 7
      //   62: aload_0
      //   63: getfield 36\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:closingSubscriptions\011Lrx/subscriptions/CompositeSubscription;
      //   66: aload 7
      //   68: invokevirtual 112\011rx/subscriptions/CompositeSubscription:add\011(Lrx/Subscription;)V
      //   71: aload 6
      //   73: aload 7
      //   75: invokevirtual 116\011rx/Observable:unsafeSubscribe\011(Lrx/Subscriber;)Lrx/Subscription;
      //   78: pop
      //   79: return
      //   80: astore_3
      //   81: aload_0
      //   82: monitorexit
      //   83: aload_3
      //   84: athrow
      //   85: astore 5
      //   87: aload_0
      //   88: aload 5
      //   90: invokevirtual 117\011rx/internal/operators/OperatorBufferWithStartEndObservable$BufferingSubscriber:onError\011(Ljava/lang/Throwable;)V
      //   93: return
      //
      // Exception table:
      //   from\011to\011target\011type
      //   10\01119\01180\011finally
      //   20\01133\01180\011finally
      //   81\01183\01180\011finally
      //   33\01151\01185\011java/lang/Throwable
    }
  }
}