package android.support.v4.util;

import java.util.LinkedHashMap;
import java.util.Map;

public class LruCache<K, V>
{
  private int createCount;
  private int evictionCount;
  private int hitCount;
  private final LinkedHashMap<K, V> map;
  private int maxSize;
  private int missCount;
  private int putCount;
  private int size;

  public LruCache(int paramInt)
  {
    if (paramInt <= 0)
      throw new IllegalArgumentException("maxSize <= 0");
    this.maxSize = paramInt;
    this.map = new LinkedHashMap(0, 0.75F, true);
  }

  private int safeSizeOf(K paramK, V paramV)
  {
    int i = sizeOf(paramK, paramV);
    if (i < 0)
      throw new IllegalStateException("Negative size: " + paramK + "=" + paramV);
    return i;
  }

  protected V create(K paramK)
  {
    return null;
  }

  public final int createCount()
  {
    try
    {
      int i = this.createCount;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected void entryRemoved(boolean paramBoolean, K paramK, V paramV1, V paramV2)
  {
  }

  public final void evictAll()
  {
    trimToSize(-1);
  }

  public final int evictionCount()
  {
    try
    {
      int i = this.evictionCount;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final V get(K paramK)
  {
    if (paramK == null)
      throw new NullPointerException("key == null");
    Object localObject3;
    try
    {
      Object localObject2 = this.map.get(paramK);
      if (localObject2 != null)
      {
        this.hitCount = (1 + this.hitCount);
        return localObject2;
      }
      this.missCount = (1 + this.missCount);
      localObject3 = create(paramK);
      if (localObject3 == null)
        return null;
    }
    finally
    {
    }
    try
    {
      this.createCount = (1 + this.createCount);
      Object localObject5 = this.map.put(paramK, localObject3);
      if (localObject5 != null)
        this.map.put(paramK, localObject5);
      while (true)
      {
        if (localObject5 == null)
          break;
        entryRemoved(false, paramK, localObject3, localObject5);
        return localObject5;
        this.size += safeSizeOf(paramK, localObject3);
      }
    }
    finally
    {
    }
    trimToSize(this.maxSize);
    return localObject3;
  }

  public final int hitCount()
  {
    try
    {
      int i = this.hitCount;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final int maxSize()
  {
    try
    {
      int i = this.maxSize;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final int missCount()
  {
    try
    {
      int i = this.missCount;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final V put(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null))
      throw new NullPointerException("key == null || value == null");
    try
    {
      this.putCount = (1 + this.putCount);
      this.size += safeSizeOf(paramK, paramV);
      Object localObject2 = this.map.put(paramK, paramV);
      if (localObject2 != null)
        this.size -= safeSizeOf(paramK, localObject2);
      if (localObject2 != null)
        entryRemoved(false, paramK, localObject2, paramV);
      trimToSize(this.maxSize);
      return localObject2;
    }
    finally
    {
    }
  }

  public final int putCount()
  {
    try
    {
      int i = this.putCount;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final V remove(K paramK)
  {
    if (paramK == null)
      throw new NullPointerException("key == null");
    try
    {
      Object localObject2 = this.map.remove(paramK);
      if (localObject2 != null)
        this.size -= safeSizeOf(paramK, localObject2);
      if (localObject2 != null)
        entryRemoved(false, paramK, localObject2, null);
      return localObject2;
    }
    finally
    {
    }
  }

  public void resize(int paramInt)
  {
    if (paramInt <= 0)
      throw new IllegalArgumentException("maxSize <= 0");
    try
    {
      this.maxSize = paramInt;
      trimToSize(paramInt);
      return;
    }
    finally
    {
    }
  }

  public final int size()
  {
    try
    {
      int i = this.size;
      return i;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  protected int sizeOf(K paramK, V paramV)
  {
    return 1;
  }

  public final Map<K, V> snapshot()
  {
    try
    {
      LinkedHashMap localLinkedHashMap = new LinkedHashMap(this.map);
      return localLinkedHashMap;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }

  public final String toString()
  {
    try
    {
      int i = this.hitCount + this.missCount;
      int j = 0;
      if (i != 0)
        j = 100 * this.hitCount / i;
      Object[] arrayOfObject = new Object[4];
      arrayOfObject[0] = Integer.valueOf(this.maxSize);
      arrayOfObject[1] = Integer.valueOf(this.hitCount);
      arrayOfObject[2] = Integer.valueOf(this.missCount);
      arrayOfObject[3] = Integer.valueOf(j);
      String str = String.format("LruCache[maxSize=%d,hits=%d,misses=%d,hitRate=%d%%]", arrayOfObject);
      return str;
    }
    finally
    {
    }
  }

  // ERROR //
  public void trimToSize(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 99\011android/support/v4/util/LruCache:size\011I
    //   6: iflt +20 -> 26
    //   9: aload_0
    //   10: getfield 38\011android/support/v4/util/LruCache:map\011Ljava/util/LinkedHashMap;
    //   13: invokevirtual 132\011java/util/LinkedHashMap:isEmpty\011()Z
    //   16: ifeq +48 -> 64
    //   19: aload_0
    //   20: getfield 99\011android/support/v4/util/LruCache:size\011I
    //   23: ifeq +41 -> 64
    //   26: new 45\011java/lang/IllegalStateException
    //   29: dup
    //   30: new 47\011java/lang/StringBuilder
    //   33: dup
    //   34: invokespecial 48\011java/lang/StringBuilder:<init>\011()V
    //   37: aload_0
    //   38: invokevirtual 136\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   41: invokevirtual 141\011java/lang/Class:getName\011()Ljava/lang/String;
    //   44: invokevirtual 54\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: ldc 143
    //   49: invokevirtual 54\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   52: invokevirtual 63\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   55: invokespecial 64\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;)V
    //   58: athrow
    //   59: astore_2
    //   60: aload_0
    //   61: monitorexit
    //   62: aload_2
    //   63: athrow
    //   64: aload_0
    //   65: getfield 99\011android/support/v4/util/LruCache:size\011I
    //   68: iload_1
    //   69: if_icmple +13 -> 82
    //   72: aload_0
    //   73: getfield 38\011android/support/v4/util/LruCache:map\011Ljava/util/LinkedHashMap;
    //   76: invokevirtual 132\011java/util/LinkedHashMap:isEmpty\011()Z
    //   79: ifeq +6 -> 85
    //   82: aload_0
    //   83: monitorexit
    //   84: return
    //   85: aload_0
    //   86: getfield 38\011android/support/v4/util/LruCache:map\011Ljava/util/LinkedHashMap;
    //   89: invokevirtual 147\011java/util/LinkedHashMap:entrySet\011()Ljava/util/Set;
    //   92: invokeinterface 153 1 0
    //   97: invokeinterface 159 1 0
    //   102: checkcast 161\011java/util/Map$Entry
    //   105: astore_3
    //   106: aload_3
    //   107: invokeinterface 164 1 0
    //   112: astore 4
    //   114: aload_3
    //   115: invokeinterface 167 1 0
    //   120: astore 5
    //   122: aload_0
    //   123: getfield 38\011android/support/v4/util/LruCache:map\011Ljava/util/LinkedHashMap;
    //   126: aload 4
    //   128: invokevirtual 108\011java/util/LinkedHashMap:remove\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   131: pop
    //   132: aload_0
    //   133: aload_0
    //   134: getfield 99\011android/support/v4/util/LruCache:size\011I
    //   137: aload_0
    //   138: aload 4
    //   140: aload 5
    //   142: invokespecial 101\011android/support/v4/util/LruCache:safeSizeOf\011(Ljava/lang/Object;Ljava/lang/Object;)I
    //   145: isub
    //   146: putfield 99\011android/support/v4/util/LruCache:size\011I
    //   149: aload_0
    //   150: iconst_1
    //   151: aload_0
    //   152: getfield 77\011android/support/v4/util/LruCache:evictionCount\011I
    //   155: iadd
    //   156: putfield 77\011android/support/v4/util/LruCache:evictionCount\011I
    //   159: aload_0
    //   160: monitorexit
    //   161: aload_0
    //   162: iconst_1
    //   163: aload 4
    //   165: aload 5
    //   167: aconst_null
    //   168: invokevirtual 97\011android/support/v4/util/LruCache:entryRemoved\011(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
    //   171: goto -171 -> 0
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01126\01159\011finally
    //   26\01159\01159\011finally
    //   60\01162\01159\011finally
    //   64\01182\01159\011finally
    //   82\01184\01159\011finally
    //   85\011161\01159\011finally
  }
}