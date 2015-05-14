package rx.internal.operators;

import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Scheduler;
import rx.Subscriber;
import rx.subjects.Subject;

public final class OperatorReplay
{
  private OperatorReplay()
  {
    throw new IllegalStateException("No instances!");
  }

  public static <T> Subject<T, T> createScheduledSubject(Subject<T, T> paramSubject, Scheduler paramScheduler)
  {
    return new SubjectWrapper(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super T> paramAnonymousSubscriber)
      {
        OperatorReplay.subscriberOf(this.val$observedOn).call(paramAnonymousSubscriber);
      }
    }
    , paramSubject);
  }

  public static <T> Observable.OnSubscribe<T> subscriberOf(Observable<T> paramObservable)
  {
    return new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super T> paramAnonymousSubscriber)
      {
        this.val$target.unsafeSubscribe(paramAnonymousSubscriber);
      }
    };
  }

  public static final class SubjectWrapper<T> extends Subject<T, T>
  {
    final Subject<T, T> subject;

    public SubjectWrapper(Observable.OnSubscribe<T> paramOnSubscribe, Subject<T, T> paramSubject)
    {
      super();
      this.subject = paramSubject;
    }

    public boolean hasObservers()
    {
      return this.subject.hasObservers();
    }

    public void onCompleted()
    {
      this.subject.onCompleted();
    }

    public void onError(Throwable paramThrowable)
    {
      this.subject.onError(paramThrowable);
    }

    public void onNext(T paramT)
    {
      this.subject.onNext(paramT);
    }
  }
}