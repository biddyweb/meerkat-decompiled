package com.google.common.hash;

import com.google.common.base.Preconditions;
import java.io.Serializable;
import java.nio.ByteBuffer;
import javax.annotation.Nullable;

final class SipHashFunction extends AbstractStreamingHashFunction
  implements Serializable
{
  private static final long serialVersionUID;
  private final int c;
  private final int d;
  private final long k0;
  private final long k1;

  SipHashFunction(int paramInt1, int paramInt2, long paramLong1, long paramLong2)
  {
    boolean bool1;
    if (paramInt1 > 0)
    {
      bool1 = true;
      Object[] arrayOfObject1 = new Object[1];
      arrayOfObject1[0] = Integer.valueOf(paramInt1);
      Preconditions.checkArgument(bool1, "The number of SipRound iterations (c=%s) during Compression must be positive.", arrayOfObject1);
      if (paramInt2 <= 0)
        break label92;
    }
    label92: for (boolean bool2 = true; ; bool2 = false)
    {
      Object[] arrayOfObject2 = new Object[1];
      arrayOfObject2[0] = Integer.valueOf(paramInt2);
      Preconditions.checkArgument(bool2, "The number of SipRound iterations (d=%s) during Finalization must be positive.", arrayOfObject2);
      this.c = paramInt1;
      this.d = paramInt2;
      this.k0 = paramLong1;
      this.k1 = paramLong2;
      return;
      bool1 = false;
      break;
    }
  }

  public int bits()
  {
    return 64;
  }

  public boolean equals(@Nullable Object paramObject)
  {
    boolean bool1 = paramObject instanceof SipHashFunction;
    boolean bool2 = false;
    if (bool1)
    {
      SipHashFunction localSipHashFunction = (SipHashFunction)paramObject;
      int i = this.c;
      int j = localSipHashFunction.c;
      bool2 = false;
      if (i == j)
      {
        int k = this.d;
        int m = localSipHashFunction.d;
        bool2 = false;
        if (k == m)
        {
          boolean bool3 = this.k0 < localSipHashFunction.k0;
          bool2 = false;
          if (!bool3)
          {
            boolean bool4 = this.k1 < localSipHashFunction.k1;
            bool2 = false;
            if (!bool4)
              bool2 = true;
          }
        }
      }
    }
    return bool2;
  }

  public int hashCode()
  {
    return (int)(getClass().hashCode() ^ this.c ^ this.d ^ this.k0 ^ this.k1);
  }

  public Hasher newHasher()
  {
    return new SipHasher(this.c, this.d, this.k0, this.k1);
  }

  public String toString()
  {
    int i = this.c;
    int j = this.d;
    long l1 = this.k0;
    long l2 = this.k1;
    return 81 + "Hashing.sipHash" + i + j + "(" + l1 + ", " + l2 + ")";
  }

  private static final class SipHasher extends AbstractStreamingHashFunction.AbstractStreamingHasher
  {
    private static final int CHUNK_SIZE = 8;
    private long b = 0L;
    private final int c;
    private final int d;
    private long finalM = 0L;
    private long v0 = 8317987319222330741L;
    private long v1 = 7237128888997146477L;
    private long v2 = 7816392313619706465L;
    private long v3 = 8387220255154660723L;

    SipHasher(int paramInt1, int paramInt2, long paramLong1, long paramLong2)
    {
      super();
      this.c = paramInt1;
      this.d = paramInt2;
      this.v0 = (paramLong1 ^ this.v0);
      this.v1 = (paramLong2 ^ this.v1);
      this.v2 = (paramLong1 ^ this.v2);
      this.v3 = (paramLong2 ^ this.v3);
    }

    private void processM(long paramLong)
    {
      this.v3 = (paramLong ^ this.v3);
      sipRound(this.c);
      this.v0 = (paramLong ^ this.v0);
    }

    private void sipRound(int paramInt)
    {
      for (int i = 0; i < paramInt; i++)
      {
        this.v0 += this.v1;
        this.v2 += this.v3;
        this.v1 = Long.rotateLeft(this.v1, 13);
        this.v3 = Long.rotateLeft(this.v3, 16);
        this.v1 ^= this.v0;
        this.v3 ^= this.v2;
        this.v0 = Long.rotateLeft(this.v0, 32);
        this.v2 += this.v1;
        this.v0 += this.v3;
        this.v1 = Long.rotateLeft(this.v1, 17);
        this.v3 = Long.rotateLeft(this.v3, 21);
        this.v1 ^= this.v2;
        this.v3 ^= this.v0;
        this.v2 = Long.rotateLeft(this.v2, 32);
      }
    }

    public HashCode makeHash()
    {
      this.finalM ^= this.b << 56;
      processM(this.finalM);
      this.v2 = (0xFF ^ this.v2);
      sipRound(this.d);
      return HashCode.fromLong(this.v0 ^ this.v1 ^ this.v2 ^ this.v3);
    }

    protected void process(ByteBuffer paramByteBuffer)
    {
      this.b = (8L + this.b);
      processM(paramByteBuffer.getLong());
    }

    protected void processRemaining(ByteBuffer paramByteBuffer)
    {
      this.b += paramByteBuffer.remaining();
      for (int i = 0; paramByteBuffer.hasRemaining(); i += 8)
        this.finalM ^= (0xFF & paramByteBuffer.get()) << i;
    }
  }
}