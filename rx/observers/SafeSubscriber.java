package rx.observers;

import java.io.PrintStream;
import java.util.Arrays;
import rx.Subscriber;
import rx.exceptions.CompositeException;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorFailedException;
import rx.exceptions.OnErrorNotImplementedException;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;

public class SafeSubscriber<T> extends Subscriber<T>
{
  private final Subscriber<? super T> actual;
  boolean done = false;

  public SafeSubscriber(Subscriber<? super T> paramSubscriber)
  {
    super(paramSubscriber);
    this.actual = paramSubscriber;
  }

  private void handlePluginException(Throwable paramThrowable)
  {
    System.err.println("RxJavaErrorHandler threw an Exception. It shouldn't. => " + paramThrowable.getMessage());
    paramThrowable.printStackTrace();
  }

  protected void _onError(Throwable paramThrowable)
  {
    try
    {
      RxJavaPlugins.getInstance().getErrorHandler().handleError(paramThrowable);
    }
    catch (Throwable localThrowable3)
    {
      try
      {
        this.actual.onError(paramThrowable);
      }
      catch (Throwable localThrowable3)
      {
        try
        {
          while (true)
          {
            unsubscribe();
            return;
            localThrowable1 = localThrowable1;
            handlePluginException(localThrowable1);
          }
          localThrowable2 = localThrowable2;
          if ((localThrowable2 instanceof OnErrorNotImplementedException))
          {
            try
            {
              unsubscribe();
              throw ((OnErrorNotImplementedException)localThrowable2);
            }
            catch (Throwable localThrowable6)
            {
            }
            try
            {
              RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable6);
              throw new RuntimeException("Observer.onError not implemented and error while unsubscribing.", new CompositeException(Arrays.asList(new Throwable[] { paramThrowable, localThrowable6 })));
            }
            catch (Throwable localThrowable7)
            {
              while (true)
                handlePluginException(localThrowable7);
            }
          }
          try
          {
            RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable2);
          }
          catch (Throwable localThrowable3)
          {
            try
            {
              while (true)
              {
                unsubscribe();
                throw new OnErrorFailedException("Error occurred when trying to propagate error to Observer.onError", new CompositeException(Arrays.asList(new Throwable[] { paramThrowable, localThrowable2 })));
                localThrowable3 = localThrowable3;
                handlePluginException(localThrowable3);
              }
            }
            catch (Throwable localThrowable4)
            {
              try
              {
                RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable4);
                throw new OnErrorFailedException("Error occurred when trying to propagate error to Observer.onError and during unsubscription.", new CompositeException(Arrays.asList(new Throwable[] { paramThrowable, localThrowable2, localThrowable4 })));
              }
              catch (Throwable localThrowable5)
              {
                while (true)
                  handlePluginException(localThrowable5);
              }
            }
          }
        }
        catch (RuntimeException localRuntimeException)
        {
        }
      }
    }
    try
    {
      RxJavaPlugins.getInstance().getErrorHandler().handleError(localRuntimeException);
      throw new OnErrorFailedException(localRuntimeException);
    }
    catch (Throwable localThrowable8)
    {
      while (true)
        handlePluginException(localThrowable8);
    }
  }

  public Subscriber<? super T> getActual()
  {
    return this.actual;
  }

  public void onCompleted()
  {
    if (!this.done)
      this.done = true;
    try
    {
      this.actual.onCompleted();
      return;
    }
    catch (Throwable localThrowable)
    {
      Exceptions.throwIfFatal(localThrowable);
      _onError(localThrowable);
      return;
    }
    finally
    {
      unsubscribe();
    }
  }

  public void onError(Throwable paramThrowable)
  {
    Exceptions.throwIfFatal(paramThrowable);
    if (!this.done)
    {
      this.done = true;
      _onError(paramThrowable);
    }
  }

  public void onNext(T paramT)
  {
    try
    {
      if (!this.done)
        this.actual.onNext(paramT);
      return;
    }
    catch (Throwable localThrowable)
    {
      Exceptions.throwIfFatal(localThrowable);
      onError(localThrowable);
    }
  }
}