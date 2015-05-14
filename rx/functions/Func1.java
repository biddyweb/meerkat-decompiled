package rx.functions;

public abstract interface Func1<T1, R> extends Function
{
  public abstract R call(T1 paramT1);
}