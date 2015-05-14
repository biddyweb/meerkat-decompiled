package rx.functions;

public abstract interface Action1<T1> extends Action
{
  public abstract void call(T1 paramT1);
}