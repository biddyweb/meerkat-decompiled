package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.primitives.Ints;
import com.google.common.primitives.UnsignedInts;
import java.io.Serializable;
import java.security.MessageDigest;
import javax.annotation.Nullable;

@Beta
public abstract class HashCode
{
  private static final char[] hexDigits = "0123456789abcdef".toCharArray();

  private static int decode(char paramChar)
  {
    if ((paramChar >= '0') && (paramChar <= '9'))
      return paramChar - '0';
    if ((paramChar >= 'a') && (paramChar <= 'f'))
      return 10 + (paramChar - 'a');
    throw new IllegalArgumentException(32 + "Illegal hexadecimal character: " + paramChar);
  }

  public static HashCode fromBytes(byte[] paramArrayOfByte)
  {
    int i = 1;
    if (paramArrayOfByte.length >= i);
    while (true)
    {
      Preconditions.checkArgument(i, "A HashCode must contain at least 1 byte.");
      return fromBytesNoCopy((byte[])paramArrayOfByte.clone());
      int j = 0;
    }
  }

  static HashCode fromBytesNoCopy(byte[] paramArrayOfByte)
  {
    return new BytesHashCode(paramArrayOfByte);
  }

  public static HashCode fromInt(int paramInt)
  {
    return new IntHashCode(paramInt);
  }

  public static HashCode fromLong(long paramLong)
  {
    return new LongHashCode(paramLong);
  }

  public static HashCode fromString(String paramString)
  {
    boolean bool1;
    if (paramString.length() >= 2)
    {
      bool1 = true;
      Preconditions.checkArgument(bool1, "input string (%s) must have at least 2 characters", new Object[] { paramString });
      if (paramString.length() % 2 != 0)
        break label119;
    }
    byte[] arrayOfByte;
    label119: for (boolean bool2 = true; ; bool2 = false)
    {
      Preconditions.checkArgument(bool2, "input string (%s) must have an even number of characters", new Object[] { paramString });
      arrayOfByte = new byte[paramString.length() / 2];
      for (int i = 0; i < paramString.length(); i += 2)
      {
        int j = decode(paramString.charAt(i)) << 4;
        int k = decode(paramString.charAt(i + 1));
        arrayOfByte[(i / 2)] = ((byte)(j + k));
      }
      bool1 = false;
      break;
    }
    return fromBytesNoCopy(arrayOfByte);
  }

  public abstract byte[] asBytes();

  public abstract int asInt();

  public abstract long asLong();

  public abstract int bits();

  public final boolean equals(@Nullable Object paramObject)
  {
    boolean bool1 = paramObject instanceof HashCode;
    boolean bool2 = false;
    if (bool1)
    {
      HashCode localHashCode = (HashCode)paramObject;
      int i = bits();
      int j = localHashCode.bits();
      bool2 = false;
      if (i == j)
      {
        boolean bool3 = equalsSameBits(localHashCode);
        bool2 = false;
        if (bool3)
          bool2 = true;
      }
    }
    return bool2;
  }

  abstract boolean equalsSameBits(HashCode paramHashCode);

  byte[] getBytesInternal()
  {
    return asBytes();
  }

  public final int hashCode()
  {
    int i;
    if (bits() >= 32)
      i = asInt();
    while (true)
    {
      return i;
      byte[] arrayOfByte = asBytes();
      i = 0xFF & arrayOfByte[0];
      for (int j = 1; j < arrayOfByte.length; j++)
        i |= (0xFF & arrayOfByte[j]) << j * 8;
    }
  }

  public abstract long padToLong();

  public final String toString()
  {
    byte[] arrayOfByte = asBytes();
    StringBuilder localStringBuilder = new StringBuilder(2 * arrayOfByte.length);
    int i = arrayOfByte.length;
    for (int j = 0; j < i; j++)
    {
      int k = arrayOfByte[j];
      localStringBuilder.append(hexDigits[(0xF & k >> 4)]).append(hexDigits[(k & 0xF)]);
    }
    return localStringBuilder.toString();
  }

  public int writeBytesTo(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int[] arrayOfInt = new int[2];
    arrayOfInt[0] = paramInt2;
    arrayOfInt[1] = (bits() / 8);
    int i = Ints.min(arrayOfInt);
    Preconditions.checkPositionIndexes(paramInt1, paramInt1 + i, paramArrayOfByte.length);
    writeBytesToImpl(paramArrayOfByte, paramInt1, i);
    return i;
  }

