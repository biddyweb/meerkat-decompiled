package rx.functions;

public abstract interface Action2<T1, T2> extends Action
{
  public abstract void call(T1 paramT1, T2 paramT2);
}