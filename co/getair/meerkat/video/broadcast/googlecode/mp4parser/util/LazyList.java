package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import java.util.AbstractList;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;

public class LazyList<E> extends AbstractList<E>
{
  private static final Logger LOG = Logger.getLogger(LazyList.class);
  Iterator<E> elementSource;
  List<E> underlying;

  public LazyList(List<E> paramList, Iterator<E> paramIterator)
  {
    this.underlying = paramList;
    this.elementSource = paramIterator;
  }

  private void blowup()
  {
    LOG.logDebug("blowup running");
    while (this.elementSource.hasNext())
      this.underlying.add(this.elementSource.next());
  }

  public E get(int paramInt)
  {
    if (this.underlying.size() > paramInt)
      return this.underlying.get(paramInt);
    if (this.elementSource.hasNext())
    {
      this.underlying.add(this.elementSource.next());
      return get(paramInt);
    }
    throw new NoSuchElementException();
  }

  public List<E> getUnderlying()
  {
    return this.underlying;
  }

  public Iterator<E> iterator()
  {
    return new Iterator()
    {
      int pos = 0;

      public boolean hasNext()
      {
        return (this.pos < LazyList.this.underlying.size()) || (LazyList.this.elementSource.hasNext());
      }

      public E next()
      {
        if (this.pos < LazyList.this.underlying.size())
        {
          List localList = LazyList.this.underlying;
          int i = this.pos;
          this.pos = (i + 1);
          return localList.get(i);
        }
        LazyList.this.underlying.add(LazyList.this.elementSource.next());
        return next();
      }

      public void remove()
      {
        throw new UnsupportedOperationException();
      }
    };
  }

  public int size()
  {
    LOG.logDebug("potentially expensive size() call");
    blowup();
    return this.underlying.size();
  }
}