package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.util.ArrayDeque;
import java.util.Collection;
import java.util.Queue;

@Beta
@GwtIncompatible("java.util.ArrayDeque")
public final class EvictingQueue<E> extends ForwardingQueue<E>
  implements Serializable
{
  private static final long serialVersionUID;
  private final Queue<E> delegate;

  @VisibleForTesting
  final int maxSize;

  private EvictingQueue(int paramInt)
  {
    if (paramInt >= 0);
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool, "maxSize (%s) must >= 0", arrayOfObject);
      this.delegate = new ArrayDeque(paramInt);
      this.maxSize = paramInt;
      return;
    }
  }

  public static <E> EvictingQueue<E> create(int paramInt)
  {
    return new EvictingQueue(paramInt);
  }

  public boolean add(E paramE)
  {
    Preconditions.checkNotNull(paramE);
    if (this.maxSize == 0)
      return true;
    if (size() == this.maxSize)
      this.delegate.remove();
    this.delegate.add(paramE);
    return true;
  }

  public boolean addAll(Collection<? extends E> paramCollection)
  {
    return standardAddAll(paramCollection);
  }

  public boolean contains(Object paramObject)
  {
    return delegate().contains(Preconditions.checkNotNull(paramObject));
  }

  protected Queue<E> delegate()
  {
    return this.delegate;
  }

  public boolean offer(E paramE)
  {
    return add(paramE);
  }

  public int remainingCapacity()
  {
    return this.maxSize - size();
  }

  public boolean remove(Object paramObject)
  {
    return delegate().remove(Preconditions.checkNotNull(paramObject));
  }
}