package com.google.common.collect;

import java.util.Deque;
import java.util.Iterator;

public abstract class ForwardingDeque<E> extends ForwardingQueue<E>
  implements Deque<E>
{
  public void addFirst(E paramE)
  {
    delegate().addFirst(paramE);
  }

  public void addLast(E paramE)
  {
    delegate().addLast(paramE);
  }

  protected abstract Deque<E> delegate();

  public Iterator<E> descendingIterator()
  {
    return delegate().descendingIterator();
  }

  public E getFirst()
  {
    return delegate().getFirst();
  }

  public E getLast()
  {
    return delegate().getLast();
  }

  public boolean offerFirst(E paramE)
  {
    return delegate().offerFirst(paramE);
  }

  public boolean offerLast(E paramE)
  {
    return delegate().offerLast(paramE);
  }

  public E peekFirst()
  {
    return delegate().peekFirst();
  }

  public E peekLast()
  {
    return delegate().peekLast();
  }

  public E pollFirst()
  {
    return delegate().pollFirst();
  }

  public E pollLast()
  {
    return delegate().pollLast();
  }

  public E pop()
  {
    return delegate().pop();
  }

  public void push(E paramE)
  {
    delegate().push(paramE);
  }

  public E removeFirst()
  {
    return delegate().removeFirst();
  }

  public boolean removeFirstOccurrence(Object paramObject)
  {
    return delegate().removeFirstOccurrence(paramObject);
  }

  public E removeLast()
  {
    return delegate().removeLast();
  }

  public boolean removeLastOccurrence(Object paramObject)
  {
    return delegate().removeLastOccurrence(paramObject);
  }
}