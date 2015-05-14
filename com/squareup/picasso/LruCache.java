package com.squareup.picasso;

import android.content.Context;
import android.graphics.Bitmap;
import java.util.LinkedHashMap;

public class LruCache
  implements Cache
{
  private int evictionCount;
  private int hitCount;
  final LinkedHashMap<String, Bitmap> map;
  private final int maxSize;
  private int missCount;
  private int putCount;
  private int size;

  public LruCache(int paramInt)
  {
    if (paramInt <= 0)
      throw new IllegalArgumentException("Max size must be positive.");
    this.maxSize = paramInt;
    this.map = new LinkedHashMap(0, 0.75F, true);
  }

  public LruCache(Context paramContext)
  {
    this(Utils.calculateMemoryCacheSize(paramContext));
  }

  // ERROR //
  private void trimToSize(int paramInt)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: getfield 50\011com/squareup/picasso/LruCache:size\011I
    //   6: iflt +20 -> 26
    //   9: aload_0
    //   10: getfield 38\011com/squareup/picasso/LruCache:map\011Ljava/util/LinkedHashMap;
    //   13: invokevirtual 54\011java/util/LinkedHashMap:isEmpty\011()Z
    //   16: ifeq +48 -> 64
    //   19: aload_0
    //   20: getfield 50\011com/squareup/picasso/LruCache:size\011I
    //   23: ifeq +41 -> 64
    //   26: new 56\011java/lang/IllegalStateException
    //   29: dup
    //   30: new 58\011java/lang/StringBuilder
    //   33: dup
    //   34: invokespecial 59\011java/lang/StringBuilder:<init>\011()V
    //   37: aload_0
    //   38: invokevirtual 63\011java/lang/Object:getClass\011()Ljava/lang/Class;
    //   41: invokevirtual 69\011java/lang/Class:getName\011()Ljava/lang/String;
    //   44: invokevirtual 73\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   47: ldc 75
    //   49: invokevirtual 73\011java/lang/StringBuilder:append\011(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   52: invokevirtual 78\011java/lang/StringBuilder:toString\011()Ljava/lang/String;
    //   55: invokespecial 79\011java/lang/IllegalStateException:<init>\011(Ljava/lang/String;)V
    //   58: athrow
    //   59: astore_2
    //   60: aload_0
    //   61: monitorexit
    //   62: aload_2
    //   63: athrow
    //   64: aload_0
    //   65: getfield 50\011com/squareup/picasso/LruCache:size\011I
    //   68: iload_1
    //   69: if_icmple +13 -> 82
    //   72: aload_0
    //   73: getfield 38\011com/squareup/picasso/LruCache:map\011Ljava/util/LinkedHashMap;
    //   76: invokevirtual 54\011java/util/LinkedHashMap:isEmpty\011()Z
    //   79: ifeq +6 -> 85
    //   82: aload_0
    //   83: monitorexit
    //   84: return
    //   85: aload_0
    //   86: getfield 38\011com/squareup/picasso/LruCache:map\011Ljava/util/LinkedHashMap;
    //   89: invokevirtual 83\011java/util/LinkedHashMap:entrySet\011()Ljava/util/Set;
    //   92: invokeinterface 89 1 0
    //   97: invokeinterface 95 1 0
    //   102: checkcast 97\011java/util/Map$Entry
    //   105: astore_3
    //   106: aload_3
    //   107: invokeinterface 100 1 0
    //   112: checkcast 102\011java/lang/String
    //   115: astore 4
    //   117: aload_3
    //   118: invokeinterface 105 1 0
    //   123: checkcast 107\011android/graphics/Bitmap
    //   126: astore 5
    //   128: aload_0
    //   129: getfield 38\011com/squareup/picasso/LruCache:map\011Ljava/util/LinkedHashMap;
    //   132: aload 4
    //   134: invokevirtual 111\011java/util/LinkedHashMap:remove\011(Ljava/lang/Object;)Ljava/lang/Object;
    //   137: pop
    //   138: aload_0
    //   139: aload_0
    //   140: getfield 50\011com/squareup/picasso/LruCache:size\011I
    //   143: aload 5
    //   145: invokestatic 115\011com/squareup/picasso/Utils:getBitmapBytes\011(Landroid/graphics/Bitmap;)I
    //   148: isub
    //   149: putfield 50\011com/squareup/picasso/LruCache:size\011I
    //   152: aload_0
    //   153: iconst_1
    //   154: aload_0
    //   155: getfield 117\011com/squareup/picasso/LruCache:evictionCount\011I
    //   158: iadd
    //   159: putfield 117\011com/squareup/picasso/LruCache:evictionCount\011I
    //   162: aload_0
    //   163: monitorexit
    //   164: goto -164 -> 0
    //
    // Exception table:
    //   from\011to\011target\011type
    //   2\01126\01159\011finally
    //   26\01159\01159\011finally
    //   60\01162\01159\011finally
    //   64\01182\01159\011finally
    //   82\01184\01159\011finally
    //   85\011164\01159\011finally
  }

  public final void clear()
  {
    try
    {
      evictAll();
      return;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
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

  public Bitmap get(String paramString)
  {
    if (paramString == null)
      throw new NullPointerException("key == null");
    try
    {
      Bitmap localBitmap = (Bitmap)this.map.get(paramString);
      if (localBitmap != null)
      {
        this.hitCount = (1 + this.hitCount);
        return localBitmap;
      }
      this.missCount = (1 + this.missCount);
      return null;
    }
    finally
    {
    }
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

  public void set(String paramString, Bitmap paramBitmap)
  {
    if ((paramString == null) || (paramBitmap == null))
      throw new NullPointerException("key == null || bitmap == null");
    try
    {
      this.putCount = (1 + this.putCount);
      this.size += Utils.getBitmapBytes(paramBitmap);
      Bitmap localBitmap = (Bitmap)this.map.put(paramString, paramBitmap);
      if (localBitmap != null)
        this.size -= Utils.getBitmapBytes(localBitmap);
      trimToSize(this.maxSize);
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
}