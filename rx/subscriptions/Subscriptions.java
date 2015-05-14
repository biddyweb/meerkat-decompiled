package rx.subscriptions;

import java.util.concurrent.Future;
import rx.Subscription;
import rx.annotations.Experimental;
import rx.functions.Action0;

public final class Subscriptions
{
  private static final Unsubscribed UNSUBSCRIBED = new Unsubscribed(null);

  private Subscriptions()
  {
    throw new IllegalStateException("No instances!");
  }

  public static Subscription create(Action0 paramAction0)
  {
    return BooleanSubscription.create(paramAction0);
  }

  public static Subscription empty()
  {
    return BooleanSubscription.create();
  }

  public static Subscription from(Future<?> paramFuture)
  {
    return new FutureSubscription(paramFuture);
  }

  public static CompositeSubscription from(Subscription[] paramArrayOfSubscription)
  {
    return new CompositeSubscription(paramArrayOfSubscription);
  }

  @Experimental
  public static Subscription unsubscribed()
  {
    return UNSUBSCRIBED;
  }

  private static final class FutureSubscription
    implements Subscription
  {
    final Future<?> f;

    public FutureSubscription(Future<?> paramFuture)
    {
      this.f = paramFuture;
    }

    public boolean isUnsubscribed()
    {
      return this.f.isCancelled();
    }

    public void unsubscribe()
    {
      this.f.cancel(true);
    }
  }

  private static final class Unsubscribed
    implements Subscription
  {
    public boolean isUnsubscribed()
    {
      return true;
    }

    public void unsubscribe()
    {
    }
  }
}