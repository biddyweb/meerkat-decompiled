package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.base.MoreObjects;
import com.google.common.base.Preconditions;
import java.io.IOException;
import java.io.InvalidObjectException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible(emulated=true, serializable=true)
public class ImmutableSetMultimap<K, V> extends ImmutableMultimap<K, V>
  implements SetMultimap<K, V>
{

  @GwtIncompatible("not needed in emulated source.")
  private static final long serialVersionUID;
  private final transient ImmutableSet<V> emptySet;
  private transient ImmutableSet<Map.Entry<K, V>> entries;
  private transient ImmutableSetMultimap<V, K> inverse;

  ImmutableSetMultimap(ImmutableMap<K, ImmutableSet<V>> paramImmutableMap, int paramInt, @Nullable Comparator<? super V> paramComparator)
  {
    super(paramImmutableMap, paramInt);
    this.emptySet = emptySet(paramComparator);
  }

  public static <K, V> Builder<K, V> builder()
  {
    return new Builder();
  }

  public static <K, V> ImmutableSetMultimap<K, V> copyOf(Multimap<? extends K, ? extends V> paramMultimap)
  {
    return copyOf(paramMultimap, null);
  }

  private static <K, V> ImmutableSetMultimap<K, V> copyOf(Multimap<? extends K, ? extends V> paramMultimap, Comparator<? super V> paramComparator)
  {
    Preconditions.checkNotNull(paramMultimap);
    ImmutableSetMultimap localImmutableSetMultimap;
    if ((paramMultimap.isEmpty()) && (paramComparator == null))
      localImmutableSetMultimap = of();
    do
    {
      return localImmutableSetMultimap;
      if (!(paramMultimap instanceof ImmutableSetMultimap))
        break;
      localImmutableSetMultimap = (ImmutableSetMultimap)paramMultimap;
    }
    while (!localImmutableSetMultimap.isPartialView());
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int i = 0;
    Iterator localIterator = paramMultimap.asMap().entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject = localEntry.getKey();
      ImmutableSet localImmutableSet = valueSet(paramComparator, (Collection)localEntry.getValue());
      if (!localImmutableSet.isEmpty())
      {
        localBuilder.put(localObject, localImmutableSet);
        i += localImmutableSet.size();
      }
    }
    return new ImmutableSetMultimap(localBuilder.build(), i, paramComparator);
  }

  private static <V> ImmutableSet<V> emptySet(@Nullable Comparator<? super V> paramComparator)
  {
    if (paramComparator == null)
      return ImmutableSet.of();
    return ImmutableSortedSet.emptySet(paramComparator);
  }

  private ImmutableSetMultimap<V, K> invert()
  {
    Builder localBuilder = builder();
    Iterator localIterator = entries().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localBuilder.put(localEntry.getValue(), localEntry.getKey());
    }
    ImmutableSetMultimap localImmutableSetMultimap = localBuilder.build();
    localImmutableSetMultimap.inverse = this;
    return localImmutableSetMultimap;
  }

  public static <K, V> ImmutableSetMultimap<K, V> of()
  {
    return EmptyImmutableSetMultimap.INSTANCE;
  }

  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK, V paramV)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK, paramV);
    return localBuilder.build();
  }

  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    return localBuilder.build();
  }

  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    localBuilder.put(paramK3, paramV3);
    return localBuilder.build();
  }

  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    localBuilder.put(paramK3, paramV3);
    localBuilder.put(paramK4, paramV4);
    return localBuilder.build();
  }

  public static <K, V> ImmutableSetMultimap<K, V> of(K paramK1, V paramV1, K paramK2, V paramV2, K paramK3, V paramV3, K paramK4, V paramV4, K paramK5, V paramV5)
  {
    Builder localBuilder = builder();
    localBuilder.put(paramK1, paramV1);
    localBuilder.put(paramK2, paramV2);
    localBuilder.put(paramK3, paramV3);
    localBuilder.put(paramK4, paramV4);
    localBuilder.put(paramK5, paramV5);
    return localBuilder.build();
  }

  @GwtIncompatible("java.io.ObjectInputStream")
  private void readObject(ObjectInputStream paramObjectInputStream)
    throws IOException, ClassNotFoundException
  {
    paramObjectInputStream.defaultReadObject();
    Comparator localComparator = (Comparator)paramObjectInputStream.readObject();
    int i = paramObjectInputStream.readInt();
    if (i < 0)
      throw new InvalidObjectException(29 + "Invalid key count " + i);
    ImmutableMap.Builder localBuilder = ImmutableMap.builder();
    int j = 0;
    for (int k = 0; k < i; k++)
    {
      Object localObject = paramObjectInputStream.readObject();
      int m = paramObjectInputStream.readInt();
      if (m <= 0)
        throw new InvalidObjectException(31 + "Invalid value count " + m);
      Object[] arrayOfObject = new Object[m];
      for (int n = 0; n < m; n++)
        arrayOfObject[n] = paramObjectInputStream.readObject();
      ImmutableSet localImmutableSet = valueSet(localComparator, Arrays.asList(arrayOfObject));
      if (localImmutableSet.size() != arrayOfObject.length)
      {
        String str = String.valueOf(String.valueOf(localObject));
        throw new InvalidObjectException(40 + str.length() + "Duplicate key-value pairs exist for key " + str);
      }
      localBuilder.put(localObject, localImmutableSet);
      j += m;
    }
    try
    {
      ImmutableMap localImmutableMap = localBuilder.build();
      ImmutableMultimap.FieldSettersHolder.MAP_FIELD_SETTER.set(this, localImmutableMap);
      ImmutableMultimap.FieldSettersHolder.SIZE_FIELD_SETTER.set(this, j);
      ImmutableMultimap.FieldSettersHolder.EMPTY_SET_FIELD_SETTER.set(this, emptySet(localComparator));
      return;
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      throw ((InvalidObjectException)new InvalidObjectException(localIllegalArgumentException.getMessage()).initCause(localIllegalArgumentException));
    }
  }

  private static <V> ImmutableSet<V> valueSet(@Nullable Comparator<? super V> paramComparator, Collection<? extends V> paramCollection)
  {
    if (paramComparator == null)
      return ImmutableSet.copyOf(paramCollection);
    return ImmutableSortedSet.copyOf(paramComparator, paramCollection);
  }

  @GwtIncompatible("java.io.ObjectOutputStream")
  private void writeObject(ObjectOutputStream paramObjectOutputStream)
    throws IOException
  {
    paramObjectOutputStream.defaultWriteObject();
    paramObjectOutputStream.writeObject(valueComparator());
    Serialization.writeMultimap(this, paramObjectOutputStream);
  }

  public ImmutableSet<Map.Entry<K, V>> entries()
  {
    Object localObject = this.entries;
    if (localObject == null)
    {
      localObject = new EntrySet(this);
      this.entries = ((ImmutableSet)localObject);
    }
    return localObject;
  }

  public ImmutableSet<V> get(@Nullable K paramK)
  {
    return (ImmutableSet)MoreObjects.firstNonNull((ImmutableSet)this.map.get(paramK), this.emptySet);
  }

  public ImmutableSetMultimap<V, K> inverse()
  {
    ImmutableSetMultimap localImmutableSetMultimap = this.inverse;
    if (localImmutableSetMultimap == null)
    {
      localImmutableSetMultimap = invert();
      this.inverse = localImmutableSetMultimap;
    }
    return localImmutableSetMultimap;
  }

  @Deprecated
  public ImmutableSet<V> removeAll(Object paramObject)
  {
    throw new UnsupportedOperationException();
  }

  @Deprecated
  public ImmutableSet<V> replaceValues(K paramK, Iterable<? extends V> paramIterable)
  {
    throw new UnsupportedOperationException();
  }

  @Nullable
  Comparator<? super V> valueComparator()
  {
    if ((this.emptySet instanceof ImmutableSortedSet))
      return ((ImmutableSortedSet)this.emptySet).comparator();
    return null;
  }

  public static final class Builder<K, V> extends ImmutableMultimap.Builder<K, V>
  {
    public Builder()
    {
      this.builderMultimap = new ImmutableSetMultimap.BuilderMultimap();
    }

    public ImmutableSetMultimap<K, V> build()
    {
      if (this.keyComparator != null)
      {
        ImmutableSetMultimap.BuilderMultimap localBuilderMultimap = new ImmutableSetMultimap.BuilderMultimap();
        ArrayList localArrayList = Lists.newArrayList(this.builderMultimap.asMap().entrySet());
        Collections.sort(localArrayList, Ordering.from(this.keyComparator).onKeys());
        Iterator localIterator = localArrayList.iterator();
        while (localIterator.hasNext())
        {
          Map.Entry localEntry = (Map.Entry)localIterator.next();
          localBuilderMultimap.putAll(localEntry.getKey(), (Iterable)localEntry.getValue());
        }
        this.builderMultimap = localBuilderMultimap;
      }
      return ImmutableSetMultimap.copyOf(this.builderMultimap, this.valueComparator);
    }

    public Builder<K, V> orderKeysBy(Comparator<? super K> paramComparator)
    {
      this.keyComparator = ((Comparator)Preconditions.checkNotNull(paramComparator));
      return this;
    }

    public Builder<K, V> orderValuesBy(Comparator<? super V> paramComparator)
    {
      super.orderValuesBy(paramComparator);
      return this;
    }

    public Builder<K, V> put(K paramK, V paramV)
    {
      this.builderMultimap.put(Preconditions.checkNotNull(paramK), Preconditions.checkNotNull(paramV));
      return this;
    }

    public Builder<K, V> put(Map.Entry<? extends K, ? extends V> paramEntry)
    {
      this.builderMultimap.put(Preconditions.checkNotNull(paramEntry.getKey()), Preconditions.checkNotNull(paramEntry.getValue()));
      return this;
    }

    public Builder<K, V> putAll(Multimap<? extends K, ? extends V> paramMultimap)
    {
      Iterator localIterator = paramMultimap.asMap().entrySet().iterator();
      while (localIterator.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        putAll(localEntry.getKey(), (Iterable)localEntry.getValue());
      }
      return this;
    }

    public Builder<K, V> putAll(K paramK, Iterable<? extends V> paramIterable)
    {
      Collection localCollection = this.builderMultimap.get(Preconditions.checkNotNull(paramK));
      Iterator localIterator = paramIterable.iterator();
      while (localIterator.hasNext())
        localCollection.add(Preconditions.checkNotNull(localIterator.next()));
      return this;
    }

    public Builder<K, V> putAll(K paramK, V[] paramArrayOfV)
    {
      return putAll(paramK, Arrays.asList(paramArrayOfV));
    }
  }

  private static class BuilderMultimap<K, V> extends AbstractMapBasedMultimap<K, V>
  {
    private static final long serialVersionUID;

    BuilderMultimap()
    {
      super();
    }

    Collection<V> createCollection()
    {
      return Sets.newLinkedHashSet();
    }
  }

  private static final class EntrySet<K, V> extends ImmutableSet<Map.Entry<K, V>>
  {
    private final transient ImmutableSetMultimap<K, V> multimap;

    EntrySet(ImmutableSetMultimap<K, V> paramImmutableSetMultimap)
    {
      this.multimap = paramImmutableSetMultimap;
    }

    public boolean contains(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Map.Entry))
      {
        Map.Entry localEntry = (Map.Entry)paramObject;
        return this.multimap.containsEntry(localEntry.getKey(), localEntry.getValue());
      }
      return false;
    }

    boolean isPartialView()
    {
      return false;
    }

    public UnmodifiableIterator<Map.Entry<K, V>> iterator()
    {
      return this.multimap.entryIterator();
    }

    public int size()
    {
      return this.multimap.size();
    }
  }
}