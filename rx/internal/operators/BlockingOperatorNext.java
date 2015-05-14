package rx.internal.operators;

import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Notification;
import rx.Observable;
import rx.Subscriber;
import rx.exceptions.Exceptions;

public final class BlockingOperatorNext
{
  private BlockingOperatorNext()
  {
    throw new IllegalStateException("No instances!");
  }

  public static <T> Iterable<T> next(Observable<? extends T> paramObservable)
  {
    return new Iterable()
    {
      public Iterator<T> iterator()
      {
        BlockingOperatorNext.NextObserver localNextObserver = new BlockingOperatorNext.NextObserver(null);
        return new BlockingOperatorNext.NextIterator(this.val$items, localNextObserver, null);
      }
    };
  }

  static final class NextIterator<T>
    implements Iterator<T>
  {
    private Throwable error = null;
    private boolean hasNext = true;
    private boolean isNextConsumed = true;
    private final Observable<? extends T> items;
    private T next;
    private final BlockingOperatorNext.NextObserver<T> observer;
    private boolean started = false;

    private NextIterator(Observable<? extends T> paramObservable, BlockingOperatorNext.NextObserver<T> paramNextObserver)
    {
      this.items = paramObservable;
      this.observer = paramNextObserver;
    }

    private boolean moveToNext()
    {
      try
      {
        if (!this.started)
        {
          this.started = true;
          this.observer.setWaiting(1);
          this.items.materialize().subscribe(this.observer);
        }
        Notification localNotification = this.observer.takeNext();
        if (localNotification.isOnNext())
        {
          this.isNextConsumed = false;
          this.next = localNotification.getValue();
          return true;
        }
        this.hasNext = false;
        if (localNotification.isOnCompleted())
          return false;
        if (localNotification.isOnError())
        {
          this.error = localNotification.getThrowable();
          throw Exceptions.propagate(this.error);
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        this.observer.unsubscribe();
        Thread.currentThread().interrupt();
        this.error = localInterruptedException;
        throw Exceptions.propagate(this.error);
      }
      throw new IllegalStateException("Should not reach here");
    }

    public boolean hasNext()
    {
      if (this.error != null)
        throw Exceptions.propagate(this.error);
      if (!this.hasNext)
        return false;
      if (!this.isNextConsumed)
        return true;
      return moveToNext();
    }

    public T next()
    {
      if (this.error != null)
        throw Exceptions.propagate(this.error);
      if (hasNext())
      {
        this.isNextConsumed = true;
        return this.next;
      }
      throw new NoSuchElementException("No more elements");
    }

    public void remove()
    {
      throw new UnsupportedOperationException("Read only iterator");
    }
  }

  private static class NextObserver<T> extends Subscriber<Notification<? extends T>>
  {
    static final AtomicIntegerFieldUpdater<NextObserver> WAITING_UPDATER = AtomicIntegerFieldUpdater.newUpdater(NextObserver.class, "waiting");
    private final BlockingQueue<Notification<? extends T>> buf = new ArrayBlockingQueue(1);
    volatile int waiting;

    public void onCompleted()
    {
    }

    public void onError(Throwable paramThrowable)
    {
    }

    public void onNext(Notification<? extends T> paramNotification)
    {
      if ((WAITING_UPDATER.getAndSet(this, 0) == 1) || (!paramNotification.isOnNext()))
      {
        label21: Notification localNotification;
        for (Object localObject = paramNotification; !this.buf.offer(localObject); localObject = localNotification)
        {
          localNotification = (Notification)this.buf.poll();
          if ((localNotification == null) || (localNotification.isOnNext()))
            break label21;
        }
      }
    }

    void setWaiting(int paramInt)
    {
      this.waiting = paramInt;
    }

    public Notification<? extends T> takeNext()
      throws InterruptedException
    {
      setWaiting(1);
      return (Notification)this.buf.take();
    }
  }
}