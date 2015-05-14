package rx;

import rx.internal.util.SubscriptionList;

public abstract class Subscriber<T>
  implements Observer<T>, Subscription
{
  private final SubscriptionList cs;
  private final Subscriber<?> op;
  private Producer p;
  private long requested = -9223372036854775808L;

  protected Subscriber()
  {
    this(null, false);
  }

  protected Subscriber(Subscriber<?> paramSubscriber)
  {
    this(paramSubscriber, true);
  }

  protected Subscriber(Subscriber<?> paramSubscriber, boolean paramBoolean)
  {
    this.op = paramSubscriber;
    if ((paramBoolean) && (paramSubscriber != null));
    for (SubscriptionList localSubscriptionList = paramSubscriber.cs; ; localSubscriptionList = new SubscriptionList())
    {
      this.cs = localSubscriptionList;
      return;
    }
  }

  public final void add(Subscription paramSubscription)
  {
    this.cs.add(paramSubscription);
  }

  public final boolean isUnsubscribed()
  {
    return this.cs.isUnsubscribed();
  }

  public void onStart()
  {
  }

  protected final void request(long paramLong)
  {
    if (paramLong < 0L)
      throw new IllegalArgumentException("number requested cannot be negative: " + paramLong);
    while (true)
    {
      Producer localProducer;
      try
      {
        if (this.p != null)
        {
          localProducer = this.p;
          if (localProducer != null)
            localProducer.request(paramLong);
          return;
        }
        if (this.requested == -9223372036854775808L)
        {
          this.requested = paramLong;
          localProducer = null;
          continue;
        }
      }
      finally
      {
      }
      long l = paramLong + this.requested;
      if (l < 0L)
      {
        this.requested = 9223372036854775807L;
        localProducer = null;
      }
      else
      {
        this.requested = l;
        localProducer = null;
      }
    }
  }

  public void setProducer(Producer paramProducer)
  {
    long l;
    try
    {
      l = this.requested;
      this.p = paramProducer;
      Subscriber localSubscriber = this.op;
      int i = 0;
      if (localSubscriber != null)
      {
        boolean bool = l < -9223372036854775808L;
        i = 0;
        if (!bool)
          i = 1;
      }
      if (i != 0)
      {
        this.op.setProducer(this.p);
        return;
      }
    }
    finally
    {
    }
    if (l == -9223372036854775808L)
    {
      this.p.request(9223372036854775807L);
      return;
    }
    this.p.request(l);
  }

  public final void unsubscribe()
  {
    this.cs.unsubscribe();
  }
}