package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Preconditions;
import java.lang.reflect.Array;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import javax.annotation.Nullable;
import javax.annotation.concurrent.Immutable;

@GwtCompatible
@Immutable
final class DenseImmutableTable<R, C, V> extends RegularImmutableTable<R, C, V>
{
  private final int[] columnCounts;
  private final ImmutableMap<C, Integer> columnKeyToIndex;
  private final ImmutableMap<C, Map<R, V>> columnMap;
  private final int[] iterationOrderColumn;
  private final int[] iterationOrderRow;
  private final int[] rowCounts;
  private final ImmutableMap<R, Integer> rowKeyToIndex;
  private final ImmutableMap<R, Map<C, V>> rowMap;
  private final V[][] values;

  DenseImmutableTable(ImmutableList<Table.Cell<R, C, V>> paramImmutableList, ImmutableSet<R> paramImmutableSet, ImmutableSet<C> paramImmutableSet1)
  {
    this.values = ((Object[][])Array.newInstance(Object.class, new int[] { paramImmutableSet.size(), paramImmutableSet1.size() }));
    this.rowKeyToIndex = makeIndex(paramImmutableSet);
    this.columnKeyToIndex = makeIndex(paramImmutableSet1);
    this.rowCounts = new int[this.rowKeyToIndex.size()];
    this.columnCounts = new int[this.columnKeyToIndex.size()];
    int[] arrayOfInt1 = new int[paramImmutableList.size()];
    int[] arrayOfInt2 = new int[paramImmutableList.size()];
    int i = 0;
    if (i < paramImmutableList.size())
    {
      Table.Cell localCell = (Table.Cell)paramImmutableList.get(i);
      Object localObject1 = localCell.getRowKey();
      Object localObject2 = localCell.getColumnKey();
      int j = ((Integer)this.rowKeyToIndex.get(localObject1)).intValue();
      int k = ((Integer)this.columnKeyToIndex.get(localObject2)).intValue();
      if (this.values[j][k] == null);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "duplicate key: (%s, %s)", new Object[] { localObject1, localObject2 });
        this.values[j][k] = localCell.getValue();
        int[] arrayOfInt3 = this.rowCounts;
        arrayOfInt3[j] = (1 + arrayOfInt3[j]);
        int[] arrayOfInt4 = this.columnCounts;
        arrayOfInt4[k] = (1 + arrayOfInt4[k]);
        arrayOfInt1[i] = j;
        arrayOfInt2[i] = k;
        i++;
        break;
      }
    }
    this.iterationOrderRow = arrayOfInt1;
    this.iterationOrderColumn = arrayOfInt2;
    this.rowMap = new RowMap(null);
    this.columnMap = new ColumnMap(null);
  }

  private static <E> ImmutableMap<E, Integer> makeIndex(ImmutableSet<E> paramImmutableSet)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = 0;
    Iterator localIterator = paramImmutableSet.iterator();
    while (localIterator.hasNext())
    {
      localBuilder.put(localIterator.next(), Integer.valueOf(i));
      i++;
    }
    return localBuilder.build();
  }

  public ImmutableMap<C, Map<R, V>> columnMap()
  {
    return this.columnMap;
  }

  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Integer localInteger1 = (Integer)this.rowKeyToIndex.get(paramObject1);
    Integer localInteger2 = (Integer)this.columnKeyToIndex.get(paramObject2);
    if ((localInteger1 == null) || (localInteger2 == null))
      return null;
    return this.values[localInteger1.intValue()][localInteger2.intValue()];
  }

  Table.Cell<R, C, V> getCell(int paramInt)
  {
    int i = this.iterationOrderRow[paramInt];
    int j = this.iterationOrderColumn[paramInt];
    return cellOf(rowKeySet().asList().get(i), columnKeySet().asList().get(j), this.values[i][j]);
  }

  V getValue(int paramInt)
  {
    return this.values[this.iterationOrderRow[paramInt]][this.iterationOrderColumn[paramInt]];
  }

  public ImmutableMap<R, Map<C, V>> rowMap()
  {
    return this.rowMap;
  }

  public int size()
  {
    return this.iterationOrderRow.length;
  }

  private final class Column extends DenseImmutableTable.ImmutableArrayMap<R, V>
  {
    private final int columnIndex;

    Column(int arg2)
    {
      super();
      this.columnIndex = i;
    }

    V getValue(int paramInt)
    {
      return DenseImmutableTable.this.values[paramInt][this.columnIndex];
    }

    boolean isPartialView()
    {
      return true;
    }

    ImmutableMap<R, Integer> keyToIndex()
    {
      return DenseImmutableTable.this.rowKeyToIndex;
    }
  }

  private final class ColumnMap extends DenseImmutableTable.ImmutableArrayMap<C, Map<R, V>>
  {
    private ColumnMap()
    {
      super();
    }

    Map<R, V> getValue(int paramInt)
    {
      return new DenseImmutableTable.Column(DenseImmutableTable.this, paramInt);
    }

    boolean isPartialView()
    {
      return false;
    }

    ImmutableMap<C, Integer> keyToIndex()
    {
      return DenseImmutableTable.this.columnKeyToIndex;
    }
  }

  private static abstract class ImmutableArrayMap<K, V> extends ImmutableMap<K, V>
  {
    private final int size;

    ImmutableArrayMap(int paramInt)
    {
      this.size = paramInt;
    }

    private boolean isFull()
    {
      return this.size == keyToIndex().size();
    }

    ImmutableSet<Map.Entry<K, V>> createEntrySet()
    {
      return new ImmutableMapEntrySet()
      {
        public UnmodifiableIterator<Map.Entry<K, V>> iterator()
        {
          return new AbstractIterator()
          {
            private int index = -1;
            private final int maxIndex = DenseImmutableTable.ImmutableArrayMap.this.keyToIndex().size();

            protected Map.Entry<K, V> computeNext()
            {
              for (this.index = (1 + this.index); this.index < this.maxIndex; this.index = (1 + this.index))
              {
                Object localObject = DenseImmutableTable.ImmutableArrayMap.this.getValue(this.index);
                if (localObject != null)
                  return Maps.immutableEntry(DenseImmutableTable.ImmutableArrayMap.this.getKey(this.index), localObject);
              }
              return (Map.Entry)endOfData();
            }
          };
        }

        ImmutableMap<K, V> map()
        {
          return DenseImmutableTable.ImmutableArrayMap.this;
        }
      };
    }

    ImmutableSet<K> createKeySet()
    {
      if (isFull())
        return keyToIndex().keySet();
      return super.createKeySet();
    }

    public V get(@Nullable Object paramObject)
    {
      Integer localInteger = (Integer)keyToIndex().get(paramObject);
      if (localInteger == null)
        return null;
      return getValue(localInteger.intValue());
    }

    K getKey(int paramInt)
    {
      return keyToIndex().keySet().asList().get(paramInt);
    }

    @Nullable
    abstract V getValue(int paramInt);

    abstract ImmutableMap<K, Integer> keyToIndex();

    public int size()
    {
      return this.size;
    }
  }

  private final class Row extends DenseImmutableTable.ImmutableArrayMap<C, V>
  {
    private final int rowIndex;

    Row(int arg2)
    {
      super();
      this.rowIndex = i;
    }

    V getValue(int paramInt)
    {
      return DenseImmutableTable.this.values[this.rowIndex][paramInt];
    }

    boolean isPartialView()
    {
      return true;
    }

    ImmutableMap<C, Integer> keyToIndex()
    {
      return DenseImmutableTable.this.columnKeyToIndex;
    }
  }

  private final class RowMap extends DenseImmutableTable.ImmutableArrayMap<R, Map<C, V>>
  {
    private RowMap()
    {
      super();
    }

    Map<C, V> getValue(int paramInt)
    {
      return new DenseImmutableTable.Row(DenseImmutableTable.this, paramInt);
    }

    boolean isPartialView()
    {
      return false;
    }

    ImmutableMap<R, Integer> keyToIndex()
    {
      return DenseImmutableTable.this.rowKeyToIndex;
    }
  }
}