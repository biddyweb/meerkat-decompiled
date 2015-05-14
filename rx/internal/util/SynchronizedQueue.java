package rx.internal.util;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Queue;

public class SynchronizedQueue<T>
  implements Queue<T>
{
  private final LinkedList<T> list = new LinkedList();
  private final int size;

  public SynchronizedQueue()
  {
    this.size = -1;
  }

  public SynchronizedQueue(int paramInt)
  {
    this.size = paramInt;
  }

  public boolean add(T paramT)
  {
    try
    {
      boolean bool = this.list.add(paramT);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean addAll(Collection<? extends T> paramCollection)
  {
    try
    {
      boolean bool = this.list.addAll(paramCollection);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public void clear()
  {
    try
    {
      this.list.clear();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Object clone()
  {
    try
    {
      SynchronizedQueue localSynchronizedQueue = new SynchronizedQueue(this.size);
      localSynchronizedQueue.addAll(this.list);
      return localSynchronizedQueue;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean contains(Object paramObject)
  {
    try
    {
      boolean bool = this.list.contains(paramObject);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean containsAll(Collection<?> paramCollection)
  {
    try
    {
      boolean bool = this.list.containsAll(paramCollection);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public T element()
  {
    try
    {
      Object localObject2 = this.list.element();
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public boolean equals(Object paramObject)
  {
    try
    {
      boolean bool = this.list.equals(paramObject);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int hashCode()
  {
    try
    {
      int i = this.list.hashCode();
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean isEmpty()
  {
    try
    {
      boolean bool = this.list.isEmpty();
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Iterator<T> iterator()
  {
    try
    {
      Iterator localIterator = this.list.iterator();
      return localIterator;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean offer(T paramT)
  {
    try
    {
      if (this.size > -1)
      {
        int i = 1 + this.list.size();
        int j = this.size;
        if (i <= j);
      }
      boolean bool1;
      for (boolean bool2 = false; ; bool2 = bool1)
      {
        return bool2;
        bool1 = this.list.offer(paramT);
      }
    }
    finally
    {
    }
  }

  public T peek()
  {
    try
    {
      Object localObject2 = this.list.peek();
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public T poll()
  {
    try
    {
      Object localObject2 = this.list.poll();
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public T remove()
  {
    try
    {
      Object localObject2 = this.list.remove();
      return localObject2;
    }
    finally
    {
      localObject1 = finally;
      throw localObject1;
    }
  }

  public boolean remove(Object paramObject)
  {
    try
    {
      boolean bool = this.list.remove(paramObject);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean removeAll(Collection<?> paramCollection)
  {
    try
    {
      boolean bool = this.list.removeAll(paramCollection);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public boolean retainAll(Collection<?> paramCollection)
  {
    try
    {
      boolean bool = this.list.retainAll(paramCollection);
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public int size()
  {
    try
    {
      int i = this.list.size();
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public Object[] toArray()
  {
    try
    {
      Object[] arrayOfObject = this.list.toArray();
      return arrayOfObject;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public <R> R[] toArray(R[] paramArrayOfR)
  {
    try
    {
      Object[] arrayOfObject = this.list.toArray(paramArrayOfR);
      return arrayOfObject;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public String toString()
  {
    try
    {
      String str = this.list.toString();
      return str;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
}