package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;
import javax.annotation.Nullable;

@GwtCompatible
abstract class RegularImmutableTable<R, C, V> extends ImmutableTable<R, C, V>
{
  static <R, C, V> RegularImmutableTable<R, C, V> forCells(Iterable<Table.Cell<R, C, V>> paramIterable)
  {
    return forCellsInternal(paramIterable, null, null);
  }

  static <R, C, V> RegularImmutableTable<R, C, V> forCells(List<Table.Cell<R, C, V>> paramList, @Nullable Comparator<? super R> paramComparator, @Nullable final Comparator<? super C> paramComparator1)
  {
    Preconditions.checkNotNull(paramList);
    if ((paramComparator != null) || (paramComparator1 != null))
      Collections.sort(paramList, new Comparator()
      {
        public int compare(Table.Cell<R, C, V> paramAnonymousCell1, Table.Cell<R, C, V> paramAnonymousCell2)
        {
          if (this.val$rowComparator == null);
          for (int i = 0; i != 0; i = this.val$rowComparator.compare(paramAnonymousCell1.getRowKey(), paramAnonymousCell2.getRowKey()))
            return i;
          Comparator localComparator = paramComparator1;
          int j = 0;
          if (localComparator == null);
          while (true)
          {
            return j;
            j = paramComparator1.compare(paramAnonymousCell1.getColumnKey(), paramAnonymousCell2.getColumnKey());
          }
        }
      });
    return forCellsInternal(paramList, paramComparator, paramComparator1);
  }

  private static final <R, C, V> RegularImmutableTable<R, C, V> forCellsInternal(Iterable<Table.Cell<R, C, V>> paramIterable, @Nullable Comparator<? super R> paramComparator, @Nullable Comparator<? super C> paramComparator1)
  {
    ImmutableSet.Builder localBuilder1 = ImmutableSet.builder();
    ImmutableSet.Builder localBuilder2 = ImmutableSet.builder();
    ImmutableList localImmutableList = ImmutableList.copyOf(paramIterable);
    Iterator localIterator = localImmutableList.iterator();
    while (localIterator.hasNext())
    {
      Table.Cell localCell = (Table.Cell)localIterator.next();
      localBuilder1.add(localCell.getRowKey());
      localBuilder2.add(localCell.getColumnKey());
    }
    ImmutableSet localImmutableSet1 = localBuilder1.build();
    if (paramComparator != null)
    {
      ArrayList localArrayList2 = Lists.newArrayList(localImmutableSet1);
      Collections.sort(localArrayList2, paramComparator);
      localImmutableSet1 = ImmutableSet.copyOf(localArrayList2);
    }
    ImmutableSet localImmutableSet2 = localBuilder2.build();
    if (paramComparator1 != null)
    {
      ArrayList localArrayList1 = Lists.newArrayList(localImmutableSet2);
      Collections.sort(localArrayList1, paramComparator1);
      localImmutableSet2 = ImmutableSet.copyOf(localArrayList1);
    }
    if (localImmutableList.size() > localImmutableSet1.size() * localImmutableSet2.size() / 2L)
      return new DenseImmutableTable(localImmutableList, localImmutableSet1, localImmutableSet2);
    return new SparseImmutableTable(localImmutableList, localImmutableSet1, localImmutableSet2);
  }

  final ImmutableSet<Table.Cell<R, C, V>> createCellSet()
  {
    if (isEmpty())
      return ImmutableSet.of();
    return new CellSet(null);
  }

  final ImmutableCollection<V> createValues()
  {
    if (isEmpty())
      return ImmutableList.of();
    return new Values(null);
  }

  abstract Table.Cell<R, C, V> getCell(int paramInt);

  abstract V getValue(int paramInt);

  private final class CellSet extends ImmutableSet<Table.Cell<R, C, V>>
  {
    private CellSet()
    {
    }

    public boolean contains(@Nullable Object paramObject)
    {
      boolean bool1 = paramObject instanceof Table.Cell;
      boolean bool2 = false;
      if (bool1)
      {
        Table.Cell localCell = (Table.Cell)paramObject;
        Object localObject = RegularImmutableTable.this.get(localCell.getRowKey(), localCell.getColumnKey());
        bool2 = false;
        if (localObject != null)
        {
          boolean bool3 = localObject.equals(localCell.getValue());
          bool2 = false;
          if (bool3)
            bool2 = true;
        }
      }
      return bool2;
    }

    ImmutableList<Table.Cell<R, C, V>> createAsList()
    {
      return new ImmutableAsList()
      {
        ImmutableCollection<Table.Cell<R, C, V>> delegateCollection()
        {
          return RegularImmutableTable.CellSet.this;
        }

        public Table.Cell<R, C, V> get(int paramAnonymousInt)
        {
          return RegularImmutableTable.this.getCell(paramAnonymousInt);
        }
      };
    }

    boolean isPartialView()
    {
      return false;
    }

    public UnmodifiableIterator<Table.Cell<R, C, V>> iterator()
    {
      return asList().iterator();
    }

    public int size()
    {
      return RegularImmutableTable.this.size();
    }
  }

  private final class Values extends ImmutableList<V>
  {
    private Values()
    {
    }

    public V get(int paramInt)
    {
      return RegularImmutableTable.this.getValue(paramInt);
    }

    boolean isPartialView()
    {
      return true;
    }

    public int size()
    {
      return RegularImmutableTable.this.size();
    }
  }
}