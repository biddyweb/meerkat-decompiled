package com.google.common.util.concurrent;

import com.google.common.base.Optional;
import com.google.common.base.Preconditions;
import com.google.common.collect.ImmutableCollection;
import com.google.common.collect.ImmutableList;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.logging.Level;
import java.util.logging.Logger;

class Futures$CombinedFuture<V, C> extends AbstractFuture<C>
{
  private static final Logger logger = Logger.getLogger(CombinedFuture.class.getName());
  final boolean allMustSucceed;
  Futures.FutureCombiner<V, C> combiner;
  ImmutableCollection<? extends ListenableFuture<? extends V>> futures;
  final AtomicInteger remaining;
  Set<Throwable> seenExceptions;
  final Object seenExceptionsLock = new Object();
  List<Optional<V>> values;

  Futures$CombinedFuture(ImmutableCollection<? extends ListenableFuture<? extends V>> paramImmutableCollection, boolean paramBoolean, Executor paramExecutor, Futures.FutureCombiner<V, C> paramFutureCombiner)
  {
    this.futures = paramImmutableCollection;
    this.allMustSucceed = paramBoolean;
    this.remaining = new AtomicInteger(paramImmutableCollection.size());
    this.combiner = paramFutureCombiner;
    this.values = Lists.newArrayListWithCapacity(paramImmutableCollection.size());
    init(paramExecutor);
  }

  private void setExceptionAndMaybeLog(Throwable paramThrowable)
  {
    boolean bool1 = true;
    boolean bool2 = this.allMustSucceed;
    boolean bool3 = false;
    if (bool2)
      bool3 = super.setException(paramThrowable);
    synchronized (this.seenExceptionsLock)
    {
      if (this.seenExceptions == null)
        this.seenExceptions = Sets.newHashSet();
      bool1 = this.seenExceptions.add(paramThrowable);
      if (((paramThrowable instanceof Error)) || ((this.allMustSucceed) && (!bool3) && (bool1)))
        logger.log(Level.SEVERE, "input future failed.", paramThrowable);
      return;
    }
  }

  private void setOneValue(int paramInt, Future<? extends V> paramFuture)
  {
    boolean bool1 = true;
    List localList = this.values;
    boolean bool2;
    if ((isDone()) || (localList == null))
    {
      if ((!this.allMustSucceed) && (!isCancelled()))
        break label136;
      bool2 = bool1;
    }
    label136: label147: label231: int i;
    while (true)
    {
      Preconditions.checkState(bool2, "Future was done before all dependencies completed");
      try
      {
        Preconditions.checkState(paramFuture.isDone(), "Tried to set value from future which is not done");
        Object localObject2 = Uninterruptibles.getUninterruptibly(paramFuture);
        if (localList != null)
          localList.set(paramInt, Optional.fromNullable(localObject2));
        int n = this.remaining.decrementAndGet();
        if (n >= 0);
        while (true)
        {
          Preconditions.checkState(bool1, "Less than 0 remaining futures");
          if (n == 0)
          {
            Futures.FutureCombiner localFutureCombiner5 = this.combiner;
            if ((localFutureCombiner5 == null) || (localList == null))
              break label147;
            set(localFutureCombiner5.combine(localList));
          }
          return;
          bool2 = false;
          break;
          bool1 = false;
        }
        Preconditions.checkState(isDone());
        return;
      }
      catch (CancellationException localCancellationException)
      {
        if (this.allMustSucceed)
          cancel(false);
        int m = this.remaining.decrementAndGet();
        if (m >= 0);
        while (true)
        {
          Preconditions.checkState(bool1, "Less than 0 remaining futures");
          if (m != 0)
            break;
          Futures.FutureCombiner localFutureCombiner4 = this.combiner;
          if ((localFutureCombiner4 == null) || (localList == null))
            break label231;
          set(localFutureCombiner4.combine(localList));
          return;
          bool1 = false;
        }
        Preconditions.checkState(isDone());
        return;
      }
      catch (ExecutionException localExecutionException)
      {
        setExceptionAndMaybeLog(localExecutionException.getCause());
        int k = this.remaining.decrementAndGet();
        if (k >= 0);
        while (true)
        {
          Preconditions.checkState(bool1, "Less than 0 remaining futures");
          if (k != 0)
            break;
          Futures.FutureCombiner localFutureCombiner3 = this.combiner;
          if ((localFutureCombiner3 == null) || (localList == null))
            break label311;
          set(localFutureCombiner3.combine(localList));
          return;
          bool1 = false;
        }
        Preconditions.checkState(isDone());
        return;
      }
      catch (Throwable localThrowable)
      {
        label311: setExceptionAndMaybeLog(localThrowable);
        int j = this.remaining.decrementAndGet();
        if (j >= 0);
        while (true)
        {
          Preconditions.checkState(bool1, "Less than 0 remaining futures");
          if (j != 0)
            break;
          Futures.FutureCombiner localFutureCombiner2 = this.combiner;
          if ((localFutureCombiner2 == null) || (localList == null))
            break label388;
          set(localFutureCombiner2.combine(localList));
          return;
          bool1 = false;
        }
        label388: Preconditions.checkState(isDone());
        return;
      }
      finally
      {
        i = this.remaining.decrementAndGet();
        if (i < 0)
          break label456;
      }
    }
    Preconditions.checkState(bool1, "Less than 0 remaining futures");
    if (i == 0)
    {
      Futures.FutureCombiner localFutureCombiner1 = this.combiner;
      if ((localFutureCombiner1 == null) || (localList == null))
        break label461;
      set(localFutureCombiner1.combine(localList));
    }
    while (true)
    {
      throw localObject1;
      label456: bool1 = false;
      break;
      label461: Preconditions.checkState(isDone());
    }
  }

  protected void init(Executor paramExecutor)
  {
    addListener(new Runnable()
    {
      public void run()
      {
        if (Futures.CombinedFuture.this.isCancelled())
        {
          Iterator localIterator = Futures.CombinedFuture.this.futures.iterator();
          while (localIterator.hasNext())
            ((ListenableFuture)localIterator.next()).cancel(Futures.CombinedFuture.this.wasInterrupted());
        }
        Futures.CombinedFuture.this.futures = null;
        Futures.CombinedFuture.this.values = null;
        Futures.CombinedFuture.this.combiner = null;
      }
    }
    , MoreExecutors.directExecutor());
    if (this.futures.isEmpty())
      set(this.combiner.combine(ImmutableList.of()));
    while (true)
    {
      return;
      for (int i = 0; i < this.futures.size(); i++)
        this.values.add(null);
      final int j = 0;
      Iterator localIterator = this.futures.iterator();
      while (localIterator.hasNext())
      {
        final ListenableFuture localListenableFuture = (ListenableFuture)localIterator.next();
        int k = j + 1;
        localListenableFuture.addListener(new Runnable()
        {
          public void run()
          {
            Futures.CombinedFuture.this.setOneValue(j, localListenableFuture);
          }
        }
        , paramExecutor);
        j = k;
      }
    }
  }
}