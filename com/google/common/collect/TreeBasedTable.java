package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Function;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.io.Serializable;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.SortedMap;
import java.util.SortedSet;
import java.util.TreeMap;

@Beta
@GwtCompatible(serializable=true)
public class TreeBasedTable<R, C, V> extends StandardRowSortedTable<R, C, V>
{
  private static final long serialVersionUID;
  private final Comparator<? super C> columnComparator;

  TreeBasedTable(Comparator<? super R> paramComparator, Comparator<? super C> paramComparator1)
  {
    super(new TreeMap(paramComparator), new Factory(paramComparator1));
    this.columnComparator = paramComparator1;
  }

  public static <R extends Comparable, C extends Comparable, V> TreeBasedTable<R, C, V> create()
  {
    return new TreeBasedTable(Ordering.natural(), Ordering.natural());
  }

  public static <R, C, V> TreeBasedTable<R, C, V> create(TreeBasedTable<R, C, ? extends V> paramTreeBasedTable)
  {
    TreeBasedTable localTreeBasedTable = new TreeBasedTable(paramTreeBasedTable.rowComparator(), paramTreeBasedTable.columnComparator());
    localTreeBasedTable.putAll(paramTreeBasedTable);
    return localTreeBasedTable;
  }

  public static <R, C, V> TreeBasedTable<R, C, V> create(Comparator<? super R> paramComparator, Comparator<? super C> paramComparator1)
  {
    Preconditions.checkNotNull(paramComparator);
    Preconditions.checkNotNull(paramComparator1);
    return new TreeBasedTable(paramComparator, paramComparator1);
  }

  public Comparator<? super C> columnComparator()
  {
    return this.columnComparator;
  }

  Iterator<C> createColumnKeyIterator()
  {
    final Comparator localComparator = columnComparator();
    return new AbstractIterator()
    {
      C lastValue;

      protected C computeNext()
      {
        if (this.val$merged.hasNext())
        {
          Object localObject = this.val$merged.next();
          if ((this.lastValue != null) && (localComparator.compare(localObject, this.lastValue) == 0));
          for (int i = 1; i == 0; i = 0)
          {
            this.lastValue = localObject;
            return this.lastValue;
          }
        }
        this.lastValue = null;
        return endOfData();
      }
    };
  }

  public SortedMap<C, V> row(R paramR)
  {
    return new TreeBasedTable.TreeRow(this, paramR);
  }

  public Comparator<? super R> rowComparator()
  {
    return rowKeySet().comparator();
  }

  public SortedSet<R> rowKeySet()
  {
    return super.rowKeySet();
  }

  public SortedMap<R, Map<C, V>> rowMap()
  {
    return super.rowMap();
  }

  private static class Factory<C, V>
    implements Supplier<TreeMap<C, V>>, Serializable
  {
    private static final long serialVersionUID;
    final Comparator<? super C> comparator;

    Factory(Comparator<? super C> paramComparator)
    {
      this.comparator = paramComparator;
    }

    public TreeMap<C, V> get()
    {
      return new TreeMap(this.comparator);
    }
  }
}