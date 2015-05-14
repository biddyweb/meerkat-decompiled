package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable.OnSubscribe;
import rx.annotations.Experimental;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;

public final class PublishSubject<T> extends Subject<T, T>
{
  private final NotificationLite<T> nl = NotificationLite.instance();
  final SubjectSubscriptionManager<T> state;

  protected PublishSubject(Observable.OnSubscribe<T> paramOnSubscribe, SubjectSubscriptionManager<T> paramSubjectSubscriptionManager)
  {
    super(paramOnSubscribe);
    this.state = paramSubjectSubscriptionManager;
  }

  public static <T> PublishSubject<T> create()
  {
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    localSubjectSubscriptionManager.onTerminated = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        paramAnonymousSubjectObserver.emitFirst(this.val$state.get(), this.val$state.nl);
      }
    };
    return new PublishSubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager);
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

  public void onCompleted()
  {
    if (this.state.active)
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
    SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = this.state.observers();
    int i = arrayOfSubjectObserver.length;
    for (int j = 0; j < i; j++)
      arrayOfSubjectObserver[j].onNext(paramT);
  }
}