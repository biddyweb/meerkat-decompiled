package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable.OnSubscribe;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;

public final class AsyncSubject<T> extends Subject<T, T>
{
  volatile Object lastValue;
  private final NotificationLite<T> nl = NotificationLite.instance();
  final SubjectSubscriptionManager<T> state;

  protected AsyncSubject(Observable.OnSubscribe<T> paramOnSubscribe, SubjectSubscriptionManager<T> paramSubjectSubscriptionManager)
  {
    super(paramOnSubscribe);
    this.state = paramSubjectSubscriptionManager;
  }

  public static <T> AsyncSubject<T> create()
  {
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    localSubjectSubscriptionManager.onTerminated = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        Object localObject = this.val$state.get();
        NotificationLite localNotificationLite = this.val$state.nl;
        paramAnonymousSubjectObserver.accept(localObject, localNotificationLite);
        if ((localObject == null) || ((!localNotificationLite.isCompleted(localObject)) && (!localNotificationLite.isError(localObject))))
          paramAnonymousSubjectObserver.onCompleted();
      }
    };
    return new AsyncSubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager);
  }

  @Experimental
  public Throwable getThrowable()
  {
    Object localObject = this.state.get();
    if (this.nl.isError(localObject))
      return this.nl.getError(localObject);
    return null;
  }

  @Experimental
  public T getValue()
  {
    Object localObject1 = this.lastValue;
    Object localObject2 = this.state.get();
    if ((!this.nl.isError(localObject2)) && (this.nl.isNext(localObject1)))
      return this.nl.getValue(localObject1);
    return null;
  }

  @Experimental
  public boolean hasCompleted()
  {
    Object localObject = this.state.get();
    return (localObject != null) && (!this.nl.isError(localObject));
  }

  public boolean hasObservers()
  {
    return this.state.observers().length > 0;
  }

  @Experimental
  public boolean hasThrowable()
  {
    Object localObject = this.state.get();
    return this.nl.isError(localObject);
  }

  @Experimental
  public boolean hasValue()
  {
    Object localObject1 = this.lastValue;
    Object localObject2 = this.state.get();
    return (!this.nl.isError(localObject2)) && (this.nl.isNext(localObject1));
  }

  public void onCompleted()
  {
    if (this.state.active)
    {
      Object localObject = this.lastValue;
      if (localObject == null)
        localObject = this.nl.completed();
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.terminate(localObject);
      int i = arrayOfSubjectObserver.length;
      int j = 0;
      if (j < i)
      {
        SubjectSubscriptionManager.SubjectObserver localSubjectObserver = arrayOfSubjectObserver[j];
        if (localObject == this.nl.completed())
          localSubjectObserver.onCompleted();
        while (true)
        {
          j++;
          break;
          localSubjectObserver.onNext(this.nl.getValue(localObject));
          localSubjectObserver.onCompleted();
        }
      }
    }
  }

  public void onError(Throwable paramThrowable)
  {
    if (this.state.active)
    {
      Object localObject = this.nl.error(paramThrowable);
      ArrayList localArrayList = null;
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.terminate(localObject);
      int i = arrayOfSubjectObserver.length;
      int j = 0;
      while (true)
        if (j < i)
        {
          SubjectSubscriptionManager.SubjectObserver localSubjectObserver = arrayOfSubjectObserver[j];
          try
          {
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
    this.lastValue = this.nl.next(paramT);
  }
}