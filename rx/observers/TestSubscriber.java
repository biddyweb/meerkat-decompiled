package rx.observers;

import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
import rx.Notification;
import rx.Observer;
import rx.Subscriber;

public class TestSubscriber<T> extends Subscriber<T>
{
  private volatile Thread lastSeenThread;
  private final CountDownLatch latch = new CountDownLatch(1);
  private final TestObserver<T> testObserver;

  public TestSubscriber()
  {
    this.testObserver = new TestObserver(new Observer()
    {
      public void onCompleted()
      {
      }

      public void onError(Throwable paramAnonymousThrowable)
      {
      }

      public void onNext(T paramAnonymousT)
      {
      }
    });
  }

  public TestSubscriber(Observer<T> paramObserver)
  {
    this.testObserver = new TestObserver(paramObserver);
  }

  public TestSubscriber(Subscriber<T> paramSubscriber)
  {
    this.testObserver = new TestObserver(paramSubscriber);
  }

  public void assertNoErrors()
  {
    if (getOnErrorEvents().size() > 0)
      throw new RuntimeException("Unexpected onError events: " + getOnErrorEvents().size(), (Throwable)getOnErrorEvents().get(0));
  }

  public void assertReceivedOnNext(List<T> paramList)
  {
    this.testObserver.assertReceivedOnNext(paramList);
  }

  public void assertTerminalEvent()
  {
    this.testObserver.assertTerminalEvent();
  }

  public void assertUnsubscribed()
  {
    if (!isUnsubscribed())
      throw new AssertionError("Not unsubscribed.");
  }

  public void awaitTerminalEvent()
  {
    try
    {
      this.latch.await();
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new RuntimeException("Interrupted", localInterruptedException);
    }
  }

  public void awaitTerminalEvent(long paramLong, TimeUnit paramTimeUnit)
  {
    try
    {
      this.latch.await(paramLong, paramTimeUnit);
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      throw new RuntimeException("Interrupted", localInterruptedException);
    }
  }

  public void awaitTerminalEventAndUnsubscribeOnTimeout(long paramLong, TimeUnit paramTimeUnit)
  {
    try
    {
      awaitTerminalEvent(paramLong, paramTimeUnit);
      return;
    }
    catch (RuntimeException localRuntimeException)
    {
      unsubscribe();
    }
  }

  public Thread getLastSeenThread()
  {
    return this.lastSeenThread;
  }

  public List<Notification<T>> getOnCompletedEvents()
  {
    return this.testObserver.getOnCompletedEvents();
  }

  public List<Throwable> getOnErrorEvents()
  {
    return this.testObserver.getOnErrorEvents();
  }

  public List<T> getOnNextEvents()
  {
    return this.testObserver.getOnNextEvents();
  }

  public void onCompleted()
  {
    try
    {
      this.lastSeenThread = Thread.currentThread();
      this.testObserver.onCompleted();
      return;
    }
    finally
    {
      this.latch.countDown();
    }
  }

  public void onError(Throwable paramThrowable)
  {
    try
    {
      this.lastSeenThread = Thread.currentThread();
      this.testObserver.onError(paramThrowable);
      return;
    }
    finally
    {
      this.latch.countDown();
    }
  }

  public void onNext(T paramT)
  {
    this.lastSeenThread = Thread.currentThread();
    this.testObserver.onNext(paramT);
  }

  public void requestMore(long paramLong)
  {
    request(paramLong);
  }
}