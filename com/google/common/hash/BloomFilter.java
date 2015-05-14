package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Objects;
import com.google.common.base.Preconditions;
import com.google.common.base.Predicate;
import com.google.common.primitives.SignedBytes;
import com.google.common.primitives.UnsignedBytes;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Serializable;
import javax.annotation.Nullable;

@Beta
public final class BloomFilter<T>
  implements Predicate<T>, Serializable
{
  private static final BloomFilter.Strategy DEFAULT_STRATEGY = BloomFilterStrategies.MURMUR128_MITZ_64;
  private final BloomFilterStrategies.BitArray bits;
  private final Funnel<? super T> funnel;
  private final int numHashFunctions;
  private final BloomFilter.Strategy strategy;

  private BloomFilter(BloomFilterStrategies.BitArray paramBitArray, int paramInt, Funnel<? super T> paramFunnel, BloomFilter.Strategy paramStrategy)
  {
    boolean bool1;
    if (paramInt > 0)
    {
      bool1 = true;
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool1, "numHashFunctions (%s) must be > 0", arrayOfObject1);
      if (paramInt > 255)
        break label113;
    }
    label113: for (boolean bool2 = true; ; bool2 = false)
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool2, "numHashFunctions (%s) must be <= 255", arrayOfObject2);
      this.bits = ((BloomFilterStrategies.BitArray)Preconditions.checkNotNull(paramBitArray));
      this.numHashFunctions = paramInt;
      this.funnel = ((Funnel)Preconditions.checkNotNull(paramFunnel));
      this.strategy = ((BloomFilter.Strategy)Preconditions.checkNotNull(paramStrategy));
      return;
      bool1 = false;
      break;
    }
  }

  public static <T> BloomFilter<T> create(Funnel<? super T> paramFunnel, int paramInt)
  {
    return create(paramFunnel, paramInt, 0.03D);
  }

  public static <T> BloomFilter<T> create(Funnel<? super T> paramFunnel, int paramInt, double paramDouble)
  {
    return create(paramFunnel, paramInt, paramDouble, DEFAULT_STRATEGY);
  }

  @VisibleForTesting
  static <T> BloomFilter<T> create(Funnel<? super T> paramFunnel, int paramInt, double paramDouble, BloomFilter.Strategy paramStrategy)
  {
    Preconditions.checkNotNull(paramFunnel);
    boolean bool1;
    if (paramInt >= 0)
      bool1 = true;
    while (true)
    {
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool1, "Expected insertions (%s) must be >= 0", arrayOfObject1);
      boolean bool2;
      label44: boolean bool3;
      long l;
      int i;
      if (paramDouble > 0.0D)
      {
        bool2 = true;
        Object[] arrayOfObject2 = new Object[1];
        arrayOfObject2[0] = Double.valueOf(paramDouble);
        Preconditions.checkArgument(bool2, "False positive probability (%s) must be > 0.0", arrayOfObject2);
        if (paramDouble >= 1.0D)
          break label166;
        bool3 = true;
        Object[] arrayOfObject3 = new Object[1];
        arrayOfObject3[0] = Double.valueOf(paramDouble);
        Preconditions.checkArgument(bool3, "False positive probability (%s) must be < 1.0", arrayOfObject3);
        Preconditions.checkNotNull(paramStrategy);
        if (paramInt == 0)
          paramInt = 1;
        l = optimalNumOfBits(paramInt, paramDouble);
        i = optimalNumOfHashFunctions(paramInt, l);
      }
      try
      {
        BloomFilter localBloomFilter = new BloomFilter(new BloomFilterStrategies.BitArray(l), i, paramFunnel, paramStrategy);
        return localBloomFilter;
        bool1 = false;
        continue;
        bool2 = false;
        break label44;
        label166: bool3 = false;
      }
      catch (IllegalArgumentException localIllegalArgumentException)
      {
        throw new IllegalArgumentException(57 + "Could not create BloomFilter of " + l + " bits", localIllegalArgumentException);
      }
    }
  }

  @VisibleForTesting
  static long optimalNumOfBits(long paramLong, double paramDouble)
  {
    if (paramDouble == 0.0D)
      paramDouble = 4.9E-324D;
    return ()(-paramLong * Math.log(paramDouble) / (Math.log(2.0D) * Math.log(2.0D)));
  }

  @VisibleForTesting
  static int optimalNumOfHashFunctions(long paramLong1, long paramLong2)
  {
    return Math.max(1, (int)Math.round(paramLong2 / paramLong1 * Math.log(2.0D)));
  }

  public static <T> BloomFilter<T> readFrom(InputStream paramInputStream, Funnel<T> paramFunnel)
    throws IOException
  {
    Preconditions.checkNotNull(paramInputStream, "InputStream");
    Preconditions.checkNotNull(paramFunnel, "Funnel");
    int i = -1;
    int j = -1;
    int k = -1;
    try
    {
      DataInputStream localDataInputStream = new DataInputStream(paramInputStream);
      i = localDataInputStream.readByte();
      j = UnsignedBytes.toInt(localDataInputStream.readByte());
      k = localDataInputStream.readInt();
      BloomFilterStrategies localBloomFilterStrategies = BloomFilterStrategies.values()[i];
      long[] arrayOfLong = new long[k];
      for (int m = 0; m < arrayOfLong.length; m++)
        arrayOfLong[m] = localDataInputStream.readLong();
      BloomFilter localBloomFilter = new BloomFilter(new BloomFilterStrategies.BitArray(arrayOfLong), j, paramFunnel, localBloomFilterStrategies);
      return localBloomFilter;
    }
    catch (RuntimeException localRuntimeException)
    {
      String str = String.valueOf(String.valueOf("Unable to deserialize BloomFilter from InputStream. strategyOrdinal: "));
      IOException localIOException = new IOException(65 + str.length() + str + i + " numHashFunctions: " + j + " dataLength: " + k);
      localIOException.initCause(localRuntimeException);
      throw localIOException;
    }
  }

  private Object writeReplace()
  {
    return new BloomFilter.SerialForm(this);
  }

  @Deprecated
  public boolean apply(T paramT)
  {
    return mightContain(paramT);
  }

  @VisibleForTesting
  long bitSize()
  {
    return this.bits.bitSize();
  }

  public BloomFilter<T> copy()
  {
    return new BloomFilter(this.bits.copy(), this.numHashFunctions, this.funnel, this.strategy);
  }

  public boolean equals(@Nullable Object paramObject)
  {
    if (paramObject == this);
    BloomFilter localBloomFilter;
    do
    {
      return true;
      if (!(paramObject instanceof BloomFilter))
        break;
      localBloomFilter = (BloomFilter)paramObject;
    }
    while ((this.numHashFunctions == localBloomFilter.numHashFunctions) && (this.funnel.equals(localBloomFilter.funnel)) && (this.bits.equals(localBloomFilter.bits)) && (this.strategy.equals(localBloomFilter.strategy)));
    return false;
    return false;
  }

  public double expectedFpp()
  {
    return Math.pow(this.bits.bitCount() / bitSize(), this.numHashFunctions);
  }

  public int hashCode()
  {
    Object[] arrayOfObject = new Object[4];
    arrayOfObject[0] = Integer.valueOf(this.numHashFunctions);
    arrayOfObject[1] = this.funnel;
    arrayOfObject[2] = this.strategy;
    arrayOfObject[3] = this.bits;
    return Objects.hashCode(arrayOfObject);
  }

  public boolean isCompatible(BloomFilter<T> paramBloomFilter)
  {
    Preconditions.checkNotNull(paramBloomFilter);
    return (this != paramBloomFilter) && (this.numHashFunctions == paramBloomFilter.numHashFunctions) && (bitSize() == paramBloomFilter.bitSize()) && (this.strategy.equals(paramBloomFilter.strategy)) && (this.funnel.equals(paramBloomFilter.funnel));
  }

  public boolean mightContain(T paramT)
  {
    return this.strategy.mightContain(paramT, this.funnel, this.numHashFunctions, this.bits);
  }

  public boolean put(T paramT)
  {
    return this.strategy.put(paramT, this.funnel, this.numHashFunctions, this.bits);
  }

  public void putAll(BloomFilter<T> paramBloomFilter)
  {
    Preconditions.checkNotNull(paramBloomFilter);
    boolean bool1;
    boolean bool2;
    if (this != paramBloomFilter)
    {
      bool1 = true;
      Preconditions.checkArgument(bool1, "Cannot combine a BloomFilter with itself.");
      if (this.numHashFunctions != paramBloomFilter.numHashFunctions)
        break label231;
      bool2 = true;
      label33: Object[] arrayOfObject1 = new Object[2];
      arrayOfObject1[0] = Integer.valueOf(this.numHashFunctions);
      arrayOfObject1[1] = Integer.valueOf(paramBloomFilter.numHashFunctions);
      Preconditions.checkArgument(bool2, "BloomFilters must have the same number of hash functions (%s != %s)", arrayOfObject1);
      if (bitSize() != paramBloomFilter.bitSize())
        break label237;
    }
    label231: label237: for (boolean bool3 = true; ; bool3 = false)
    {
      Object[] arrayOfObject2 = new Object[2];
      arrayOfObject2[0] = Long.valueOf(bitSize());
      arrayOfObject2[1] = Long.valueOf(paramBloomFilter.bitSize());
      Preconditions.checkArgument(bool3, "BloomFilters must have the same size underlying bit arrays (%s != %s)", arrayOfObject2);
      boolean bool4 = this.strategy.equals(paramBloomFilter.strategy);
      Object[] arrayOfObject3 = new Object[2];
      arrayOfObject3[0] = this.strategy;
      arrayOfObject3[1] = paramBloomFilter.strategy;
      Preconditions.checkArgument(bool4, "BloomFilters must have equal strategies (%s != %s)", arrayOfObject3);
      boolean bool5 = this.funnel.equals(paramBloomFilter.funnel);
      Object[] arrayOfObject4 = new Object[2];
      arrayOfObject4[0] = this.funnel;
      arrayOfObject4[1] = paramBloomFilter.funnel;
      Preconditions.checkArgument(bool5, "BloomFilters must have equal funnels (%s != %s)", arrayOfObject4);
      this.bits.putAll(paramBloomFilter.bits);
      return;
      bool1 = false;
      break;
      bool2 = false;
      break label33;
    }
  }

  public void writeTo(OutputStream paramOutputStream)
    throws IOException
  {
    DataOutputStream localDataOutputStream = new DataOutputStream(paramOutputStream);
    localDataOutputStream.writeByte(SignedBytes.checkedCast(this.strategy.ordinal()));
    localDataOutputStream.writeByte(UnsignedBytes.checkedCast(this.numHashFunctions));
    localDataOutputStream.writeInt(this.bits.data.length);
    long[] arrayOfLong = this.bits.data;
    int i = arrayOfLong.length;
    for (int j = 0; j < i; j++)
      localDataOutputStream.writeLong(arrayOfLong[j]);
  }
}