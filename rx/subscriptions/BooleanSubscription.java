package rx.subscriptions;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Subscription;
import rx.functions.Action0;

public final class BooleanSubscription
  implements Subscription
{
  static final AtomicIntegerFieldUpdater<BooleanSubscription> UNSUBSCRIBED_UPDATER = AtomicIntegerFieldUpdater.newUpdater(BooleanSubscription.class, "unsubscribed");
  private final Action0 action;
  volatile int unsubscribed;

  public BooleanSubscription()
  {
    this.action = null;
  }

  private BooleanSubscription(Action0 paramAction0)
  {
    this.action = paramAction0;
  }

  public static BooleanSubscription create()
  {
    return new BooleanSubscription();
  }

  public static BooleanSubscription create(Action0 paramAction0)
  {
    return new BooleanSubscription(paramAction0);
  }

  public boolean isUnsubscribed()
  {
    return this.unsubscribed != 0;
  }

  public final void unsubscribe()
  {
    if ((UNSUBSCRIBED_UPDATER.compareAndSet(this, 0, 1)) && (this.action != null))
      this.action.call();
  }
}