  abstract void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2);

  private static final class BytesHashCode extends HashCode
    implements Serializable
  {
    private static final long serialVersionUID;
    final byte[] bytes;

    BytesHashCode(byte[] paramArrayOfByte)
    {
      this.bytes = ((byte[])Preconditions.checkNotNull(paramArrayOfByte));
    }

    public byte[] asBytes()
    {
      return (byte[])this.bytes.clone();
    }

    public int asInt()
    {
      if (this.bytes.length >= 4);
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(this.bytes.length);
        Preconditions.checkState(bool, "HashCode#asInt() requires >= 4 bytes (it only has %s bytes).", arrayOfObject);
        return 0xFF & this.bytes[0] | (0xFF & this.bytes[1]) << 8 | (0xFF & this.bytes[2]) << 16 | (0xFF & this.bytes[3]) << 24;
      }
    }

    public long asLong()
    {
      if (this.bytes.length >= 8);
      for (boolean bool = true; ; bool = false)
      {
        Object[] arrayOfObject = new Object[1];
        arrayOfObject[0] = Integer.valueOf(this.bytes.length);
        Preconditions.checkState(bool, "HashCode#asLong() requires >= 8 bytes (it only has %s bytes).", arrayOfObject);
        return padToLong();
      }
    }

    public int bits()
    {
      return 8 * this.bytes.length;
    }

    boolean equalsSameBits(HashCode paramHashCode)
    {
      return MessageDigest.isEqual(this.bytes, paramHashCode.getBytesInternal());
    }

    byte[] getBytesInternal()
    {
      return this.bytes;
    }

    public long padToLong()
    {
      long l = 0xFF & this.bytes[0];
      for (int i = 1; i < Math.min(this.bytes.length, 8); i++)
        l |= (0xFF & this.bytes[i]) << i * 8;
      return l;
    }

    void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      System.arraycopy(this.bytes, 0, paramArrayOfByte, paramInt1, paramInt2);
    }
  }

  private static final class IntHashCode extends HashCode
    implements Serializable
  {
    private static final long serialVersionUID;
    final int hash;

    IntHashCode(int paramInt)
    {
      this.hash = paramInt;
    }

    public byte[] asBytes()
    {
      byte[] arrayOfByte = new byte[4];
      arrayOfByte[0] = ((byte)this.hash);
      arrayOfByte[1] = ((byte)(this.hash >> 8));
      arrayOfByte[2] = ((byte)(this.hash >> 16));
      arrayOfByte[3] = ((byte)(this.hash >> 24));
      return arrayOfByte;
    }

    public int asInt()
    {
      return this.hash;
    }

    public long asLong()
    {
      throw new IllegalStateException("this HashCode only has 32 bits; cannot create a long");
    }

    public int bits()
    {
      return 32;
    }

    boolean equalsSameBits(HashCode paramHashCode)
    {
      return this.hash == paramHashCode.asInt();
    }

    public long padToLong()
    {
      return UnsignedInts.toLong(this.hash);
    }

    void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      for (int i = 0; i < paramInt2; i++)
        paramArrayOfByte[(paramInt1 + i)] = ((byte)(this.hash >> i * 8));
    }
  }

  private static final class LongHashCode extends HashCode
    implements Serializable
  {
    private static final long serialVersionUID;
    final long hash;

    LongHashCode(long paramLong)
    {
      this.hash = paramLong;
    }

    public byte[] asBytes()
    {
      byte[] arrayOfByte = new byte[8];
      arrayOfByte[0] = ((byte)(int)this.hash);
      arrayOfByte[1] = ((byte)(int)(this.hash >> 8));
      arrayOfByte[2] = ((byte)(int)(this.hash >> 16));
      arrayOfByte[3] = ((byte)(int)(this.hash >> 24));
      arrayOfByte[4] = ((byte)(int)(this.hash >> 32));
      arrayOfByte[5] = ((byte)(int)(this.hash >> 40));
      arrayOfByte[6] = ((byte)(int)(this.hash >> 48));
      arrayOfByte[7] = ((byte)(int)(this.hash >> 56));
      return arrayOfByte;
    }

    public int asInt()
    {
      return (int)this.hash;
    }

    public long asLong()
    {
      return this.hash;
    }

    public int bits()
    {
      return 64;
    }

    boolean equalsSameBits(HashCode paramHashCode)
    {
      return this.hash == paramHashCode.asLong();
    }

    public long padToLong()
    {
      return this.hash;
    }

    void writeBytesToImpl(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    {
      for (int i = 0; i < paramInt2; i++)
        paramArrayOfByte[(paramInt1 + i)] = ((byte)(int)(this.hash >> i * 8));
    }
  }
}