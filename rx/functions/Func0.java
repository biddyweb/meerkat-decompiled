package rx.functions;

import java.util.concurrent.Callable;

public abstract interface Func0<R> extends Function, Callable<R>
{
  public abstract R call();
}