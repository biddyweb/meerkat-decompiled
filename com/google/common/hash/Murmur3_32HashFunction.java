package com.google.common.hash;

import com.google.common.primitives.UnsignedBytes;
import java.io.Serializable;
import java.nio.ByteBuffer;
import javax.annotation.Nullable;

final class Murmur3_32HashFunction extends AbstractStreamingHashFunction
  implements Serializable
{
  private static final int C1 = -862048943;
  private static final int C2 = 461845907;
  private static final long serialVersionUID;
  private final int seed;

  Murmur3_32HashFunction(int paramInt)
  {
    this.seed = paramInt;
  }

  private static HashCode fmix(int paramInt1, int paramInt2)
  {
    int i = paramInt1 ^ paramInt2;
    int j = -2048144789 * (i ^ i >>> 16);
    int k = -1028477387 * (j ^ j >>> 13);
    return HashCode.fromInt(k ^ k >>> 16);
  }

  private static int mixH1(int paramInt1, int paramInt2)
  {
    return -430675100 + 5 * Integer.rotateLeft(paramInt1 ^ paramInt2, 13);
  }

  private static int mixK1(int paramInt)
  {
    return 461845907 * Integer.rotateLeft(paramInt * -862048943, 15);
  }

  public int bits()
  {
    return 32;
  }

  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool1 = paramObject instanceof Murmur3_32HashFunction;
    boolean bool2 = false;
    if (bool1)
    {
      Murmur3_32HashFunction localMurmur3_32HashFunction = (Murmur3_32HashFunction)paramObject;
      int i = this.seed;
      int j = localMurmur3_32HashFunction.seed;
      bool2 = false;
      if (i == j)
        bool2 = true;
    }
    return bool2;
  }

  public int hashCode()
  {
    return getClass().hashCode() ^ this.seed;
  }

  public HashCode hashInt(int paramInt)
  {
    int i = mixK1(paramInt);
    return fmix(mixH1(this.seed, i), 4);
  }

  public HashCode hashLong(long paramLong)
  {
    int i = (int)paramLong;
    int j = (int)(paramLong >>> 32);
    int k = mixK1(i);
    return fmix(mixH1(mixH1(this.seed, k), mixK1(j)), 8);
  }

  public HashCode hashUnencodedChars(CharSequence paramCharSequence)
  {
    int i = this.seed;
    for (int j = 1; j < paramCharSequence.length(); j += 2)
      i = mixH1(i, mixK1(paramCharSequence.charAt(j - 1) | paramCharSequence.charAt(j) << '\020'));
    if ((0x1 & paramCharSequence.length()) == 1)
      i ^= mixK1(paramCharSequence.charAt(-1 + paramCharSequence.length()));
    return fmix(i, 2 * paramCharSequence.length());
  }

  public Hasher newHasher()
  {
    return new Murmur3_32Hasher(this.seed);
  }

  public String toString()
  {
    int i = this.seed;
    return 31 + "Hashing.murmur3_32(" + i + ")";
  }

  private static final class Murmur3_32Hasher extends AbstractStreamingHashFunction.AbstractStreamingHasher
  {
    private static final int CHUNK_SIZE = 4;
    private int h1;
    private int length;

    Murmur3_32Hasher(int paramInt)
    {
      super();
      this.h1 = paramInt;
      this.length = 0;
    }

    public HashCode makeHash()
    {
      return Murmur3_32HashFunction.fmix(this.h1, this.length);
    }

    protected void process(ByteBuffer paramByteBuffer)
    {
      int i = Murmur3_32HashFunction.mixK1(paramByteBuffer.getInt());
      this.h1 = Murmur3_32HashFunction.mixH1(this.h1, i);
      this.length = (4 + this.length);
    }

    protected void processRemaining(ByteBuffer paramByteBuffer)
    {
      this.length += paramByteBuffer.remaining();
      int i = 0;
      for (int j = 0; paramByteBuffer.hasRemaining(); j += 8)
        i ^= UnsignedBytes.toInt(paramByteBuffer.get()) << j;
      this.h1 ^= Murmur3_32HashFunction.mixK1(i);
    }
  }
}