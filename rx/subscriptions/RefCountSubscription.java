package rx.subscriptions;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import java.util.concurrent.atomic.AtomicReferenceFieldUpdater;
import rx.Subscription;

public final class RefCountSubscription
  implements Subscription
{
  static final State EMPTY_STATE = new State(false, 0);
  static final AtomicReferenceFieldUpdater<RefCountSubscription, State> STATE_UPDATER = AtomicReferenceFieldUpdater.newUpdater(RefCountSubscription.class, State.class, "state");
  private final Subscription actual;
  volatile State state = EMPTY_STATE;

  public RefCountSubscription(Subscription paramSubscription)
  {
    if (paramSubscription == null)
      throw new IllegalArgumentException("s");
    this.actual = paramSubscription;
  }

  private void unsubscribeActualIfApplicable(State paramState)
  {
    if ((paramState.isUnsubscribed) && (paramState.children == 0))
      this.actual.unsubscribe();
  }

  public Subscription get()
  {
    State localState1;
    State localState2;
    do
    {
      localState1 = this.state;
      if (localState1.isUnsubscribed)
        return Subscriptions.unsubscribed();
      localState2 = localState1.addChild();
    }
    while (!STATE_UPDATER.compareAndSet(this, localState1, localState2));
    return new InnerSubscription(this);
  }

  public boolean isUnsubscribed()
  {
    return this.state.isUnsubscribed;
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
    unsubscribeActualIfApplicable(localState2);
  }

  void unsubscribeAChild()
  {
    State localState1;
    State localState2;
    do
    {
      localState1 = this.state;
      localState2 = localState1.removeChild();
    }
    while (!STATE_UPDATER.compareAndSet(this, localState1, localState2));
    unsubscribeActualIfApplicable(localState2);
  }

  private static final class InnerSubscription
    implements Subscription
  {
    static final AtomicIntegerFieldUpdater<InnerSubscription> INNER_DONE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(InnerSubscription.class, "innerDone");
    volatile int innerDone;
    final RefCountSubscription parent;

    public InnerSubscription(RefCountSubscription paramRefCountSubscription)
    {
      this.parent = paramRefCountSubscription;
    }

    public boolean isUnsubscribed()
    {
      return this.innerDone != 0;
    }

    public void unsubscribe()
    {
      if (INNER_DONE_UPDATER.compareAndSet(this, 0, 1))
        this.parent.unsubscribeAChild();
    }
  }

  private static final class State
  {
    final int children;
    final boolean isUnsubscribed;

    State(boolean paramBoolean, int paramInt)
    {
      this.isUnsubscribed = paramBoolean;
      this.children = paramInt;
    }

    State addChild()
    {
      return new State(this.isUnsubscribed, 1 + this.children);
    }

    State removeChild()
    {
      return new State(this.isUnsubscribed, -1 + this.children);
    }

    State unsubscribe()
    {
      return new State(true, this.children);
    }
  }
}