package com.google.common.collect;

import com.google.common.annotations.Beta;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.MoreObjects;
import com.google.common.base.Preconditions;
import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.NavigableMap;
import java.util.NoSuchElementException;
import java.util.Set;
import java.util.SortedMap;
import java.util.TreeMap;
import javax.annotation.Nullable;

@Beta
@GwtIncompatible("uses NavigableMap")
public class TreeRangeSet<C extends Comparable<?>> extends AbstractRangeSet<C>
{
  private transient Set<Range<C>> asRanges;
  private transient RangeSet<C> complement;

  @VisibleForTesting
  final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;

  private TreeRangeSet(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
  {
    this.rangesByLowerBound = paramNavigableMap;
  }

  public static <C extends Comparable<?>> TreeRangeSet<C> create()
  {
    return new TreeRangeSet(new TreeMap());
  }

  public static <C extends Comparable<?>> TreeRangeSet<C> create(RangeSet<C> paramRangeSet)
  {
    TreeRangeSet localTreeRangeSet = create();
    localTreeRangeSet.addAll(paramRangeSet);
    return localTreeRangeSet;
  }

  @Nullable
  private Range<C> rangeEnclosing(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    Map.Entry localEntry = this.rangesByLowerBound.floorEntry(paramRange.lowerBound);
    if ((localEntry != null) && (((Range)localEntry.getValue()).encloses(paramRange)))
      return (Range)localEntry.getValue();
    return null;
  }

  private void replaceRangeWithSameLowerBound(Range<C> paramRange)
  {
    if (paramRange.isEmpty())
    {
      this.rangesByLowerBound.remove(paramRange.lowerBound);
      return;
    }
    this.rangesByLowerBound.put(paramRange.lowerBound, paramRange);
  }

  public void add(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    if (paramRange.isEmpty())
      return;
    Cut localCut1 = paramRange.lowerBound;
    Cut localCut2 = paramRange.upperBound;
    Map.Entry localEntry1 = this.rangesByLowerBound.lowerEntry(localCut1);
    if (localEntry1 != null)
    {
      Range localRange2 = (Range)localEntry1.getValue();
      if (localRange2.upperBound.compareTo(localCut1) >= 0)
      {
        if (localRange2.upperBound.compareTo(localCut2) >= 0)
          localCut2 = localRange2.upperBound;
        localCut1 = localRange2.lowerBound;
      }
    }
    Map.Entry localEntry2 = this.rangesByLowerBound.floorEntry(localCut2);
    if (localEntry2 != null)
    {
      Range localRange1 = (Range)localEntry2.getValue();
      if (localRange1.upperBound.compareTo(localCut2) >= 0)
        localCut2 = localRange1.upperBound;
    }
    this.rangesByLowerBound.subMap(localCut1, localCut2).clear();
    replaceRangeWithSameLowerBound(Range.create(localCut1, localCut2));
  }

  public Set<Range<C>> asRanges()
  {
    Object localObject = this.asRanges;
    if (localObject == null)
    {
      localObject = new TreeRangeSet.AsRanges(this);
      this.asRanges = ((Set)localObject);
    }
    return localObject;
  }

  public RangeSet<C> complement()
  {
    Object localObject = this.complement;
    if (localObject == null)
    {
      localObject = new TreeRangeSet.Complement(this);
      this.complement = ((RangeSet)localObject);
    }
    return localObject;
  }

  public boolean encloses(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    Map.Entry localEntry = this.rangesByLowerBound.floorEntry(paramRange.lowerBound);
    return (localEntry != null) && (((Range)localEntry.getValue()).encloses(paramRange));
  }

  @Nullable
  public Range<C> rangeContaining(C paramC)
  {
    Preconditions.checkNotNull(paramC);
    Map.Entry localEntry = this.rangesByLowerBound.floorEntry(Cut.belowValue(paramC));
    if ((localEntry != null) && (((Range)localEntry.getValue()).contains(paramC)))
      return (Range)localEntry.getValue();
    return null;
  }

  public void remove(Range<C> paramRange)
  {
    Preconditions.checkNotNull(paramRange);
    if (paramRange.isEmpty())
      return;
    Map.Entry localEntry1 = this.rangesByLowerBound.lowerEntry(paramRange.lowerBound);
    if (localEntry1 != null)
    {
      Range localRange2 = (Range)localEntry1.getValue();
      if (localRange2.upperBound.compareTo(paramRange.lowerBound) >= 0)
      {
        if ((paramRange.hasUpperBound()) && (localRange2.upperBound.compareTo(paramRange.upperBound) >= 0))
          replaceRangeWithSameLowerBound(Range.create(paramRange.upperBound, localRange2.upperBound));
        replaceRangeWithSameLowerBound(Range.create(localRange2.lowerBound, paramRange.lowerBound));
      }
    }
    Map.Entry localEntry2 = this.rangesByLowerBound.floorEntry(paramRange.upperBound);
    if (localEntry2 != null)
    {
      Range localRange1 = (Range)localEntry2.getValue();
      if ((paramRange.hasUpperBound()) && (localRange1.upperBound.compareTo(paramRange.upperBound) >= 0))
        replaceRangeWithSameLowerBound(Range.create(paramRange.upperBound, localRange1.upperBound));
    }
    this.rangesByLowerBound.subMap(paramRange.lowerBound, paramRange.upperBound).clear();
  }

  public Range<C> span()
  {
    Map.Entry localEntry1 = this.rangesByLowerBound.firstEntry();
    Map.Entry localEntry2 = this.rangesByLowerBound.lastEntry();
    if (localEntry1 == null)
      throw new NoSuchElementException();
    return Range.create(((Range)localEntry1.getValue()).lowerBound, ((Range)localEntry2.getValue()).upperBound);
  }

  public RangeSet<C> subRangeSet(Range<C> paramRange)
  {
    if (paramRange.equals(Range.all()))
      return this;
    return new SubRangeSet(paramRange);
  }

  private static final class ComplementRangesByLowerBound<C extends Comparable<?>> extends AbstractNavigableMap<Cut<C>, Range<C>>
  {
    private final Range<Cut<C>> complementLowerBoundWindow;
    private final NavigableMap<Cut<C>, Range<C>> positiveRangesByLowerBound;
    private final NavigableMap<Cut<C>, Range<C>> positiveRangesByUpperBound;

    ComplementRangesByLowerBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
    {
      this(paramNavigableMap, Range.all());
    }

    private ComplementRangesByLowerBound(NavigableMap<Cut<C>, Range<C>> paramNavigableMap, Range<Cut<C>> paramRange)
    {
      this.positiveRangesByLowerBound = paramNavigableMap;
      this.positiveRangesByUpperBound = new TreeRangeSet.RangesByUpperBound(paramNavigableMap);
      this.complementLowerBoundWindow = paramRange;
    }

    private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
    {
      if (!this.complementLowerBoundWindow.isConnected(paramRange))
        return ImmutableSortedMap.of();
      Range localRange = paramRange.intersection(this.complementLowerBoundWindow);
      return new ComplementRangesByLowerBound(this.positiveRangesByLowerBound, localRange);
    }

    public Comparator<? super Cut<C>> comparator()
    {
      return Ordering.natural();
    }

    public boolean containsKey(Object paramObject)
    {
      return get(paramObject) != null;
    }

    Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
    {
      Cut localCut1;
      boolean bool;
      label46: PeekingIterator localPeekingIterator;
      Cut localCut2;
      if (this.complementLowerBoundWindow.hasUpperBound())
      {
        localCut1 = (Cut)this.complementLowerBoundWindow.upperEndpoint();
        if ((!this.complementLowerBoundWindow.hasUpperBound()) || (this.complementLowerBoundWindow.upperBoundType() != BoundType.CLOSED))
          break label145;
        bool = true;
        localPeekingIterator = Iterators.peekingIterator(this.positiveRangesByUpperBound.headMap(localCut1, bool).descendingMap().values().iterator());
        if (!localPeekingIterator.hasNext())
          break label179;
        if (((Range)localPeekingIterator.peek()).upperBound != Cut.aboveAll())
          break label150;
        localCut2 = ((Range)localPeekingIterator.next()).lowerBound;
      }
      while (true)
      {
        return new TreeRangeSet.ComplementRangesByLowerBound.2(this, (Cut)MoreObjects.firstNonNull(localCut2, Cut.aboveAll()), localPeekingIterator);
        localCut1 = Cut.aboveAll();
        break;
        label145: bool = false;
        break label46;
        label150: localCut2 = (Cut)this.positiveRangesByLowerBound.higherKey(((Range)localPeekingIterator.peek()).upperBound);
        continue;
        label179: if ((!this.complementLowerBoundWindow.contains(Cut.belowAll())) || (this.positiveRangesByLowerBound.containsKey(Cut.belowAll())))
          return Iterators.emptyIterator();
        localCut2 = (Cut)this.positiveRangesByLowerBound.higherKey(Cut.belowAll());
      }
    }

    Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
    {
      boolean bool;
      Collection localCollection;
      label58: PeekingIterator localPeekingIterator;
      if (this.complementLowerBoundWindow.hasLowerBound())
      {
        NavigableMap localNavigableMap = this.positiveRangesByUpperBound;
        Comparable localComparable = this.complementLowerBoundWindow.lowerEndpoint();
        if (this.complementLowerBoundWindow.lowerBoundType() == BoundType.CLOSED)
        {
          bool = true;
          localCollection = localNavigableMap.tailMap(localComparable, bool).values();
          localPeekingIterator = Iterators.peekingIterator(localCollection.iterator());
          if ((!this.complementLowerBoundWindow.contains(Cut.belowAll())) || ((localPeekingIterator.hasNext()) && (((Range)localPeekingIterator.peek()).lowerBound == Cut.belowAll())))
            break label142;
        }
      }
      for (Cut localCut = Cut.belowAll(); ; localCut = ((Range)localPeekingIterator.next()).upperBound)
      {
        return new TreeRangeSet.ComplementRangesByLowerBound.1(this, localCut, localPeekingIterator);
        bool = false;
        break;
        localCollection = this.positiveRangesByUpperBound.values();
        break label58;
        label142: if (!localPeekingIterator.hasNext())
          break label167;
      }
      label167: return Iterators.emptyIterator();
    }

    @Nullable
    public Range<C> get(Object paramObject)
    {
      if ((paramObject instanceof Cut))
        try
        {
          Cut localCut = (Cut)paramObject;
          Map.Entry localEntry = tailMap(localCut, true).firstEntry();
          if ((localEntry != null) && (((Cut)localEntry.getKey()).equals(localCut)))
          {
            Range localRange = (Range)localEntry.getValue();
            return localRange;
          }
        }
        catch (ClassCastException localClassCastException)
        {
          return null;
        }
      return null;
    }

    public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }

    public int size()
    {
      return Iterators.size(entryIterator());
    }

    public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
    {
      return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
    }

    public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
  }

