package com.google.android.gms.internal;

import java.util.LinkedHashMap;

public class zzkv<K, V>
{
  private int size;
  private final LinkedHashMap<K, V> zzQA;
  private int zzQB;
  private int zzQC;
  private int zzQD;
  private int zzQE;
  private int zzQF;
  private int zzQG;

  public zzkv(int paramInt)
  {
    if (paramInt <= 0)
      throw new IllegalArgumentException("maxSize <= 0");
    this.zzQB = paramInt;
    this.zzQA = new LinkedHashMap(0, 0.75F, true);
  }

  private int zzc(K paramK, V paramV)
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

  protected void entryRemoved(boolean paramBoolean, K paramK, V paramV1, V paramV2)
  {
  }

  public final void evictAll()
  {
    trimToSize(-1);
  }

  public final V get(K paramK)
  {
    if (paramK == null)
      throw new NullPointerException("key == null");
    Object localObject3;
    try
    {
      Object localObject2 = this.zzQA.get(paramK);
      if (localObject2 != null)
      {
        this.zzQF = (1 + this.zzQF);
        return localObject2;
      }
      this.zzQG = (1 + this.zzQG);
      localObject3 = create(paramK);
      if (localObject3 == null)
        return null;
    }
    finally
    {
    }
    try
    {
      this.zzQD = (1 + this.zzQD);
      Object localObject5 = this.zzQA.put(paramK, localObject3);
      if (localObject5 != null)
        this.zzQA.put(paramK, localObject5);
      while (true)
      {
        if (localObject5 == null)
          break;
        entryRemoved(false, paramK, localObject3, localObject5);
        return localObject5;
        this.size += zzc(paramK, localObject3);
      }
    }
    finally
    {
    }
    trimToSize(this.zzQB);
    return localObject3;
  }

  public final V put(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null))
      throw new NullPointerException("key == null || value == null");
    try
    {
      this.zzQC = (1 + this.zzQC);
      this.size += zzc(paramK, paramV);
      Object localObject2 = this.zzQA.put(paramK, paramV);
      if (localObject2 != null)
        this.size -= zzc(paramK, localObject2);
      if (localObject2 != null)
        entryRemoved(false, paramK, localObject2, paramV);
      trimToSize(this.zzQB);
      return localObject2;
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

  public final String toString()
  {
    try
    {
      int i = this.zzQF + this.zzQG;
      int j = 0;
      if (i != 0)
        j = 100 * this.zzQF / i;
      Object[] arrayOfObject = new Object[4];
      arrayOfObject[0] = Integer.valueOf(this.zzQB);
      arrayOfObject[1] = Integer.valueOf(this.zzQF);
      arrayOfObject[2] = Integer.valueOf(this.zzQG);
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
    //   3: getfield 96\011com/google/android/gms/internal/zzkv:size\011I
    //   6: iflt +20 -> 26
    //   9: aload_0
    //   10: getfield 38\011com/google/android/gms/internal/zzkv:zzQA\011Ljava/util/LinkedHashMap;
    //   13: invokevirtual 121\011java/util/LinkedHashMap:isEmpty\011()Z
    //   16: ifeq +48 -> 64
    //   19: aload_0
    //   20: getfield 96\011com/google/android/gms/internal/zzkv:size\011I
    //   23: ifeq +41 -> 64
    //   26: new 45\011java/lang/IllegalStateException
    //   29: dup
    //   30: new 47\011java/lang/StringBuilder
    //   33: dup
    //   34: invokespecial 48\011java/lang/StringBuilder:<init>\011()V
    //   37: aload_0
    //   38: invokevirtual 125\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   41: invokevirtual 130\011java/lang/Class:getName\011()Ljava/lang/String;
    //   44: invokevirtual 54\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: ldc 132
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
    //   65: getfield 96\011com/google/android/gms/internal/zzkv:size\011I
    //   68: iload_1
    //   69: if_icmple +13 -> 82
    //   72: aload_0
    //   73: getfield 38\011com/google/android/gms/internal/zzkv:zzQA\011Ljava/util/LinkedHashMap;
    //   76: invokevirtual 121\011java/util/LinkedHashMap:isEmpty\011()Z
    //   79: ifeq +6 -> 85
    //   82: aload_0
    //   83: monitorexit
    //   84: return
    //   85: aload_0
    //   86: getfield 38\011com/google/android/gms/internal/zzkv:zzQA\011Ljava/util/LinkedHashMap;
    //   89: invokevirtual 136\011java/util/LinkedHashMap:entrySet\011()Ljava/util/Set;
    //   92: invokeinterface 142 1 0
    //   97: invokeinterface 148 1 0
    //   102: checkcast 150\011java/util/Map$Entry
    //   105: astore_3
    //   106: aload_3
    //   107: invokeinterface 153 1 0
    //   112: astore 4
    //   114: aload_3
    //   115: invokeinterface 156 1 0
    //   120: astore 5
    //   122: aload_0
    //   123: getfield 38\011com/google/android/gms/internal/zzkv:zzQA\011Ljava/util/LinkedHashMap;
    //   126: aload 4
    //   128: invokevirtual 159\011java/util/LinkedHashMap:remove\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   131: pop
    //   132: aload_0
    //   133: aload_0
    //   134: getfield 96\011com/google/android/gms/internal/zzkv:size\011I
    //   137: aload_0
    //   138: aload 4
    //   140: aload 5
    //   142: invokespecial 98\011com/google/android/gms/internal/zzkv:zzc\011(Ljava/lang/Object;Ljava/lang/Object;)I
    //   145: isub
    //   146: putfield 96\011com/google/android/gms/internal/zzkv:size\011I
    //   149: aload_0
    //   150: iconst_1
    //   151: aload_0
    //   152: getfield 161\011com/google/android/gms/internal/zzkv:zzQE\011I
    //   155: iadd
    //   156: putfield 161\011com/google/android/gms/internal/zzkv:zzQE\011I
    //   159: aload_0
    //   160: monitorexit
    //   161: aload_0
    //   162: iconst_1
    //   163: aload 4
    //   165: aload 5
    //   167: aconst_null
    //   168: invokevirtual 94\011com/google/android/gms/internal/zzkv:entryRemoved\011(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
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