package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.concurrent.Immutable;

@GwtCompatible
@Immutable
final class SparseImmutableTable<R, C, V> extends RegularImmutableTable<R, C, V>
{
  private final ImmutableMap<C, Map<R, V>> columnMap;
  private final int[] iterationOrderColumn;
  private final int[] iterationOrderRow;
  private final ImmutableMap<R, Map<C, V>> rowMap;

  SparseImmutableTable(ImmutableList<Table.Cell<R, C, V>> paramImmutableList, ImmutableSet<R> paramImmutableSet, ImmutableSet<C> paramImmutableSet1)
  {
    HashMap localHashMap = Maps.newHashMap();
    LinkedHashMap localLinkedHashMap1 = Maps.newLinkedHashMap();
    Iterator localIterator1 = paramImmutableSet.iterator();
    while (localIterator1.hasNext())
    {
      Object localObject5 = localIterator1.next();
      localHashMap.put(localObject5, Integer.valueOf(localLinkedHashMap1.size()));
      localLinkedHashMap1.put(localObject5, new LinkedHashMap());
    }
    LinkedHashMap localLinkedHashMap2 = Maps.newLinkedHashMap();
    Iterator localIterator2 = paramImmutableSet1.iterator();
    while (localIterator2.hasNext())
      localLinkedHashMap2.put(localIterator2.next(), new LinkedHashMap());
    int[] arrayOfInt1 = new int[paramImmutableList.size()];
    int[] arrayOfInt2 = new int[paramImmutableList.size()];
    for (int i = 0; i < paramImmutableList.size(); i++)
    {
      Table.Cell localCell = (Table.Cell)paramImmutableList.get(i);
      Object localObject1 = localCell.getRowKey();
      Object localObject2 = localCell.getColumnKey();
      Object localObject3 = localCell.getValue();
      arrayOfInt1[i] = ((Integer)localHashMap.get(localObject1)).intValue();
      Map localMap = (Map)localLinkedHashMap1.get(localObject1);
      arrayOfInt2[i] = localMap.size();
      Object localObject4 = localMap.put(localObject2, localObject3);
      if (localObject4 != null)
      {
        String str1 = String.valueOf(String.valueOf(localObject1));
        String str2 = String.valueOf(String.valueOf(localObject2));
        String str3 = String.valueOf(String.valueOf(localObject3));
        String str4 = String.valueOf(String.valueOf(localObject4));
        throw new IllegalArgumentException(37 + str1.length() + str2.length() + str3.length() + str4.length() + "Duplicate value for row=" + str1 + ", column=" + str2 + ": " + str3 + ", " + str4);
      }
      ((Map)localLinkedHashMap2.get(localObject2)).put(localObject1, localObject3);
    }
    this.iterationOrderRow = arrayOfInt1;
    this.iterationOrderColumn = arrayOfInt2;
    ImmutableMap.Builder localBuilder1 = ImmutableMap.builder();
    Iterator localIterator3 = localLinkedHashMap1.entrySet().iterator();
    while (localIterator3.hasNext())
    {
      Map.Entry localEntry2 = (Map.Entry)localIterator3.next();
      localBuilder1.put(localEntry2.getKey(), ImmutableMap.copyOf((Map)localEntry2.getValue()));
    }
    this.rowMap = localBuilder1.build();
    ImmutableMap.Builder localBuilder2 = ImmutableMap.builder();
    Iterator localIterator4 = localLinkedHashMap2.entrySet().iterator();
    while (localIterator4.hasNext())
    {
      Map.Entry localEntry1 = (Map.Entry)localIterator4.next();
      localBuilder2.put(localEntry1.getKey(), ImmutableMap.copyOf((Map)localEntry1.getValue()));
    }
    this.columnMap = localBuilder2.build();
  }

  public ImmutableMap<C, Map<R, V>> columnMap()
  {
    return this.columnMap;
  }

  Table.Cell<R, C, V> getCell(int paramInt)
  {
    int i = this.iterationOrderRow[paramInt];
    Map.Entry localEntry1 = (Map.Entry)this.rowMap.entrySet().asList().get(i);
    ImmutableMap localImmutableMap = (ImmutableMap)localEntry1.getValue();
    int j = this.iterationOrderColumn[paramInt];
    Map.Entry localEntry2 = (Map.Entry)localImmutableMap.entrySet().asList().get(j);
    return cellOf(localEntry1.getKey(), localEntry2.getKey(), localEntry2.getValue());
  }

  V getValue(int paramInt)
  {
    int i = this.iterationOrderRow[paramInt];
    ImmutableMap localImmutableMap = (ImmutableMap)this.rowMap.values().asList().get(i);
    int j = this.iterationOrderColumn[paramInt];
    return localImmutableMap.values().asList().get(j);
  }

  public ImmutableMap<R, Map<C, V>> rowMap()
  {
    return this.rowMap;
  }

  public int size()
  {
    return this.iterationOrderRow.length;
  }
}