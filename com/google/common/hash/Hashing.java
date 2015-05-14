package com.google.common.hash;

import com.google.common.annotations.Beta;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Preconditions;
import com.google.common.base.Supplier;
import java.util.Iterator;
import java.util.zip.Adler32;
import java.util.zip.CRC32;
import java.util.zip.Checksum;
import javax.annotation.Nullable;

@Beta
public final class Hashing
{
  private static final int GOOD_FAST_HASH_SEED = (int)System.currentTimeMillis();

  public static HashFunction adler32()
  {
    return Adler32Holder.ADLER_32;
  }

  static int checkPositiveAndMakeMultipleOf32(int paramInt)
  {
    if (paramInt > 0);
    for (boolean bool = true; ; bool = false)
    {
      Preconditions.checkArgument(bool, "Number of bits must be positive");
      return 0xFFFFFFE0 & paramInt + 31;
    }
  }

  private static HashFunction checksumHashFunction(ChecksumType paramChecksumType, String paramString)
  {
    return new ChecksumHashFunction(paramChecksumType, paramChecksumType.bits, paramString);
  }

  public static HashCode combineOrdered(Iterable<HashCode> paramIterable)
  {
    Iterator localIterator1 = paramIterable.iterator();
    Preconditions.checkArgument(localIterator1.hasNext(), "Must be at least 1 hash code to combine.");
    byte[] arrayOfByte1 = new byte[((HashCode)localIterator1.next()).bits() / 8];
    Iterator localIterator2 = paramIterable.iterator();
    if (localIterator2.hasNext())
    {
      byte[] arrayOfByte2 = ((HashCode)localIterator2.next()).asBytes();
      if (arrayOfByte2.length == arrayOfByte1.length);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "All hashcodes must have the same bit length.");
        for (int i = 0; i < arrayOfByte2.length; i++)
          arrayOfByte1[i] = ((byte)(37 * arrayOfByte1[i] ^ arrayOfByte2[i]));
        break;
      }
    }
    return HashCode.fromBytesNoCopy(arrayOfByte1);
  }

  public static HashCode combineUnordered(Iterable<HashCode> paramIterable)
  {
    Iterator localIterator1 = paramIterable.iterator();
    Preconditions.checkArgument(localIterator1.hasNext(), "Must be at least 1 hash code to combine.");
    byte[] arrayOfByte1 = new byte[((HashCode)localIterator1.next()).bits() / 8];
    Iterator localIterator2 = paramIterable.iterator();
    if (localIterator2.hasNext())
    {
      byte[] arrayOfByte2 = ((HashCode)localIterator2.next()).asBytes();
      if (arrayOfByte2.length == arrayOfByte1.length);
      for (boolean bool = true; ; bool = false)
      {
        Preconditions.checkArgument(bool, "All hashcodes must have the same bit length.");
        for (int i = 0; i < arrayOfByte2.length; i++)
          arrayOfByte1[i] = ((byte)(arrayOfByte1[i] + arrayOfByte2[i]));
        break;
      }
    }
    return HashCode.fromBytesNoCopy(arrayOfByte1);
  }

  public static int consistentHash(long paramLong, int paramInt)
  {
    if (paramInt > 0);
    int i;
    for (boolean bool = true; ; bool = false)
    {
      Object[] arrayOfObject = new Object[1];
      arrayOfObject[0] = Integer.valueOf(paramInt);
      Preconditions.checkArgument(bool, "buckets must be positive: %s", arrayOfObject);
      LinearCongruentialGenerator localLinearCongruentialGenerator = new LinearCongruentialGenerator(paramLong);
      int j;
      for (i = 0; ; i = j)
      {
        j = (int)((i + 1) / localLinearCongruentialGenerator.nextDouble());
        if ((j < 0) || (j >= paramInt))
          break;
      }
    }
    return i;
  }

  public static int consistentHash(HashCode paramHashCode, int paramInt)
  {
    return consistentHash(paramHashCode.padToLong(), paramInt);
  }

  public static HashFunction crc32()
  {
    return Crc32Holder.CRC_32;
  }

  public static HashFunction crc32c()
  {
    return Crc32cHolder.CRC_32_C;
  }

  public static HashFunction goodFastHash(int paramInt)
  {
    int i = checkPositiveAndMakeMultipleOf32(paramInt);
    if (i == 32)
      return Murmur3_32Holder.GOOD_FAST_HASH_FUNCTION_32;
    if (i <= 128)
      return Murmur3_128Holder.GOOD_FAST_HASH_FUNCTION_128;
    int j = (i + 127) / 128;
    HashFunction[] arrayOfHashFunction = new HashFunction[j];
    arrayOfHashFunction[0] = Murmur3_128Holder.GOOD_FAST_HASH_FUNCTION_128;
    int k = GOOD_FAST_HASH_SEED;
    for (int m = 1; m < j; m++)
    {
      k += 1500450271;
      arrayOfHashFunction[m] = murmur3_128(k);
    }
    return new ConcatenatedHashFunction(arrayOfHashFunction);
  }

  public static HashFunction md5()
  {
    return Md5Holder.MD5;
  }

  public static HashFunction murmur3_128()
  {
    return Murmur3_128Holder.MURMUR3_128;
  }

  public static HashFunction murmur3_128(int paramInt)
  {
    return new Murmur3_128HashFunction(paramInt);
  }

  public static HashFunction murmur3_32()
  {
    return Murmur3_32Holder.MURMUR3_32;
  }

  public static HashFunction murmur3_32(int paramInt)
  {
    return new Murmur3_32HashFunction(paramInt);
  }

  public static HashFunction sha1()
  {
    return Sha1Holder.SHA_1;
  }

  public static HashFunction sha256()
  {
    return Sha256Holder.SHA_256;
  }

  public static HashFunction sha512()
  {
    return Sha512Holder.SHA_512;
  }

  public static HashFunction sipHash24()
  {
    return SipHash24Holder.SIP_HASH_24;
  }

  public static HashFunction sipHash24(long paramLong1, long paramLong2)
  {
    return new SipHashFunction(2, 4, paramLong1, paramLong2);
  }

  private static class Adler32Holder
  {
    static final HashFunction ADLER_32 = Hashing.checksumHashFunction(Hashing.ChecksumType.ADLER_32, "Hashing.adler32()");
  }

  static abstract enum ChecksumType
    implements Supplier<Checksum>
  {
    private final int bits;

    static
    {
      // Byte code:
      //   0: new 18\011com/google/common/hash/Hashing$ChecksumType$1
      //   3: dup
      //   4: ldc 19
      //   6: iconst_0
      //   7: bipush 32
      //   9: invokespecial 23\011com/google/common/hash/Hashing$ChecksumType$1:<init>\011(Ljava/lang/String;II)V
      //   12: putstatic 25\011com/google/common/hash/Hashing$ChecksumType:CRC_32\011Lcom/google/common/hash/Hashing$ChecksumType;
      //   15: new 27\011com/google/common/hash/Hashing$ChecksumType$2
      //   18: dup
      //   19: ldc 28
      //   21: iconst_1
      //   22: bipush 32
      //   24: invokespecial 29\011com/google/common/hash/Hashing$ChecksumType$2:<init>\011(Ljava/lang/String;II)V
      //   27: putstatic 31\011com/google/common/hash/Hashing$ChecksumType:ADLER_32\011Lcom/google/common/hash/Hashing$ChecksumType;
      //   30: iconst_2
      //   31: anewarray 2\011com/google/common/hash/Hashing$ChecksumType
      //   34: astore_0
      //   35: aload_0
      //   36: iconst_0
      //   37: getstatic 25\011com/google/common/hash/Hashing$ChecksumType:CRC_32\011Lcom/google/common/hash/Hashing$ChecksumType;
      //   40: aastore
      //   41: aload_0
      //   42: iconst_1
      //   43: getstatic 31\011com/google/common/hash/Hashing$ChecksumType:ADLER_32\011Lcom/google/common/hash/Hashing$ChecksumType;
      //   46: aastore
      //   47: aload_0
      //   48: putstatic 33\011com/google/common/hash/Hashing$ChecksumType:$VALUES\011[Lcom/google/common/hash/Hashing$ChecksumType;
      //   51: return
    }

    private ChecksumType(int paramInt)
    {
      this.bits = paramInt;
    }

    public abstract Checksum get();
  }

  @VisibleForTesting
  static final class ConcatenatedHashFunction extends AbstractCompositeHashFunction
  {
    private final int bits;

    ConcatenatedHashFunction(HashFunction[] paramArrayOfHashFunction)
    {
      super();
      int i = 0;
      int j = paramArrayOfHashFunction.length;
      for (int k = 0; k < j; k++)
        i += paramArrayOfHashFunction[k].bits();
      this.bits = i;
    }

    public int bits()
    {
      return this.bits;
    }

    public boolean equals(@Nullable Object paramObject)
    {
      ConcatenatedHashFunction localConcatenatedHashFunction;
      if ((paramObject instanceof ConcatenatedHashFunction))
      {
        localConcatenatedHashFunction = (ConcatenatedHashFunction)paramObject;
        if ((this.bits == localConcatenatedHashFunction.bits) && (this.functions.length == localConcatenatedHashFunction.functions.length));
      }
      else
      {
        return false;
      }
      for (int i = 0; ; i++)
      {
        if (i >= this.functions.length)
          break label73;
        if (!this.functions[i].equals(localConcatenatedHashFunction.functions[i]))
          break;
      }
      label73: return true;
    }

    public int hashCode()
    {
      int i = this.bits;
      HashFunction[] arrayOfHashFunction = this.functions;
      int j = arrayOfHashFunction.length;
      for (int k = 0; k < j; k++)
        i ^= arrayOfHashFunction[k].hashCode();
      return i;
    }

    HashCode makeHash(Hasher[] paramArrayOfHasher)
    {
      byte[] arrayOfByte = new byte[this.bits / 8];
      int i = 0;
      int j = paramArrayOfHasher.length;
      for (int k = 0; k < j; k++)
      {
        HashCode localHashCode = paramArrayOfHasher[k].hash();
        i += localHashCode.writeBytesTo(arrayOfByte, i, localHashCode.bits() / 8);
      }
      return HashCode.fromBytesNoCopy(arrayOfByte);
    }
  }

  private static class Crc32Holder
  {
    static final HashFunction CRC_32 = Hashing.checksumHashFunction(Hashing.ChecksumType.CRC_32, "Hashing.crc32()");
  }

  private static final class Crc32cHolder
  {
    static final HashFunction CRC_32_C = new Crc32cHashFunction();
  }

  private static final class LinearCongruentialGenerator
  {
    private long state;

    public LinearCongruentialGenerator(long paramLong)
    {
      this.state = paramLong;
    }

    public double nextDouble()
    {
      this.state = (1L + 2862933555777941757L * this.state);
      return (1 + (int)(this.state >>> 33)) / 2147483648.0D;
    }
  }

  private static class Md5Holder
  {
    static final HashFunction MD5 = new MessageDigestHashFunction("MD5", "Hashing.md5()");
  }

  private static class Murmur3_128Holder
  {
    static final HashFunction GOOD_FAST_HASH_FUNCTION_128 = Hashing.murmur3_128(Hashing.GOOD_FAST_HASH_SEED);
    static final HashFunction MURMUR3_128 = new Murmur3_128HashFunction(0);
  }

  private static class Murmur3_32Holder
  {
    static final HashFunction GOOD_FAST_HASH_FUNCTION_32 = Hashing.murmur3_32(Hashing.GOOD_FAST_HASH_SEED);
    static final HashFunction MURMUR3_32 = new Murmur3_32HashFunction(0);
  }

  private static class Sha1Holder
  {
    static final HashFunction SHA_1 = new MessageDigestHashFunction("SHA-1", "Hashing.sha1()");
  }

  private static class Sha256Holder
  {
    static final HashFunction SHA_256 = new MessageDigestHashFunction("SHA-256", "Hashing.sha256()");
  }

  private static class Sha512Holder
  {
    static final HashFunction SHA_512 = new MessageDigestHashFunction("SHA-512", "Hashing.sha512()");
  }

  private static class SipHash24Holder
  {
    static final HashFunction SIP_HASH_24 = new SipHashFunction(2, 4, 506097522914230528L, 1084818905618843912L);
  }
}