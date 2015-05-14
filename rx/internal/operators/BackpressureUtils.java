package rx.internal.operators;

import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongFieldUpdater;

final class BackpressureUtils
{
  static <T> long getAndAddRequest(AtomicLong paramAtomicLong, long paramLong)
  {
    long l1;
    long l2;
    do
    {
      l1 = paramAtomicLong.get();
      l2 = l1 + paramLong;
      if (l2 < 0L)
        l2 = 9223372036854775807L;
    }
    while (!paramAtomicLong.compareAndSet(l1, l2));
    return l1;
  }

  static <T> long getAndAddRequest(AtomicLongFieldUpdater<T> paramAtomicLongFieldUpdater, T paramT, long paramLong)
  {
    long l1;
    long l2;
    do
    {
      l1 = paramAtomicLongFieldUpdater.get(paramT);
      l2 = l1 + paramLong;
      if (l2 < 0L)
        l2 = 9223372036854775807L;
    }
    while (!paramAtomicLongFieldUpdater.compareAndSet(paramT, l1, l2));
    return l1;
  }
}