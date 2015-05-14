package rx.functions;

public abstract interface Func3<T1, T2, T3, R> extends Function
{
  public abstract R call(T1 paramT1, T2 paramT2, T3 paramT3);
}