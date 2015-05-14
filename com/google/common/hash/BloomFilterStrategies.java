package com.google.common.hash;

import com.google.common.base.Preconditions;
import com.google.common.math.LongMath;
import com.google.common.primitives.Ints;
import com.google.common.primitives.Longs;
import java.math.RoundingMode;
import java.util.Arrays;

 enum BloomFilterStrategies
  implements BloomFilter.Strategy
{
  static
  {
    BloomFilterStrategies[] arrayOfBloomFilterStrategies = new BloomFilterStrategies[2];
    arrayOfBloomFilterStrategies[0] = MURMUR128_MITZ_32;
    arrayOfBloomFilterStrategies[1] = MURMUR128_MITZ_64;
  }

  static final class BitArray
  {
    long bitCount;
    final long[] data;

    BitArray(long paramLong)
    {
      this(new long[Ints.checkedCast(LongMath.divide(paramLong, 64L, RoundingMode.CEILING))]);
    }

    BitArray(long[] paramArrayOfLong)
    {
      if (paramArrayOfLong.length > 0);
      long l;
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "data length is zero!");
        this.data = paramArrayOfLong;
        l = 0L;
        int i = paramArrayOfLong.length;
        for (int j = 0; j < i; j++)
          l += Long.bitCount(paramArrayOfLong[j]);
      }
      this.bitCount = l;
    }

    long bitCount()
    {
      return this.bitCount;
    }

    long bitSize()
    {
      return 64L * this.data.length;
    }

    BitArray copy()
    {
      return new BitArray((long[])this.data.clone());
    }

    public boolean equals(Object paramObject)
    {
      if ((paramObject instanceof BitArray))
      {
        BitArray localBitArray = (BitArray)paramObject;
        return Arrays.equals(this.data, localBitArray.data);
      }
      return false;
    }

    boolean get(long paramLong)
    {
      return (this.data[((int)(paramLong >>> 6))] & 1L << (int)paramLong) != 0L;
    }

    public int hashCode()
    {
      return Arrays.hashCode(this.data);
    }

    void putAll(BitArray paramBitArray)
    {
      if (this.data.length == paramBitArray.data.length);
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[2];
        arrayOfObject[0] = Integer.valueOf(this.data.length);
        arrayOfObject[1] = Integer.valueOf(paramBitArray.data.length);
        Preconditions.checkArgument(bool, "BitArrays must be of equal length (%s != %s)", arrayOfObject);
        this.bitCount = 0L;
        for (int i = 0; i < this.data.length; i++)
        {
          long[] arrayOfLong = this.data;
          arrayOfLong[i] |= paramBitArray.data[i];
          this.bitCount += Long.bitCount(this.data[i]);
        }
      }
    }

    boolean set(long paramLong)
    {
      if (!get(paramLong))
      {
        long[] arrayOfLong = this.data;
        int i = (int)(paramLong >>> 6);
        arrayOfLong[i] |= 1L << (int)paramLong;
        this.bitCount = (1L + this.bitCount);
        return true;
      }
      return false;
    }
  }
}