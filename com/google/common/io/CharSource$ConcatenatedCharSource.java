package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.Reader;
import java.util.Iterator;

final class CharSource$ConcatenatedCharSource extends CharSource
{
  private final Iterable<? extends CharSource> sources;

  CharSource$ConcatenatedCharSource(Iterable<? extends CharSource> paramIterable)
  {
    this.sources = ((Iterable)Preconditions.checkNotNull(paramIterable));
  }

  public boolean isEmpty()
    throws IOException
  {
    Iterator localIterator = this.sources.iterator();
    while (localIterator.hasNext())
      if (!((CharSource)localIterator.next()).isEmpty())
        return false;
    return true;
  }

  public Reader openStream()
    throws IOException
  {
    return new MultiReader(this.sources.iterator());
  }

  public String toString()
  {
    String str = String.valueOf(String.valueOf(this.sources));
    return 19 + str.length() + "CharSource.concat(" + str + ")";
  }
}