package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;

@Beta
public class AsyncEventBus extends EventBus
{
  private final ConcurrentLinkedQueue<EventBus.EventWithSubscriber> eventsToDispatch = new ConcurrentLinkedQueue();
  private final Executor executor;

  public AsyncEventBus(String paramString, Executor paramExecutor)
  {
    super(paramString);
    this.executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }

  public AsyncEventBus(Executor paramExecutor)
  {
    super("default");
    this.executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }

  public AsyncEventBus(Executor paramExecutor, SubscriberExceptionHandler paramSubscriberExceptionHandler)
  {
    super(paramSubscriberExceptionHandler);
    this.executor = ((Executor)Preconditions.checkNotNull(paramExecutor));
  }

  void dispatch(final Object paramObject, final EventSubscriber paramEventSubscriber)
  {
    Preconditions.checkNotNull(paramObject);
    Preconditions.checkNotNull(paramEventSubscriber);
    this.executor.execute(new Runnable()
    {
      public void run()
      {
        AsyncEventBus.this.dispatch(paramObject, paramEventSubscriber);
      }
    });
  }

  protected void dispatchQueuedEvents()
  {
    while (true)
    {
      EventBus.EventWithSubscriber localEventWithSubscriber = (EventBus.EventWithSubscriber)this.eventsToDispatch.poll();
      if (localEventWithSubscriber == null)
        return;
      dispatch(localEventWithSubscriber.event, localEventWithSubscriber.subscriber);
    }
  }

  void enqueueEvent(Object paramObject, EventSubscriber paramEventSubscriber)
  {
    this.eventsToDispatch.offer(new EventBus.EventWithSubscriber(paramObject, paramEventSubscriber));
  }
}