  private final class SubRangeSet extends TreeRangeSet<C>
  {
    private final Range<C> restriction;

    SubRangeSet()
    {
      super(null);
      this.restriction = localRange;
    }

    public void add(Range<C> paramRange)
    {
      boolean bool = this.restriction.encloses(paramRange);
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = paramRange;
      arrayOfObject[1] = this.restriction;
      Preconditions.checkArgument(bool, "Cannot add range %s to subRangeSet(%s)", arrayOfObject);
      super.add(paramRange);
    }

    public void clear()
    {
      TreeRangeSet.this.remove(this.restriction);
    }

    public boolean contains(C paramC)
    {
      return (this.restriction.contains(paramC)) && (TreeRangeSet.this.contains(paramC));
    }

    public boolean encloses(Range<C> paramRange)
    {
      boolean bool1 = this.restriction.isEmpty();
      boolean bool2 = false;
      if (!bool1)
      {
        boolean bool3 = this.restriction.encloses(paramRange);
        bool2 = false;
        if (bool3)
        {
          Range localRange = TreeRangeSet.this.rangeEnclosing(paramRange);
          bool2 = false;
          if (localRange != null)
          {
            boolean bool4 = localRange.intersection(this.restriction).isEmpty();
            bool2 = false;
            if (!bool4)
              bool2 = true;
          }
        }
      }
      return bool2;
    }

