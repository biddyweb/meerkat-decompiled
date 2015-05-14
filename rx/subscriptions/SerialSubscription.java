package rx.subscriptions;

import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Subscription;

public final class SerialSubscription
  implements Subscription
{
  static final AtomicReferenceFieldUpdater<SerialSubscription, State> STATE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(SerialSubscription.class, State.class, "state");
  volatile State state = new State(false, Subscriptions.empty());

  public Subscription get()
  {
    return this.state.subscription;
  }

  public boolean isUnsubscribed()
  {
    return this.state.isUnsubscribed;
  }

  public void set(Subscription paramSubscription)
  {
    if (paramSubscription == null)
      throw new IllegalArgumentException("Subscription can not be null");
    State localState1;
    State localState2;
    do
    {
      localState1 = this.state;
      if (localState1.isUnsubscribed)
      {
        paramSubscription.unsubscribe();
        return;
      }
      localState2 = localState1.set(paramSubscription);
    }
    while (!STATE_UPDATER.compareAndSet(this, localState1, localState2));
    localState1.subscription.unsubscribe();
  }

  public void unsubscribe()
  {
    State localState1;
    State localState2;
    do
    {
      localState1 = this.state;
      if (localState1.isUnsubscribed)
        return;
      localState2 = localState1.unsubscribe();
    }
    while (!STATE_UPDATER.compareAndSet(this, localState1, localState2));
    localState1.subscription.unsubscribe();
  }

  private static final class State
  {
    final boolean isUnsubscribed;
    final Subscription subscription;

    State(boolean paramBoolean, Subscription paramSubscription)
    {
      this.isUnsubscribed = paramBoolean;
      this.subscription = paramSubscription;
    }

    State set(Subscription paramSubscription)
    {
      return new State(this.isUnsubscribed, paramSubscription);
    }

    State unsubscribe()
    {
      return new State(true, this.subscription);
    }
  }
}