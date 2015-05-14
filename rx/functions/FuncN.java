package rx.functions;

public abstract interface FuncN<R> extends Function
{
  public abstract R call(Object[] paramArrayOfObject);
}