    @Nullable
    public Range<C> rangeContaining(C paramC)
    {
      if (!this.restriction.contains(paramC));
      Range localRange;
      do
      {
        return null;
        localRange = TreeRangeSet.this.rangeContaining(paramC);
      }
      while (localRange == null);
      return localRange.intersection(this.restriction);
    }

    public void remove(Range<C> paramRange)
    {
      if (paramRange.isConnected(this.restriction))
        TreeRangeSet.this.remove(paramRange.intersection(this.restriction));
    }

    public RangeSet<C> subRangeSet(Range<C> paramRange)
    {
      if (paramRange.encloses(this.restriction))
        return this;
      if (paramRange.isConnected(this.restriction))
        return new SubRangeSet(this, this.restriction.intersection(paramRange));
      return ImmutableRangeSet.of();
    }
  }

  private static final class SubRangeSetRangesByLowerBound<C extends Comparable<?>> extends AbstractNavigableMap<Cut<C>, Range<C>>
  {
    private final Range<Cut<C>> lowerBoundWindow;
    private final NavigableMap<Cut<C>, Range<C>> rangesByLowerBound;
    private final NavigableMap<Cut<C>, Range<C>> rangesByUpperBound;
    private final Range<C> restriction;

    private SubRangeSetRangesByLowerBound(Range<Cut<C>> paramRange, Range<C> paramRange1, NavigableMap<Cut<C>, Range<C>> paramNavigableMap)
    {
      this.lowerBoundWindow = ((Range)Preconditions.checkNotNull(paramRange));
      this.restriction = ((Range)Preconditions.checkNotNull(paramRange1));
      this.rangesByLowerBound = ((NavigableMap)Preconditions.checkNotNull(paramNavigableMap));
      this.rangesByUpperBound = new TreeRangeSet.RangesByUpperBound(paramNavigableMap);
    }

