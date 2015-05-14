package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

import java.util.Collection;
import java.util.Comparator;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.TreeMap;

public class RangeStartMap<K extends Comparable, V>
  implements Map<K, V>
{
  TreeMap<K, V> base = new TreeMap(new Comparator()
  {
    public int compare(K paramAnonymousK1, K paramAnonymousK2)
    {
      return -paramAnonymousK1.compareTo(paramAnonymousK2);
    }
  });

  public RangeStartMap()
  {
  }

  public RangeStartMap(K paramK, V paramV)
  {
    put(paramK, paramV);
  }

  public void clear()
  {
    this.base.clear();
  }

  public boolean containsKey(Object paramObject)
  {
    return this.base.get(paramObject) != null;
  }

  public boolean containsValue(Object paramObject)
  {
    return false;
  }

  public Set<Map.Entry<K, V>> entrySet()
  {
    return this.base.entrySet();
  }

  public V get(Object paramObject)
  {
    if (!(paramObject instanceof Comparable));
    Comparable localComparable1;
    do
    {
      return null;
      localComparable1 = (Comparable)paramObject;
    }
    while (isEmpty());
    Iterator localIterator = this.base.keySet().iterator();
    Comparable localComparable2 = (Comparable)localIterator.next();
    while (localIterator.hasNext())
      if (localComparable1.compareTo(localComparable2) < 0)
        localComparable2 = (Comparable)localIterator.next();
      else
        return this.base.get(localComparable2);
    return this.base.get(localComparable2);
  }

  public boolean isEmpty()
  {
    return this.base.isEmpty();
  }

  public Set<K> keySet()
  {
    return this.base.keySet();
  }

  public V put(K paramK, V paramV)
  {
    return this.base.put(paramK, paramV);
  }

  public void putAll(Map<? extends K, ? extends V> paramMap)
  {
    this.base.putAll(paramMap);
  }

  public V remove(Object paramObject)
  {
    if (!(paramObject instanceof Comparable));
    Comparable localComparable1;
    do
    {
      return null;
      localComparable1 = (Comparable)paramObject;
    }
    while (isEmpty());
    Iterator localIterator = this.base.keySet().iterator();
    Comparable localComparable2 = (Comparable)localIterator.next();
    while (localIterator.hasNext())
      if (localComparable1.compareTo(localComparable2) < 0)
        localComparable2 = (Comparable)localIterator.next();
      else
        return this.base.remove(localComparable2);
    return this.base.remove(localComparable2);
  }

  public int size()
  {
    return this.base.size();
  }

  public Collection<V> values()
  {
    return this.base.values();
  }
}