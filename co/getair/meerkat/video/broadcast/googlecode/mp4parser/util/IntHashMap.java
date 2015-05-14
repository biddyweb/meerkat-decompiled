package co.getair.meerkat.video.broadcast.googlecode.mp4parser.util;

public class IntHashMap
{
  private transient int count;
  private float loadFactor;
  private transient Entry[] table;
  private int threshold;

  public IntHashMap()
  {
    this(20, 0.75F);
  }

  public IntHashMap(int paramInt)
  {
    this(paramInt, 0.75F);
  }

  public IntHashMap(int paramInt, float paramFloat)
  {
    if (paramInt < 0)
      throw new IllegalArgumentException("Illegal Capacity: " + paramInt);
    if (paramFloat <= 0.0F)
      throw new IllegalArgumentException("Illegal Load: " + paramFloat);
    if (paramInt == 0)
      paramInt = 1;
    this.loadFactor = paramFloat;
    this.table = new Entry[paramInt];
    this.threshold = ((int)(paramFloat * paramInt));
  }

  public void clear()
  {
    try
    {
      Entry[] arrayOfEntry = this.table;
      int i = arrayOfEntry.length;
      while (true)
      {
        i--;
        if (i < 0)
          break;
        arrayOfEntry[i] = null;
      }
    }
    finally
    {
    }
    this.count = 0;
  }

  public boolean contains(Object paramObject)
  {
    if (paramObject == null)
      throw new NullPointerException();
    Entry[] arrayOfEntry = this.table;
    int j;
    for (int i = arrayOfEntry.length; ; i = j)
    {
      j = i - 1;
      if (i <= 0)
        break;
      for (Entry localEntry = arrayOfEntry[j]; localEntry != null; localEntry = localEntry.next)
        if (localEntry.value.equals(paramObject))
          return true;
    }
    return false;
  }

  public boolean containsKey(int paramInt)
  {
    Entry[] arrayOfEntry = this.table;
    for (Entry localEntry = arrayOfEntry[((0x7FFFFFFF & paramInt) % arrayOfEntry.length)]; localEntry != null; localEntry = localEntry.next)
      if (localEntry.hash == paramInt)
        return true;
    return false;
  }

  public boolean containsValue(Object paramObject)
  {
    return contains(paramObject);
  }

  public Object get(int paramInt)
  {
    Entry[] arrayOfEntry = this.table;
    for (Entry localEntry = arrayOfEntry[((0x7FFFFFFF & paramInt) % arrayOfEntry.length)]; localEntry != null; localEntry = localEntry.next)
      if (localEntry.hash == paramInt)
        return localEntry.value;
    return null;
  }

  public boolean isEmpty()
  {
    return this.count == 0;
  }

  public Object put(int paramInt, Object paramObject)
  {
    Entry[] arrayOfEntry = this.table;
    int i = (paramInt & 0x7FFFFFFF) % arrayOfEntry.length;
    for (Entry localEntry = arrayOfEntry[i]; localEntry != null; localEntry = localEntry.next)
      if (localEntry.hash == paramInt)
      {
        Object localObject = localEntry.value;
        localEntry.value = paramObject;
        return localObject;
      }
    if (this.count >= this.threshold)
    {
      rehash();
      arrayOfEntry = this.table;
      i = (paramInt & 0x7FFFFFFF) % arrayOfEntry.length;
    }
    arrayOfEntry[i] = new Entry(paramInt, paramInt, paramObject, arrayOfEntry[i]);
    this.count = (1 + this.count);
    return null;
  }

  protected void rehash()
  {
    int i = this.table.length;
    Entry[] arrayOfEntry1 = this.table;
    int j = 1 + i * 2;
    Entry[] arrayOfEntry2 = new Entry[j];
    this.threshold = ((int)(j * this.loadFactor));
    this.table = arrayOfEntry2;
    int m;
    for (int k = i; ; k = m)
    {
      m = k - 1;
      if (k <= 0)
        break;
      Entry localEntry1 = arrayOfEntry1[m];
      while (localEntry1 != null)
      {
        Entry localEntry2 = localEntry1;
        localEntry1 = localEntry1.next;
        int n = (0x7FFFFFFF & localEntry2.hash) % j;
        localEntry2.next = arrayOfEntry2[n];
        arrayOfEntry2[n] = localEntry2;
      }
    }
  }

  public Object remove(int paramInt)
  {
    Entry[] arrayOfEntry = this.table;
    int i = (0x7FFFFFFF & paramInt) % arrayOfEntry.length;
    Entry localEntry1 = arrayOfEntry[i];
    Entry localEntry2 = null;
    while (localEntry1 != null)
    {
      if (localEntry1.hash == paramInt)
      {
        if (localEntry2 != null)
          localEntry2.next = localEntry1.next;
        while (true)
        {
          this.count = (-1 + this.count);
          Object localObject = localEntry1.value;
          localEntry1.value = null;
          return localObject;
          arrayOfEntry[i] = localEntry1.next;
        }
      }
      localEntry2 = localEntry1;
      localEntry1 = localEntry1.next;
    }
    return null;
  }

  public int size()
  {
    return this.count;
  }

  private static class Entry
  {
    int hash;
    int key;
    Entry next;
    Object value;

    protected Entry(int paramInt1, int paramInt2, Object paramObject, Entry paramEntry)
    {
      this.hash = paramInt1;
      this.key = paramInt2;
      this.value = paramObject;
      this.next = paramEntry;
    }
  }
}