    private NavigableMap<Cut<C>, Range<C>> subMap(Range<Cut<C>> paramRange)
    {
      if (!paramRange.isConnected(this.lowerBoundWindow))
        return ImmutableSortedMap.of();
      return new SubRangeSetRangesByLowerBound(this.lowerBoundWindow.intersection(paramRange), this.restriction, this.rangesByLowerBound);
    }

    public Comparator<? super Cut<C>> comparator()
    {
      return Ordering.natural();
    }

    public boolean containsKey(@Nullable Object paramObject)
    {
      return get(paramObject) != null;
    }

    Iterator<Map.Entry<Cut<C>, Range<C>>> descendingEntryIterator()
    {
      if (this.restriction.isEmpty())
        return Iterators.emptyIterator();
      Cut localCut = (Cut)Ordering.natural().min(this.lowerBoundWindow.upperBound, Cut.belowValue(this.restriction.upperBound));
      NavigableMap localNavigableMap = this.rangesByLowerBound;
      Comparable localComparable = localCut.endpoint();
      if (localCut.typeAsUpperBound() == BoundType.CLOSED);
      for (boolean bool = true; ; bool = false)
        return new TreeRangeSet.SubRangeSetRangesByLowerBound.2(this, localNavigableMap.headMap(localComparable, bool).descendingMap().values().iterator());
    }

    Iterator<Map.Entry<Cut<C>, Range<C>>> entryIterator()
    {
      if (this.restriction.isEmpty())
        return Iterators.emptyIterator();
      if (this.lowerBoundWindow.upperBound.isLessThan(this.restriction.lowerBound))
        return Iterators.emptyIterator();
      if (this.lowerBoundWindow.lowerBound.isLessThan(this.restriction.lowerBound));
      NavigableMap localNavigableMap;
      Comparable localComparable;
      boolean bool;
      for (Iterator localIterator = this.rangesByUpperBound.tailMap(this.restriction.lowerBound, false).values().iterator(); ; localIterator = localNavigableMap.tailMap(localComparable, bool).values().iterator())
      {
        return new TreeRangeSet.SubRangeSetRangesByLowerBound.1(this, localIterator, (Cut)Ordering.natural().min(this.lowerBoundWindow.upperBound, Cut.belowValue(this.restriction.upperBound)));
        localNavigableMap = this.rangesByLowerBound;
        localComparable = this.lowerBoundWindow.lowerBound.endpoint();
        BoundType localBoundType1 = this.lowerBoundWindow.lowerBoundType();
        BoundType localBoundType2 = BoundType.CLOSED;
        bool = false;
        if (localBoundType1 == localBoundType2)
          bool = true;
      }
    }

    @Nullable
    public Range<C> get(@Nullable Object paramObject)
    {
      if ((paramObject instanceof Cut))
        try
        {
          Cut localCut = (Cut)paramObject;
          if ((this.lowerBoundWindow.contains(localCut)) && (localCut.compareTo(this.restriction.lowerBound) >= 0))
          {
            if (localCut.compareTo(this.restriction.upperBound) >= 0)
              return null;
            if (localCut.equals(this.restriction.lowerBound))
            {
              Range localRange3 = (Range)Maps.valueOrNull(this.rangesByLowerBound.floorEntry(localCut));
              if ((localRange3 != null) && (localRange3.upperBound.compareTo(this.restriction.lowerBound) > 0))
                return localRange3.intersection(this.restriction);
            }
            else
            {
              Range localRange1 = (Range)this.rangesByLowerBound.get(localCut);
              if (localRange1 != null)
              {
                Range localRange2 = localRange1.intersection(this.restriction);
                return localRange2;
              }
            }
          }
        }
        catch (ClassCastException localClassCastException)
        {
        }
      return null;
    }

    public NavigableMap<Cut<C>, Range<C>> headMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.upTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }

    public int size()
    {
      return Iterators.size(entryIterator());
    }

    public NavigableMap<Cut<C>, Range<C>> subMap(Cut<C> paramCut1, boolean paramBoolean1, Cut<C> paramCut2, boolean paramBoolean2)
    {
      return subMap(Range.range(paramCut1, BoundType.forBoolean(paramBoolean1), paramCut2, BoundType.forBoolean(paramBoolean2)));
    }

    public NavigableMap<Cut<C>, Range<C>> tailMap(Cut<C> paramCut, boolean paramBoolean)
    {
      return subMap(Range.downTo(paramCut, BoundType.forBoolean(paramBoolean)));
    }
  }
}