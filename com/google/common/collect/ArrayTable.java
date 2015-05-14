package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@Beta
@GwtCompatible(emulated=true)
public final class ArrayTable<R, C, V> extends AbstractTable<R, C, V>
  implements Serializable
{
  private static final long serialVersionUID;
  private final V[][] array;
  private final ImmutableMap<C, Integer> columnKeyToIndex;
  private final ImmutableList<C> columnList;
  private transient ArrayTable<R, C, V>.ColumnMap columnMap;
  private final ImmutableMap<R, Integer> rowKeyToIndex;
  private final ImmutableList<R> rowList;
  private transient ArrayTable<R, C, V>.RowMap rowMap;

  private ArrayTable(ArrayTable<R, C, V> paramArrayTable)
  {
    this.rowList = paramArrayTable.rowList;
    this.columnList = paramArrayTable.columnList;
    this.rowKeyToIndex = paramArrayTable.rowKeyToIndex;
    this.columnKeyToIndex = paramArrayTable.columnKeyToIndex;
    Object[][] arrayOfObject = (Object[][])Array.newInstance(Object.class, new int[] { this.rowList.size(), this.columnList.size() });
    this.array = arrayOfObject;
    eraseAll();
    for (int i = 0; i < this.rowList.size(); i++)
      System.arraycopy(paramArrayTable.array[i], 0, arrayOfObject[i], 0, paramArrayTable.array[i].length);
  }

  private ArrayTable(Table<R, C, V> paramTable)
  {
    this(paramTable.rowKeySet(), paramTable.columnKeySet());
    putAll(paramTable);
  }

  private ArrayTable(Iterable<? extends R> paramIterable, Iterable<? extends C> paramIterable1)
  {
    this.rowList = ImmutableList.copyOf(paramIterable);
    this.columnList = ImmutableList.copyOf(paramIterable1);
    boolean bool2;
    if (!this.rowList.isEmpty())
    {
      bool2 = bool1;
      Preconditions.checkArgument(bool2);
      if (this.columnList.isEmpty())
        break label125;
    }
    while (true)
    {
      Preconditions.checkArgument(bool1);
      this.rowKeyToIndex = index(this.rowList);
      this.columnKeyToIndex = index(this.columnList);
      this.array = ((Object[][])Array.newInstance(Object.class, new int[] { this.rowList.size(), this.columnList.size() }));
      eraseAll();
      return;
      bool2 = false;
      break;
      label125: bool1 = false;
    }
  }

  public static <R, C, V> ArrayTable<R, C, V> create(Table<R, C, V> paramTable)
  {
    if ((paramTable instanceof ArrayTable))
      return new ArrayTable((ArrayTable)paramTable);
    return new ArrayTable(paramTable);
  }

  public static <R, C, V> ArrayTable<R, C, V> create(Iterable<? extends R> paramIterable, Iterable<? extends C> paramIterable1)
  {
    return new ArrayTable(paramIterable, paramIterable1);
  }

  private static <E> ImmutableMap<E, Integer> index(List<E> paramList)
  {
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    for (int i = 0; i < paramList.size(); i++)
      localBuilder.put(paramList.get(i), Integer.valueOf(i));
    return localBuilder.build();
  }

  public V at(int paramInt1, int paramInt2)
  {
    Preconditions.checkElementIndex(paramInt1, this.rowList.size());
    Preconditions.checkElementIndex(paramInt2, this.columnList.size());
    return this.array[paramInt1][paramInt2];
  }

  Iterator<Table.Cell<R, C, V>> cellIterator()
  {
    return new AbstractIndexedListIterator(size())
    {
      protected Table.Cell<R, C, V> get(final int paramAnonymousInt)
      {
        return new Tables.AbstractCell()
        {
          final int columnIndex = paramAnonymousInt % ArrayTable.this.columnList.size();
          final int rowIndex = paramAnonymousInt / ArrayTable.this.columnList.size();

          public C getColumnKey()
          {
            return ArrayTable.this.columnList.get(this.columnIndex);
          }

          public R getRowKey()
          {
            return ArrayTable.this.rowList.get(this.rowIndex);
          }

          public V getValue()
          {
            return ArrayTable.this.at(this.rowIndex, this.columnIndex);
          }
        };
      }
    };
  }

  public Set<Table.Cell<R, C, V>> cellSet()
  {
    return super.cellSet();
  }

  @Deprecated
  public void clear()
  {
    throw new UnsupportedOperationException();
  }

  public Map<R, V> column(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    Integer localInteger = (Integer)this.columnKeyToIndex.get(paramC);
    if (localInteger == null)
      return ImmutableMap.of();
    return new Column(localInteger.intValue());
  }

  public ImmutableList<C> columnKeyList()
  {
    return this.columnList;
  }

  public ImmutableSet<C> columnKeySet()
  {
    return this.columnKeyToIndex.keySet();
  }

  public Map<C, Map<R, V>> columnMap()
  {
    ColumnMap localColumnMap = this.columnMap;
    if (localColumnMap == null)
    {
      localColumnMap = new ColumnMap(null);
      this.columnMap = localColumnMap;
    }
    return localColumnMap;
  }

  public boolean contains(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    return (containsRow(paramObject1)) && (containsColumn(paramObject2));
  }

  public boolean containsColumn(@Nullable Object paramObject)
  {
    return this.columnKeyToIndex.containsKey(paramObject);
  }

  public boolean containsRow(@Nullable Object paramObject)
  {
    return this.rowKeyToIndex.containsKey(paramObject);
  }

  public boolean containsValue(@Nullable Object paramObject)
  {
    for (Object[] arrayOfObject1 : this.array)
    {
      int k = arrayOfObject1.length;
      for (int m = 0; m < k; m++)
        if (Objects.equal(paramObject, arrayOfObject1[m]))
          return true;
    }
    return false;
  }

  public V erase(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Integer localInteger1 = (Integer)this.rowKeyToIndex.get(paramObject1);
    Integer localInteger2 = (Integer)this.columnKeyToIndex.get(paramObject2);
    if ((localInteger1 == null) || (localInteger2 == null))
      return null;
    return set(localInteger1.intValue(), localInteger2.intValue(), null);
  }

  public void eraseAll()
  {
    Object[][] arrayOfObject = this.array;
    int i = arrayOfObject.length;
    for (int j = 0; j < i; j++)
      Arrays.fill(arrayOfObject[j], null);
  }

  public V get(@Nullable Object paramObject1, @Nullable Object paramObject2)
  {
    Integer localInteger1 = (Integer)this.rowKeyToIndex.get(paramObject1);
    Integer localInteger2 = (Integer)this.columnKeyToIndex.get(paramObject2);
    if ((localInteger1 == null) || (localInteger2 == null))
      return null;
    return at(localInteger1.intValue(), localInteger2.intValue());
  }

  public boolean isEmpty()
  {
    return false;
  }

  public V put(R paramR, C paramC, @Nullable V paramV)
  {
    Preconditions.checkNotNull(paramR);
    Preconditions.checkNotNull(paramC);
    Integer localInteger1 = (Integer)this.rowKeyToIndex.get(paramR);
    boolean bool1;
    Integer localInteger2;
    if (localInteger1 != null)
    {
      bool1 = true;
      Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = paramR;
      arrayOfObject1[1] = this.rowList;
      Preconditions.checkArgument(bool1, "Row %s not in %s", arrayOfObject1);
      localInteger2 = (Integer)this.columnKeyToIndex.get(paramC);
      if (localInteger2 == null)
        break label130;
    }
    label130: for (boolean bool2 = true; ; bool2 = false)
    {
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = paramC;
      arrayOfObject2[1] = this.columnList;
      Preconditions.checkArgument(bool2, "Column %s not in %s", arrayOfObject2);
      return set(localInteger1.intValue(), localInteger2.intValue(), paramV);
      bool1 = false;
      break;
    }
  }

  public void putAll(Table<? extends R, ? extends C, ? extends V> paramTable)
  {
    super.putAll(paramTable);
  }

  @Deprecated
  public V remove(Object paramObject1, Object paramObject2)
  {
    throw new UnsupportedOperationException();
  }

  public Map<C, V> row(R paramR)
  {
    Preconditions.checkNotNull(paramR);
    Integer localInteger = (Integer)this.rowKeyToIndex.get(paramR);
    if (localInteger == null)
      return ImmutableMap.of();
    return new Row(localInteger.intValue());
  }

  public ImmutableList<R> rowKeyList()
  {
    return this.rowList;
  }

  public ImmutableSet<R> rowKeySet()
  {
    return this.rowKeyToIndex.keySet();
  }

  public Map<R, Map<C, V>> rowMap()
  {
    RowMap localRowMap = this.rowMap;
    if (localRowMap == null)
    {
      localRowMap = new RowMap(null);
      this.rowMap = localRowMap;
    }
    return localRowMap;
  }

  public V set(int paramInt1, int paramInt2, @Nullable V paramV)
  {
    Preconditions.checkElementIndex(paramInt1, this.rowList.size());
    Preconditions.checkElementIndex(paramInt2, this.columnList.size());
    Object localObject = this.array[paramInt1][paramInt2];
    this.array[paramInt1][paramInt2] = paramV;
    return localObject;
  }

  public int size()
  {
    return this.rowList.size() * this.columnList.size();
  }

  @GwtIncompatible("reflection")
  public V[][] toArray(Class<V> paramClass)
  {
    int[] arrayOfInt = new int[2];
    arrayOfInt[0] = this.rowList.size();
    arrayOfInt[1] = this.columnList.size();
    Object[][] arrayOfObject = (Object[][])Array.newInstance(paramClass, arrayOfInt);
    for (int i = 0; i < this.rowList.size(); i++)
      System.arraycopy(this.array[i], 0, arrayOfObject[i], 0, this.array[i].length);
    return arrayOfObject;
  }

  public Collection<V> values()
  {
    return super.values();
  }

  private static abstract class ArrayMap<K, V> extends Maps.ImprovedAbstractMap<K, V>
  {
    private final ImmutableMap<K, Integer> keyIndex;

    private ArrayMap(ImmutableMap<K, Integer> paramImmutableMap)
    {
      this.keyIndex = paramImmutableMap;
    }

    public void clear()
    {
      throw new UnsupportedOperationException();
    }

    public boolean containsKey(@Nullable Object paramObject)
    {
      return this.keyIndex.containsKey(paramObject);
    }

    protected Set<Map.Entry<K, V>> createEntrySet()
    {
      return new Maps.EntrySet()
      {
        public Iterator<Map.Entry<K, V>> iterator()
        {
          return new AbstractIndexedListIterator(size())
          {
            protected Map.Entry<K, V> get(final int paramAnonymous2Int)
            {
              return new AbstractMapEntry()
              {
                public K getKey()
                {
                  return ArrayTable.ArrayMap.this.getKey(paramAnonymous2Int);
                }

                public V getValue()
                {
                  return ArrayTable.ArrayMap.this.getValue(paramAnonymous2Int);
                }

                public V setValue(V paramAnonymous3V)
                {
                  return ArrayTable.ArrayMap.this.setValue(paramAnonymous2Int, paramAnonymous3V);
                }
              };
            }
          };
        }

        Map<K, V> map()
        {
          return ArrayTable.ArrayMap.this;
        }
      };
    }

    public V get(@Nullable Object paramObject)
    {
      Integer localInteger = (Integer)this.keyIndex.get(paramObject);
      if (localInteger == null)
        return null;
      return getValue(localInteger.intValue());
    }

    K getKey(int paramInt)
    {
      return this.keyIndex.keySet().asList().get(paramInt);
    }

    abstract String getKeyRole();

    @Nullable
    abstract V getValue(int paramInt);

    public boolean isEmpty()
    {
      return this.keyIndex.isEmpty();
    }

    public Set<K> keySet()
    {
      return this.keyIndex.keySet();
    }

    public V put(K paramK, V paramV)
    {
      Integer localInteger = (Integer)this.keyIndex.get(paramK);
      if (localInteger == null)
      {
        String str1 = String.valueOf(String.valueOf(getKeyRole()));
        String str2 = String.valueOf(String.valueOf(paramK));
        String str3 = String.valueOf(String.valueOf(this.keyIndex.keySet()));
        throw new IllegalArgumentException(9 + str1.length() + str2.length() + str3.length() + str1 + " " + str2 + " not in " + str3);
      }
      return setValue(localInteger.intValue(), paramV);
    }

    public V remove(Object paramObject)
    {
      throw new UnsupportedOperationException();
    }

    @Nullable
    abstract V setValue(int paramInt, V paramV);

    public int size()
    {
      return this.keyIndex.size();
    }
  }

  private class Column extends ArrayTable.ArrayMap<R, V>
  {
    final int columnIndex;

    Column(int arg2)
    {
      super(null);
      int i;
      this.columnIndex = i;
    }

    String getKeyRole()
    {
      return "Row";
    }

    V getValue(int paramInt)
    {
      return ArrayTable.this.at(paramInt, this.columnIndex);
    }

    V setValue(int paramInt, V paramV)
    {
      return ArrayTable.this.set(paramInt, this.columnIndex, paramV);
    }
  }

  private class ColumnMap extends ArrayTable.ArrayMap<C, Map<R, V>>
  {
    private ColumnMap()
    {
      super(null);
    }

    String getKeyRole()
    {
      return "Column";
    }

    Map<R, V> getValue(int paramInt)
    {
      return new ArrayTable.Column(ArrayTable.this, paramInt);
    }

    public Map<R, V> put(C paramC, Map<R, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }

    Map<R, V> setValue(int paramInt, Map<R, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }
  }

  private class Row extends ArrayTable.ArrayMap<C, V>
  {
    final int rowIndex;

    Row(int arg2)
    {
      super(null);
      int i;
      this.rowIndex = i;
    }

    String getKeyRole()
    {
      return "Column";
    }

    V getValue(int paramInt)
    {
      return ArrayTable.this.at(this.rowIndex, paramInt);
    }

    V setValue(int paramInt, V paramV)
    {
      return ArrayTable.this.set(this.rowIndex, paramInt, paramV);
    }
  }

  private class RowMap extends ArrayTable.ArrayMap<R, Map<C, V>>
  {
    private RowMap()
    {
      super(null);
    }

    String getKeyRole()
    {
      return "Row";
    }

    Map<C, V> getValue(int paramInt)
    {
      return new ArrayTable.Row(ArrayTable.this, paramInt);
    }

    public Map<C, V> put(R paramR, Map<C, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }

    Map<C, V> setValue(int paramInt, Map<C, V> paramMap)
    {
      throw new UnsupportedOperationException();
    }
  }
}