package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Deque;
import java.util.PriorityQueue;
import java.util.Queue;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.TimeUnit;

public final class Queues
{
  @Beta
  public static <E> int drain(BlockingQueue<E> paramBlockingQueue, Collection<? super E> paramCollection, int paramInt, long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException
  {
    Preconditions.checkNotNull(paramCollection);
    long l = System.nanoTime() + paramTimeUnit.toNanos(paramLong);
    int i = 0;
    while (true)
    {
      Object localObject;
      if (i < paramInt)
      {
        i += paramBlockingQueue.drainTo(paramCollection, paramInt - i);
        if (i < paramInt)
        {
          localObject = paramBlockingQueue.poll(l - System.nanoTime(), TimeUnit.NANOSECONDS);
          if (localObject != null);
        }
      }
      else
      {
        return i;
        paramCollection.add(localObject);
        i++;
      }
    }
  }

  @Beta
  public static <E> int drainUninterruptibly(BlockingQueue<E> paramBlockingQueue, Collection<? super E> paramCollection, int paramInt, long paramLong, TimeUnit paramTimeUnit)
  {
    Preconditions.checkNotNull(paramCollection);
    long l = System.nanoTime() + paramTimeUnit.toNanos(paramLong);
    int i = 0;
    int j = 0;
    while (true)
    {
      int k;
      if (i < paramInt)
        k = paramInt - i;
      try
      {
        int m = paramBlockingQueue.drainTo(paramCollection, k);
        i += m;
        if (i >= paramInt)
          continue;
        Object localObject2;
        while (true)
          try
          {
            localObject2 = paramBlockingQueue.poll(l - System.nanoTime(), TimeUnit.NANOSECONDS);
            if (localObject2 != null)
              break;
            return i;
          }
          catch (InterruptedException localInterruptedException)
          {
            j = 1;
          }
        paramCollection.add(localObject2);
        i++;
      }
      finally
      {
        if (j != 0)
          Thread.currentThread().interrupt();
      }
    }
  }

  public static <E> ArrayBlockingQueue<E> newArrayBlockingQueue(int paramInt)
  {
    return new ArrayBlockingQueue(paramInt);
  }

  public static <E> ArrayDeque<E> newArrayDeque()
  {
    return new ArrayDeque();
  }

  public static <E> ArrayDeque<E> newArrayDeque(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return new ArrayDeque(Collections2.cast(paramIterable));
    ArrayDeque localArrayDeque = new ArrayDeque();
    Iterables.addAll(localArrayDeque, paramIterable);
    return localArrayDeque;
  }

  public static <E> ConcurrentLinkedQueue<E> newConcurrentLinkedQueue()
  {
    return new ConcurrentLinkedQueue();
  }

  public static <E> ConcurrentLinkedQueue<E> newConcurrentLinkedQueue(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return new ConcurrentLinkedQueue(Collections2.cast(paramIterable));
    ConcurrentLinkedQueue localConcurrentLinkedQueue = new ConcurrentLinkedQueue();
    Iterables.addAll(localConcurrentLinkedQueue, paramIterable);
    return localConcurrentLinkedQueue;
  }

  public static <E> LinkedBlockingDeque<E> newLinkedBlockingDeque()
  {
    return new LinkedBlockingDeque();
  }

  public static <E> LinkedBlockingDeque<E> newLinkedBlockingDeque(int paramInt)
  {
    return new LinkedBlockingDeque(paramInt);
  }

  public static <E> LinkedBlockingDeque<E> newLinkedBlockingDeque(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return new LinkedBlockingDeque(Collections2.cast(paramIterable));
    LinkedBlockingDeque localLinkedBlockingDeque = new LinkedBlockingDeque();
    Iterables.addAll(localLinkedBlockingDeque, paramIterable);
    return localLinkedBlockingDeque;
  }

  public static <E> LinkedBlockingQueue<E> newLinkedBlockingQueue()
  {
    return new LinkedBlockingQueue();
  }

  public static <E> LinkedBlockingQueue<E> newLinkedBlockingQueue(int paramInt)
  {
    return new LinkedBlockingQueue(paramInt);
  }

  public static <E> LinkedBlockingQueue<E> newLinkedBlockingQueue(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return new LinkedBlockingQueue(Collections2.cast(paramIterable));
    LinkedBlockingQueue localLinkedBlockingQueue = new LinkedBlockingQueue();
    Iterables.addAll(localLinkedBlockingQueue, paramIterable);
    return localLinkedBlockingQueue;
  }

  public static <E extends Comparable> PriorityBlockingQueue<E> newPriorityBlockingQueue()
  {
    return new PriorityBlockingQueue();
  }

  public static <E extends Comparable> PriorityBlockingQueue<E> newPriorityBlockingQueue(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return new PriorityBlockingQueue(Collections2.cast(paramIterable));
    PriorityBlockingQueue localPriorityBlockingQueue = new PriorityBlockingQueue();
    Iterables.addAll(localPriorityBlockingQueue, paramIterable);
    return localPriorityBlockingQueue;
  }

  public static <E extends Comparable> PriorityQueue<E> newPriorityQueue()
  {
    return new PriorityQueue();
  }

  public static <E extends Comparable> PriorityQueue<E> newPriorityQueue(Iterable<? extends E> paramIterable)
  {
    if ((paramIterable instanceof Collection))
      return new PriorityQueue(Collections2.cast(paramIterable));
    PriorityQueue localPriorityQueue = new PriorityQueue();
    Iterables.addAll(localPriorityQueue, paramIterable);
    return localPriorityQueue;
  }

  public static <E> SynchronousQueue<E> newSynchronousQueue()
  {
    return new SynchronousQueue();
  }

  public static <E> Deque<E> synchronizedDeque(Deque<E> paramDeque)
  {
    return Synchronized.deque(paramDeque, null);
  }

  public static <E> Queue<E> synchronizedQueue(Queue<E> paramQueue)
  {
    return Synchronized.queue(paramQueue, null);
  }
}