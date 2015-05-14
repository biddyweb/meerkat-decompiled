package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable.OnSubscribe;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;

public final class BehaviorSubject<T> extends Subject<T, T>
{
  private final NotificationLite<T> nl = NotificationLite.instance();
  private final SubjectSubscriptionManager<T> state;

  protected BehaviorSubject(Observable.OnSubscribe<T> paramOnSubscribe, SubjectSubscriptionManager<T> paramSubjectSubscriptionManager)
  {
    super(paramOnSubscribe);
    this.state = paramSubjectSubscriptionManager;
  }

  public static <T> BehaviorSubject<T> create()
  {
    return create(null, false);
  }

  public static <T> BehaviorSubject<T> create(T paramT)
  {
    return create(paramT, true);
  }

  private static <T> BehaviorSubject<T> create(T paramT, boolean paramBoolean)
  {
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    if (paramBoolean)
      localSubjectSubscriptionManager.set(NotificationLite.instance().next(paramT));
    localSubjectSubscriptionManager.onAdded = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        paramAnonymousSubjectObserver.emitFirst(this.val$state.get(), this.val$state.nl);
      }
    };
    localSubjectSubscriptionManager.onTerminated = localSubjectSubscriptionManager.onAdded;
    return new BehaviorSubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager);
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
    Object localObject = this.state.get();
    if (this.nl.isNext(localObject))
      return this.nl.getValue(localObject);
    return null;
  }

  @Experimental
  public boolean hasCompleted()
  {
    Object localObject = this.state.get();
    return this.nl.isCompleted(localObject);
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
    Object localObject = this.state.get();
    return this.nl.isNext(localObject);
  }

  public void onCompleted()
  {
    if ((this.state.get() == null) || (this.state.active))
    {
      Object localObject = this.nl.completed();
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.terminate(localObject);
      int i = arrayOfSubjectObserver.length;
      for (int j = 0; j < i; j++)
        arrayOfSubjectObserver[j].emitNext(localObject, this.state.nl);
    }
  }

  public void onError(Throwable paramThrowable)
  {
    if ((this.state.get() == null) || (this.state.active))
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
            localSubjectObserver.emitNext(localObject, this.state.nl);
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
    if ((this.state.get() == null) || (this.state.active))
    {
      Object localObject = this.nl.next(paramT);
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.next(localObject);
      int i = arrayOfSubjectObserver.length;
      for (int j = 0; j < i; j++)
        arrayOfSubjectObserver[j].emitNext(localObject, this.state.nl);
    }
  }

  int subscriberCount()
  {
    return this.state.observers().length;
  }
}