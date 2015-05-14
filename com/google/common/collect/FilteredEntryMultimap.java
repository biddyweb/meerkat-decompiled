package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.MoreObjects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.base.Predicates;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import javax.annotation.Nullable;

@GwtCompatible
class FilteredEntryMultimap<K, V> extends AbstractMultimap<K, V>
  implements FilteredMultimap<K, V>
{
  final Predicate<? super Map.Entry<K, V>> predicate;
  final Multimap<K, V> unfiltered;

  FilteredEntryMultimap(Multimap<K, V> paramMultimap, Predicate<? super Map.Entry<K, V>> paramPredicate)
  {
    this.unfiltered = ((Multimap)Preconditions.checkNotNull(paramMultimap));
    this.predicate = ((Predicate)Preconditions.checkNotNull(paramPredicate));
  }

  static <E> Collection<E> filterCollection(Collection<E> paramCollection, Predicate<? super E> paramPredicate)
  {
    if ((paramCollection instanceof Set))
      return Sets.filter((Set)paramCollection, paramPredicate);
    return Collections2.filter(paramCollection, paramPredicate);
  }

  private boolean satisfies(K paramK, V paramV)
  {
    return this.predicate.apply(Maps.immutableEntry(paramK, paramV));
  }

  public void clear()
  {
    entries().clear();
  }

  public boolean containsKey(@Nullable Object paramObject)
  {
    return asMap().get(paramObject) != null;
  }

  Map<K, Collection<V>> createAsMap()
  {
    return new AsMap();
  }

  Collection<Map.Entry<K, V>> createEntries()
  {
    return filterCollection(this.unfiltered.entries(), this.predicate);
  }

  Multiset<K> createKeys()
  {
    return new Keys();
  }

  Collection<V> createValues()
  {
    return new FilteredMultimapValues(this);
  }

  Iterator<Map.Entry<K, V>> entryIterator()
  {
    throw new AssertionError("should never be called");
  }

  public Predicate<? super Map.Entry<K, V>> entryPredicate()
  {
    return this.predicate;
  }

  public Collection<V> get(K paramK)
  {
    return filterCollection(this.unfiltered.get(paramK), new ValuePredicate(paramK));
  }

  public Set<K> keySet()
  {
    return asMap().keySet();
  }

  public Collection<V> removeAll(@Nullable Object paramObject)
  {
    return (Collection)MoreObjects.firstNonNull(asMap().remove(paramObject), unmodifiableEmptyCollection());
  }

  boolean removeEntriesIf(Predicate<? super Map.Entry<K, Collection<V>>> paramPredicate)
  {
    Iterator localIterator = this.unfiltered.asMap().entrySet().iterator();
    boolean bool = false;
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      Object localObject = localEntry.getKey();
      Collection localCollection = filterCollection((Collection)localEntry.getValue(), new ValuePredicate(localObject));
      if ((!localCollection.isEmpty()) && (paramPredicate.apply(Maps.immutableEntry(localObject, localCollection))))
      {
        if (localCollection.size() == ((Collection)localEntry.getValue()).size())
          localIterator.remove();
        while (true)
        {
          bool = true;
          break;
          localCollection.clear();
        }
      }
    }
    return bool;
  }

  public int size()
  {
    return entries().size();
  }

  public Multimap<K, V> unfiltered()
  {
    return this.unfiltered;
  }

  Collection<V> unmodifiableEmptyCollection()
  {
    if ((this.unfiltered instanceof SetMultimap))
      return Collections.emptySet();
    return Collections.emptyList();
  }

  class AsMap extends Maps.ImprovedAbstractMap<K, Collection<V>>
  {
    AsMap()
    {
    }

    public void clear()
    {
      FilteredEntryMultimap.this.clear();
    }

    public boolean containsKey(@Nullable Object paramObject)
    {
      return get(paramObject) != null;
    }

    Set<Map.Entry<K, Collection<V>>> createEntrySet()
    {
      return new Maps.EntrySet()
      {
        public Iterator<Map.Entry<K, Collection<V>>> iterator()
        {
          return new AbstractIterator()
          {
            final Iterator<Map.Entry<K, Collection<V>>> backingIterator = FilteredEntryMultimap.this.unfiltered.asMap().entrySet().iterator();

            protected Map.Entry<K, Collection<V>> computeNext()
            {
              while (this.backingIterator.hasNext())
              {
                Map.Entry localEntry = (Map.Entry)this.backingIterator.next();
                Object localObject = localEntry.getKey();
                Collection localCollection = FilteredEntryMultimap.filterCollection((Collection)localEntry.getValue(), new FilteredEntryMultimap.ValuePredicate(FilteredEntryMultimap.this, localObject));
                if (!localCollection.isEmpty())
                  return Maps.immutableEntry(localObject, localCollection);
              }
              return (Map.Entry)endOfData();
            }
          };
        }

        Map<K, Collection<V>> map()
        {
          return FilteredEntryMultimap.AsMap.this;
        }

        public boolean removeAll(Collection<?> paramAnonymousCollection)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(Predicates.in(paramAnonymousCollection));
        }

        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
        }

        public int size()
        {
          return Iterators.size(iterator());
        }
      };
    }

    Set<K> createKeySet()
    {
      return new Maps.KeySet(this)
      {
        public boolean remove(@Nullable Object paramAnonymousObject)
        {
          return FilteredEntryMultimap.AsMap.this.remove(paramAnonymousObject) != null;
        }

        public boolean removeAll(Collection<?> paramAnonymousCollection)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.in(paramAnonymousCollection)));
        }

        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(Maps.keyPredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection))));
        }
      };
    }

    Collection<Collection<V>> createValues()
    {
      return new Maps.Values(this)
      {
        public boolean remove(@Nullable Object paramAnonymousObject)
        {
          if ((paramAnonymousObject instanceof Collection))
          {
            Collection localCollection1 = (Collection)paramAnonymousObject;
            Iterator localIterator = FilteredEntryMultimap.this.unfiltered.asMap().entrySet().iterator();
            while (localIterator.hasNext())
            {
              Map.Entry localEntry = (Map.Entry)localIterator.next();
              Object localObject = localEntry.getKey();
              Collection localCollection2 = FilteredEntryMultimap.filterCollection((Collection)localEntry.getValue(), new FilteredEntryMultimap.ValuePredicate(FilteredEntryMultimap.this, localObject));
              if ((!localCollection2.isEmpty()) && (localCollection1.equals(localCollection2)))
              {
                if (localCollection2.size() == ((Collection)localEntry.getValue()).size())
                  localIterator.remove();
                while (true)
                {
                  return true;
                  localCollection2.clear();
                }
              }
            }
          }
          return false;
        }

        public boolean removeAll(Collection<?> paramAnonymousCollection)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(Maps.valuePredicateOnEntries(Predicates.in(paramAnonymousCollection)));
        }

        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(Maps.valuePredicateOnEntries(Predicates.not(Predicates.in(paramAnonymousCollection))));
        }
      };
    }

    public Collection<V> get(@Nullable Object paramObject)
    {
      Collection localCollection1 = (Collection)FilteredEntryMultimap.this.unfiltered.asMap().get(paramObject);
      if (localCollection1 == null);
      Collection localCollection2;
      do
      {
        return null;
        localCollection2 = FilteredEntryMultimap.filterCollection(localCollection1, new FilteredEntryMultimap.ValuePredicate(FilteredEntryMultimap.this, paramObject));
      }
      while (localCollection2.isEmpty());
      return localCollection2;
    }

    public Collection<V> remove(@Nullable Object paramObject)
    {
      Collection localCollection = (Collection)FilteredEntryMultimap.this.unfiltered.asMap().get(paramObject);
      if (localCollection == null);
      ArrayList localArrayList;
      do
      {
        return null;
        localArrayList = Lists.newArrayList();
        Iterator localIterator = localCollection.iterator();
        while (localIterator.hasNext())
        {
          Object localObject = localIterator.next();
          if (FilteredEntryMultimap.this.satisfies(paramObject, localObject))
          {
            localIterator.remove();
            localArrayList.add(localObject);
          }
        }
      }
      while (localArrayList.isEmpty());
      if ((FilteredEntryMultimap.this.unfiltered instanceof SetMultimap))
        return Collections.unmodifiableSet(Sets.newLinkedHashSet(localArrayList));
      return Collections.unmodifiableList(localArrayList);
    }
  }

  class Keys extends Multimaps.Keys<K, V>
  {
    Keys()
    {
      super();
    }

    public Set<Multiset.Entry<K>> entrySet()
    {
      return new Multisets.EntrySet()
      {
        private boolean removeEntriesIf(final Predicate<? super Multiset.Entry<K>> paramAnonymousPredicate)
        {
          return FilteredEntryMultimap.this.removeEntriesIf(new Predicate()
          {
            public boolean apply(Map.Entry<K, Collection<V>> paramAnonymous2Entry)
            {
              return paramAnonymousPredicate.apply(Multisets.immutableEntry(paramAnonymous2Entry.getKey(), ((Collection)paramAnonymous2Entry.getValue()).size()));
            }
          });
        }

        public Iterator<Multiset.Entry<K>> iterator()
        {
          return FilteredEntryMultimap.Keys.this.entryIterator();
        }

        Multiset<K> multiset()
        {
          return FilteredEntryMultimap.Keys.this;
        }

        public boolean removeAll(Collection<?> paramAnonymousCollection)
        {
          return removeEntriesIf(Predicates.in(paramAnonymousCollection));
        }

        public boolean retainAll(Collection<?> paramAnonymousCollection)
        {
          return removeEntriesIf(Predicates.not(Predicates.in(paramAnonymousCollection)));
        }

        public int size()
        {
          return FilteredEntryMultimap.this.keySet().size();
        }
      };
    }

    public int remove(@Nullable Object paramObject, int paramInt)
    {
      CollectPreconditions.checkNonnegative(paramInt, "occurrences");
      int i;
      if (paramInt == 0)
        i = count(paramObject);
      while (true)
      {
        return i;
        Collection localCollection = (Collection)FilteredEntryMultimap.this.unfiltered.asMap().get(paramObject);
        if (localCollection == null)
          return 0;
        i = 0;
        Iterator localIterator = localCollection.iterator();
        while (localIterator.hasNext())
        {
          Object localObject = localIterator.next();
          if (FilteredEntryMultimap.this.satisfies(paramObject, localObject))
          {
            i++;
            if (i <= paramInt)
              localIterator.remove();
          }
        }
      }
    }
  }

  final class ValuePredicate
    implements Predicate<V>
  {
    private final K key;

    ValuePredicate()
    {
      Object localObject;
      this.key = localObject;
    }

    public boolean apply(@Nullable V paramV)
    {
      return FilteredEntryMultimap.this.satisfies(this.key, paramV);
    }
  }
}