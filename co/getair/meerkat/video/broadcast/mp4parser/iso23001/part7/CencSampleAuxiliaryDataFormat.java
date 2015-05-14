package co.getair.meerkat.video.broadcast.mp4parser.iso23001.part7;

import co.getair.meerkat.video.broadcast.coremedia.iso.Hex;
import java.math.BigInteger;
import java.util.Arrays;

public class CencSampleAuxiliaryDataFormat
{
  public byte[] iv = new byte[0];
  public Pair[] pairs = null;

  public Pair createPair(int paramInt, long paramLong)
  {
    if (paramInt <= 127)
    {
      if (paramLong <= 127L)
        return new ByteBytePair(paramInt, paramLong);
      if (paramLong <= 32767L)
        return new ByteShortPair(paramInt, paramLong);
      if (paramLong <= 2147483647L)
        return new ByteIntPair(paramInt, paramLong);
      return new ByteLongPair(paramInt, paramLong);
    }
    if (paramInt <= 32767)
    {
      if (paramLong <= 127L)
        return new ShortBytePair(paramInt, paramLong);
      if (paramLong <= 32767L)
        return new ShortShortPair(paramInt, paramLong);
      if (paramLong <= 2147483647L)
        return new ShortIntPair(paramInt, paramLong);
      return new ShortLongPair(paramInt, paramLong);
    }
    if (paramLong <= 127L)
      return new IntBytePair(paramInt, paramLong);
    if (paramLong <= 32767L)
      return new IntShortPair(paramInt, paramLong);
    if (paramLong <= 2147483647L)
      return new IntIntPair(paramInt, paramLong);
    return new IntLongPair(paramInt, paramLong);
  }

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    CencSampleAuxiliaryDataFormat localCencSampleAuxiliaryDataFormat;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localCencSampleAuxiliaryDataFormat = (CencSampleAuxiliaryDataFormat)paramObject;
      if (!new BigInteger(this.iv).equals(new BigInteger(localCencSampleAuxiliaryDataFormat.iv)))
        return false;
      if (this.pairs == null)
        break;
    }
    while (Arrays.equals(this.pairs, localCencSampleAuxiliaryDataFormat.pairs));
    while (true)
    {
      return false;
      if (localCencSampleAuxiliaryDataFormat.pairs == null)
        break;
    }
  }

  public int getSize()
  {
    int i = this.iv.length;
    if ((this.pairs != null) && (this.pairs.length > 0))
      i = i + 2 + 6 * this.pairs.length;
    return i;
  }

  public int hashCode()
  {
    if (this.iv != null);
    for (int i = Arrays.hashCode(this.iv); ; i = 0)
    {
      int j = i * 31;
      Pair[] arrayOfPair = this.pairs;
      int k = 0;
      if (arrayOfPair != null)
        k = Arrays.hashCode(this.pairs);
      return j + k;
    }
  }

  public String toString()
  {
    return "Entry{iv=" + Hex.encodeHex(this.iv) + ", pairs=" + Arrays.toString(this.pairs) + '}';
  }

  private abstract class AbstractPair
    implements CencSampleAuxiliaryDataFormat.Pair
  {
    private AbstractPair()
    {
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      CencSampleAuxiliaryDataFormat.Pair localPair;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localPair = (CencSampleAuxiliaryDataFormat.Pair)paramObject;
        if (clear() != localPair.clear())
          return false;
      }
      while (encrypted() == localPair.encrypted());
      return false;
    }

    public String toString()
    {
      return "P(" + clear() + "|" + encrypted() + ")";
    }
  }

  private class ByteBytePair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private byte clear;
    private byte encrypted;

    public ByteBytePair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((byte)paramLong);
      Object localObject;
      this.encrypted = ((byte)(int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class ByteIntPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private byte clear;
    private int encrypted;

    public ByteIntPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((byte)paramLong);
      Object localObject;
      this.encrypted = ((int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class ByteLongPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private byte clear;
    private long encrypted;

    public ByteLongPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((byte)paramLong);
      Object localObject;
      this.encrypted = localObject;
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class ByteShortPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private byte clear;
    private short encrypted;

    public ByteShortPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((byte)paramLong);
      Object localObject;
      this.encrypted = ((short)(int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class IntBytePair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private int clear;
    private byte encrypted;

    public IntBytePair(int paramLong, long arg3)
    {
      super(null);
      this.clear = paramLong;
      Object localObject;
      this.encrypted = ((byte)(int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class IntIntPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private int clear;
    private int encrypted;

    public IntIntPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = paramLong;
      Object localObject;
      this.encrypted = ((int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class IntLongPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private int clear;
    private long encrypted;

    public IntLongPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = paramLong;
      Object localObject;
      this.encrypted = localObject;
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class IntShortPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private int clear;
    private short encrypted;

    public IntShortPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = paramLong;
      Object localObject;
      this.encrypted = ((short)(int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  public static abstract interface Pair
  {
    public abstract int clear();

    public abstract long encrypted();
  }

  private class ShortBytePair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private short clear;
    private byte encrypted;

    public ShortBytePair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((short)paramLong);
      Object localObject;
      this.encrypted = ((byte)(int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class ShortIntPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private short clear;
    private int encrypted;

    public ShortIntPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((short)paramLong);
      Object localObject;
      this.encrypted = ((int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class ShortLongPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private short clear;
    private long encrypted;

    public ShortLongPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((short)paramLong);
      Object localObject;
      this.encrypted = localObject;
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }

  private class ShortShortPair extends CencSampleAuxiliaryDataFormat.AbstractPair
  {
    private short clear;
    private short encrypted;

    public ShortShortPair(int paramLong, long arg3)
    {
      super(null);
      this.clear = ((short)paramLong);
      Object localObject;
      this.encrypted = ((short)(int)localObject);
    }

    public int clear()
    {
      return this.clear;
    }

    public long encrypted()
    {
      return this.encrypted;
    }
  }
}