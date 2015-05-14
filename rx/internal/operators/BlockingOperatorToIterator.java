package rx.internal.operators;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
import rx.Notification;
import rx.Observable;
import rx.Subscriber;
import rx.Subscription;
import rx.exceptions.Exceptions;

public final class BlockingOperatorToIterator
{
  private BlockingOperatorToIterator()
  {
    throw new IllegalStateException("No instances!");
  }

  public static <T> Iterator<T> toIterator(Observable<? extends T> paramObservable)
  {
    LinkedBlockingQueue localLinkedBlockingQueue = new LinkedBlockingQueue();
    return new Iterator()
    {
      private Notification<? extends T> buf;

      private Notification<? extends T> take()
      {
        try
        {
          Notification localNotification = (Notification)this.val$notifications.take();
          return localNotification;
        }
        catch (InterruptedException localInterruptedException)
        {
          this.val$subscription.unsubscribe();
          throw Exceptions.propagate(localInterruptedException);
        }
      }

      public boolean hasNext()
      {
        if (this.buf == null)
          this.buf = take();
        if (this.buf.isOnError())
          throw Exceptions.propagate(this.buf.getThrowable());
        return !this.buf.isOnCompleted();
      }

      public T next()
      {
        if (hasNext())
        {
          Object localObject = this.buf.getValue();
          this.buf = null;
          return localObject;
        }
        throw new NoSuchElementException();
      }

      public void remove()
      {
        throw new UnsupportedOperationException("Read-only iterator");
      }
    };
  }
}