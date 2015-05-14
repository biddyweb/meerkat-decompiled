package rx.subjects;

import java.util.concurrent.TimeUnit;
import rx.Observable.OnSubscribe;
import rx.Observer;
import rx.Scheduler.Worker;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;
import rx.schedulers.TestScheduler;

public final class TestSubject<T> extends Subject<T, T>
{
  private final Scheduler.Worker innerScheduler;
  private final SubjectSubscriptionManager<T> state;

  protected TestSubject(Observable.OnSubscribe<T> paramOnSubscribe, SubjectSubscriptionManager<T> paramSubjectSubscriptionManager, TestScheduler paramTestScheduler)
  {
    super(paramOnSubscribe);
    this.state = paramSubjectSubscriptionManager;
    this.innerScheduler = paramTestScheduler.createWorker();
  }

  private void _onCompleted()
  {
    if (this.state.active)
    {
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.terminate(NotificationLite.instance().completed());
      int i = arrayOfSubjectObserver.length;
      for (int j = 0; j < i; j++)
        arrayOfSubjectObserver[j].onCompleted();
    }
  }

  private void _onError(Throwable paramThrowable)
  {
    if (this.state.active)
    {
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.terminate(NotificationLite.instance().error(paramThrowable));
      int i = arrayOfSubjectObserver.length;
      for (int j = 0; j < i; j++)
        arrayOfSubjectObserver[j].onError(paramThrowable);
    }
  }

  private void _onNext(T paramT)
  {
    SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.observers();
    int i = arrayOfSubjectObserver.length;
    for (int j = 0; j < i; j++)
      arrayOfSubjectObserver[j].onNext(paramT);
  }

  public static <T> TestSubject<T> create(TestScheduler paramTestScheduler)
  {
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    localSubjectSubscriptionManager.onAdded = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        paramAnonymousSubjectObserver.emitFirst(this.val$state.get(), this.val$state.nl);
      }
    };
    localSubjectSubscriptionManager.onTerminated = localSubjectSubscriptionManager.onAdded;
    return new TestSubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager, paramTestScheduler);
  }

  public boolean hasObservers()
  {
    return this.state.observers().length > 0;
  }

  public void onCompleted()
  {
    onCompleted(this.innerScheduler.now());
  }

  public void onCompleted(long paramLong)
  {
    this.innerScheduler.schedule(new Action0()
    {
      public void call()
      {
        TestSubject.this._onCompleted();
      }
    }
    , paramLong, TimeUnit.MILLISECONDS);
  }

  public void onError(Throwable paramThrowable)
  {
    onError(paramThrowable, this.innerScheduler.now());
  }

  public void onError(final Throwable paramThrowable, long paramLong)
  {
    this.innerScheduler.schedule(new Action0()
    {
      public void call()
      {
        TestSubject.this._onError(paramThrowable);
      }
    }
    , paramLong, TimeUnit.MILLISECONDS);
  }

  public void onNext(T paramT)
  {
    onNext(paramT, this.innerScheduler.now());
  }

  public void onNext(final T paramT, long paramLong)
  {
    this.innerScheduler.schedule(new Action0()
    {
      public void call()
      {
        TestSubject.this._onNext(paramT);
      }
    }
    , paramLong, TimeUnit.MILLISECONDS);
  }
}