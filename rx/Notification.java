package rx;

public final class Notification<T>
{
  private static final Notification<Void> ON_COMPLETED = new Notification(Kind.OnCompleted, null, null);
  private final Kind kind;
  private final Throwable throwable;
  private final T value;

  private Notification(Kind paramKind, T paramT, Throwable paramThrowable)
  {
    this.value = paramT;
    this.throwable = paramThrowable;
    this.kind = paramKind;
  }

  public static <T> Notification<T> createOnCompleted()
  {
    return ON_COMPLETED;
  }

  public static <T> Notification<T> createOnCompleted(Class<T> paramClass)
  {
    return ON_COMPLETED;
  }

  public static <T> Notification<T> createOnError(Throwable paramThrowable)
  {
    return new Notification(Kind.OnError, null, paramThrowable);
  }

  public static <T> Notification<T> createOnNext(T paramT)
  {
    return new Notification(Kind.OnNext, paramT, null);
  }

  public void accept(Observer<? super T> paramObserver)
  {
    if (isOnNext())
      paramObserver.onNext(getValue());
    do
    {
      return;
      if (isOnCompleted())
      {
        paramObserver.onCompleted();
        return;
      }
    }
    while (!isOnError());
    paramObserver.onError(getThrowable());
  }

  public boolean equals(Object paramObject)
  {
    if (paramObject == null);
    Notification localNotification;
    do
    {
      do
      {
        return false;
        if (this == paramObject)
          return true;
      }
      while (paramObject.getClass() != getClass());
      localNotification = (Notification)paramObject;
    }
    while ((localNotification.getKind() != getKind()) || ((hasValue()) && (!getValue().equals(localNotification.getValue()))) || ((hasThrowable()) && (!getThrowable().equals(localNotification.getThrowable()))));
    return true;
  }

  public Kind getKind()
  {
    return this.kind;
  }

  public Throwable getThrowable()
  {
    return this.throwable;
  }

  public T getValue()
  {
    return this.value;
  }

  public boolean hasThrowable()
  {
    return (isOnError()) && (this.throwable != null);
  }

  public boolean hasValue()
  {
    return (isOnNext()) && (this.value != null);
  }

  public int hashCode()
  {
    int i = getKind().hashCode();
    if (hasValue())
      i = i * 31 + getValue().hashCode();
    if (hasThrowable())
      i = i * 31 + getThrowable().hashCode();
    return i;
  }

  public boolean isOnCompleted()
  {
    return getKind() == Kind.OnCompleted;
  }

  public boolean isOnError()
  {
    return getKind() == Kind.OnError;
  }

  public boolean isOnNext()
  {
    return getKind() == Kind.OnNext;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder("[").append(super.toString()).append(" ").append(getKind());
    if (hasValue())
      localStringBuilder.append(" ").append(getValue());
    if (hasThrowable())
      localStringBuilder.append(" ").append(getThrowable().getMessage());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }

  public static enum Kind
  {
    static
    {
      OnError = new Kind("OnError", 1);
      OnCompleted = new Kind("OnCompleted", 2);
      Kind[] arrayOfKind = new Kind[3];
      arrayOfKind[0] = OnNext;
      arrayOfKind[1] = OnError;
      arrayOfKind[2] = OnCompleted;
    }
  }
}