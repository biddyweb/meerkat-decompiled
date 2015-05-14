package com.google.android.gms.internal;

import java.io.IOException;
import java.nio.BufferOverflowException;
import java.nio.ByteBuffer;
import java.nio.ReadOnlyBufferException;

public final class zzwr
{
  private final ByteBuffer zzaHA;

  private zzwr(ByteBuffer paramByteBuffer)
  {
    this.zzaHA = paramByteBuffer;
  }

  private zzwr(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    this(ByteBuffer.wrap(paramArrayOfByte, paramInt1, paramInt2));
  }

  public static int zzA(int paramInt1, int paramInt2)
  {
    return zziz(paramInt1) + zziw(paramInt2);
  }

  public static int zzB(int paramInt1, int paramInt2)
  {
    return zziz(paramInt1) + zzix(paramInt2);
  }

  public static int zzN(long paramLong)
  {
    return zzQ(paramLong);
  }

  public static int zzO(long paramLong)
  {
    return zzQ(zzS(paramLong));
  }

  public static int zzQ(long paramLong)
  {
    if ((0xFFFFFF80 & paramLong) == 0L)
      return 1;
    if ((0xFFFFC000 & paramLong) == 0L)
      return 2;
    if ((0xFFE00000 & paramLong) == 0L)
      return 3;
    if ((0xF0000000 & paramLong) == 0L)
      return 4;
    if ((0x0 & paramLong) == 0L)
      return 5;
    if ((0x0 & paramLong) == 0L)
      return 6;
    if ((0x0 & paramLong) == 0L)
      return 7;
    if ((0x0 & paramLong) == 0L)
      return 8;
    if ((0x0 & paramLong) == 0L)
      return 9;
    return 10;
  }

  public static long zzS(long paramLong)
  {
    return paramLong << 1 ^ paramLong >> 63;
  }

  private static int zza(CharSequence paramCharSequence)
  {
    int i = paramCharSequence.length();
    for (int j = 0; (j < i) && (paramCharSequence.charAt(j) < '\u0080'); j++);
    while (true)
    {
      int k;
      int m;
      if (k < i)
      {
        int n = paramCharSequence.charAt(k);
        if (n < 2048)
        {
          int i1 = m + (127 - n >>> 31);
          k++;
          m = i1;
        }
        else
        {
          m += zza(paramCharSequence, k);
        }
      }
      else
      {
        if (m < i)
          throw new IllegalArgumentException("UTF-8 length does not fit in int: " + (4294967296L + m));
        return m;
        k = j;
        m = i;
      }
    }
  }

  private static int zza(CharSequence paramCharSequence, int paramInt)
  {
    int i = paramCharSequence.length();
    int j = 0;
    int k = paramInt;
    if (k < i)
    {
      int m = paramCharSequence.charAt(k);
      if (m < 2048)
        j += (127 - m >>> 31);
      while (true)
      {
        k++;
        break;
        j += 2;
        if ((55296 <= m) && (m <= 57343))
        {
          if (Character.codePointAt(paramCharSequence, k) < 65536)
            throw new IllegalArgumentException("Unpaired surrogate at index " + k);
          k++;
        }
      }
    }
    return j;
  }

  private static int zza(CharSequence paramCharSequence, byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = paramCharSequence.length();
    int j = 0;
    int k = paramInt1 + paramInt2;
    while ((j < i) && (j + paramInt1 < k))
    {
      int i9 = paramCharSequence.charAt(j);
      if (i9 >= 128)
        break;
      paramArrayOfByte[(paramInt1 + j)] = ((byte)i9);
      j++;
    }
    if (j == i)
      return paramInt1 + i;
    int m = paramInt1 + j;
    if (j < i)
    {
      int n = paramCharSequence.charAt(j);
      int i5;
      if ((n < 128) && (m < k))
      {
        i5 = m + 1;
        paramArrayOfByte[m] = ((byte)n);
      }
      while (true)
      {
        j++;
        m = i5;
        break;
        if ((n < 2048) && (m <= k - 2))
        {
          int i8 = m + 1;
          paramArrayOfByte[m] = ((byte)(0x3C0 | n >>> 6));
          i5 = i8 + 1;
          paramArrayOfByte[i8] = ((byte)(0x80 | n & 0x3F));
        }
        else if (((n < 55296) || (57343 < n)) && (m <= k - 3))
        {
          int i6 = m + 1;
          paramArrayOfByte[m] = ((byte)(0x1E0 | n >>> 12));
          int i7 = i6 + 1;
          paramArrayOfByte[i6] = ((byte)(0x80 | 0x3F & n >>> 6));
          i5 = i7 + 1;
          paramArrayOfByte[i7] = ((byte)(0x80 | n & 0x3F));
        }
        else
        {
          if (m > k - 4)
            break label460;
          char c;
          if (j + 1 != paramCharSequence.length())
          {
            j++;
            c = paramCharSequence.charAt(j);
            if (Character.isSurrogatePair(n, c));
          }
          else
          {
            throw new IllegalArgumentException("Unpaired surrogate at index " + (j - 1));
          }
          int i1 = Character.toCodePoint(n, c);
          int i2 = m + 1;
          paramArrayOfByte[m] = ((byte)(0xF0 | i1 >>> 18));
          int i3 = i2 + 1;
          paramArrayOfByte[i2] = ((byte)(0x80 | 0x3F & i1 >>> 12));
          int i4 = i3 + 1;
          paramArrayOfByte[i3] = ((byte)(0x80 | 0x3F & i1 >>> 6));
          i5 = i4 + 1;
          paramArrayOfByte[i4] = ((byte)(0x80 | i1 & 0x3F));
        }
      }
      label460: throw new ArrayIndexOutOfBoundsException("Failed writing " + n + " at index " + m);
    }
    return m;
  }

  private static void zza(CharSequence paramCharSequence, ByteBuffer paramByteBuffer)
  {
    if (paramByteBuffer.isReadOnly())
      throw new ReadOnlyBufferException();
    if (paramByteBuffer.hasArray())
      try
      {
        paramByteBuffer.position(zza(paramCharSequence, paramByteBuffer.array(), paramByteBuffer.arrayOffset() + paramByteBuffer.position(), paramByteBuffer.remaining()) - paramByteBuffer.arrayOffset());
        return;
      }
      catch (ArrayIndexOutOfBoundsException localArrayIndexOutOfBoundsException)
      {
        BufferOverflowException localBufferOverflowException = new BufferOverflowException();
        localBufferOverflowException.initCause(localArrayIndexOutOfBoundsException);
        throw localBufferOverflowException;
      }
    zzb(paramCharSequence, paramByteBuffer);
  }

  public static int zzai(boolean paramBoolean)
  {
    return 1;
  }

  public static int zzb(int paramInt, double paramDouble)
  {
    return zziz(paramInt) + zzf(paramDouble);
  }

  public static int zzb(int paramInt, zzwy paramzzwy)
  {
    return 2 * zziz(paramInt) + zzd(paramzzwy);
  }

  public static int zzb(int paramInt, byte[] paramArrayOfByte)
  {
    return zziz(paramInt) + zzw(paramArrayOfByte);
  }

  public static zzwr zzb(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    return new zzwr(paramArrayOfByte, paramInt1, paramInt2);
  }

  private static void zzb(CharSequence paramCharSequence, ByteBuffer paramByteBuffer)
  {
    int i = paramCharSequence.length();
    int j = 0;
    if (j < i)
    {
      int k = paramCharSequence.charAt(j);
      if (k < 128)
        paramByteBuffer.put((byte)k);
      while (true)
      {
        j++;
        break;
        if (k < 2048)
        {
          paramByteBuffer.put((byte)(0x3C0 | k >>> 6));
          paramByteBuffer.put((byte)(0x80 | k & 0x3F));
        }
        else if ((k < 55296) || (57343 < k))
        {
          paramByteBuffer.put((byte)(0x1E0 | k >>> 12));
          paramByteBuffer.put((byte)(0x80 | 0x3F & k >>> 6));
          paramByteBuffer.put((byte)(0x80 | k & 0x3F));
        }
        else
        {
          char c;
          if (j + 1 != paramCharSequence.length())
          {
            j++;
            c = paramCharSequence.charAt(j);
            if (Character.isSurrogatePair(k, c));
          }
          else
          {
            throw new IllegalArgumentException("Unpaired surrogate at index " + (j - 1));
          }
          int m = Character.toCodePoint(k, c);
          paramByteBuffer.put((byte)(0xF0 | m >>> 18));
          paramByteBuffer.put((byte)(0x80 | 0x3F & m >>> 12));
          paramByteBuffer.put((byte)(0x80 | 0x3F & m >>> 6));
          paramByteBuffer.put((byte)(0x80 | m & 0x3F));
        }
      }
    }
  }

  public static int zzc(int paramInt, float paramFloat)
  {
    return zziz(paramInt) + zzg(paramFloat);
  }

  public static int zzc(int paramInt, zzwy paramzzwy)
  {
    return zziz(paramInt) + zze(paramzzwy);
  }

  public static int zzc(int paramInt, boolean paramBoolean)
  {
    return zziz(paramInt) + zzai(paramBoolean);
  }

  public static int zzd(int paramInt, long paramLong)
  {
    return zziz(paramInt) + zzN(paramLong);
  }

  public static int zzd(zzwy paramzzwy)
  {
    return paramzzwy.zzvY();
  }

  public static int zzdM(String paramString)
  {
    int i = zza(paramString);
    return i + zziB(i);
  }

  public static int zze(int paramInt, long paramLong)
  {
    return zziz(paramInt) + zzO(paramLong);
  }

  public static int zze(zzwy paramzzwy)
  {
    int i = paramzzwy.zzvY();
    return i + zziB(i);
  }

  public static int zzf(double paramDouble)
  {
    return 8;
  }

  public static int zzg(float paramFloat)
  {
    return 4;
  }

  public static int zziB(int paramInt)
  {
    if ((paramInt & 0xFFFFFF80) == 0)
      return 1;
    if ((paramInt & 0xFFFFC000) == 0)
      return 2;
    if ((0xFFE00000 & paramInt) == 0)
      return 3;
    if ((0xF0000000 & paramInt) == 0)
      return 4;
    return 5;
  }

  public static int zziD(int paramInt)
  {
    return paramInt << 1 ^ paramInt >> 31;
  }

  public static int zziw(int paramInt)
  {
    if (paramInt >= 0)
      return zziB(paramInt);
    return 10;
  }

  public static int zzix(int paramInt)
  {
    return zziB(zziD(paramInt));
  }

  public static int zziz(int paramInt)
  {
    return zziB(zzxb.zzD(paramInt, 0));
  }

  public static int zzj(int paramInt, String paramString)
  {
    return zziz(paramInt) + zzdM(paramString);
  }

  public static zzwr zzu(byte[] paramArrayOfByte)
  {
    return zzb(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public static int zzw(byte[] paramArrayOfByte)
  {
    return zziB(paramArrayOfByte.length) + paramArrayOfByte.length;
  }

  public void zzC(int paramInt1, int paramInt2)
    throws IOException
  {
    zziA(zzxb.zzD(paramInt1, paramInt2));
  }

  public void zzL(long paramLong)
    throws IOException
  {
    zzP(paramLong);
  }

  public void zzM(long paramLong)
    throws IOException
  {
    zzP(zzS(paramLong));
  }

  public void zzP(long paramLong)
    throws IOException
  {
    while (true)
    {
      if ((0xFFFFFF80 & paramLong) == 0L)
      {
        zziy((int)paramLong);
        return;
      }
      zziy(0x80 | 0x7F & (int)paramLong);
      paramLong >>>= 7;
    }
  }

  public void zzR(long paramLong)
    throws IOException
  {
    zziy(0xFF & (int)paramLong);
    zziy(0xFF & (int)(paramLong >> 8));
    zziy(0xFF & (int)(paramLong >> 16));
    zziy(0xFF & (int)(paramLong >> 24));
    zziy(0xFF & (int)(paramLong >> 32));
    zziy(0xFF & (int)(paramLong >> 40));
    zziy(0xFF & (int)(paramLong >> 48));
    zziy(0xFF & (int)(paramLong >> 56));
  }

  public void zza(int paramInt, double paramDouble)
    throws IOException
  {
    zzC(paramInt, 1);
    zze(paramDouble);
  }

  public void zza(int paramInt, zzwy paramzzwy)
    throws IOException
  {
    zzC(paramInt, 2);
    zzc(paramzzwy);
  }

  public void zza(int paramInt, byte[] paramArrayOfByte)
    throws IOException
  {
    zzC(paramInt, 2);
    zzv(paramArrayOfByte);
  }

  public void zzah(boolean paramBoolean)
    throws IOException
  {
    if (paramBoolean);
    for (int i = 1; ; i = 0)
    {
      zziy(i);
      return;
    }
  }

  public void zzb(byte paramByte)
    throws IOException
  {
    if (!this.zzaHA.hasRemaining())
      throw new zza(this.zzaHA.position(), this.zzaHA.limit());
    this.zzaHA.put(paramByte);
  }

  public void zzb(int paramInt, float paramFloat)
    throws IOException
  {
    zzC(paramInt, 5);
    zzf(paramFloat);
  }

  public void zzb(int paramInt, long paramLong)
    throws IOException
  {
    zzC(paramInt, 0);
    zzL(paramLong);
  }

  public void zzb(int paramInt, String paramString)
    throws IOException
  {
    zzC(paramInt, 2);
    zzdL(paramString);
  }

  public void zzb(int paramInt, boolean paramBoolean)
    throws IOException
  {
    zzC(paramInt, 0);
    zzah(paramBoolean);
  }

  public void zzb(zzwy paramzzwy)
    throws IOException
  {
    paramzzwy.zza(this);
  }

  public void zzc(int paramInt, long paramLong)
    throws IOException
  {
    zzC(paramInt, 0);
    zzM(paramLong);
  }

  public void zzc(zzwy paramzzwy)
    throws IOException
  {
    zziA(paramzzwy.zzvX());
    paramzzwy.zza(this);
  }

  public void zzc(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    if (this.zzaHA.remaining() >= paramInt2)
    {
      this.zzaHA.put(paramArrayOfByte, paramInt1, paramInt2);
      return;
    }
    throw new zza(this.zzaHA.position(), this.zzaHA.limit());
  }

  public void zzdL(String paramString)
    throws IOException
  {
    try
    {
      int i = zziB(paramString.length());
      if (i == zziB(3 * paramString.length()))
      {
        int j = this.zzaHA.position();
        this.zzaHA.position(j + i);
        zza(paramString, this.zzaHA);
        int k = this.zzaHA.position();
        this.zzaHA.position(j);
        zziA(k - j - i);
        this.zzaHA.position(k);
        return;
      }
      zziA(zza(paramString));
      zza(paramString, this.zzaHA);
      return;
    }
    catch (BufferOverflowException localBufferOverflowException)
    {
    }
    throw new zza(this.zzaHA.position(), this.zzaHA.limit());
  }

  public void zze(double paramDouble)
    throws IOException
  {
    zzR(Double.doubleToLongBits(paramDouble));
  }

  public void zzf(float paramFloat)
    throws IOException
  {
    zziC(Float.floatToIntBits(paramFloat));
  }

  public void zziA(int paramInt)
    throws IOException
  {
    while (true)
    {
      if ((paramInt & 0xFFFFFF80) == 0)
      {
        zziy(paramInt);
        return;
      }
      zziy(0x80 | paramInt & 0x7F);
      paramInt >>>= 7;
    }
  }

  public void zziC(int paramInt)
    throws IOException
  {
    zziy(paramInt & 0xFF);
    zziy(0xFF & paramInt >> 8);
    zziy(0xFF & paramInt >> 16);
    zziy(0xFF & paramInt >> 24);
  }

  public void zziu(int paramInt)
    throws IOException
  {
    if (paramInt >= 0)
    {
      zziA(paramInt);
      return;
    }
    zzP(paramInt);
  }

  public void zziv(int paramInt)
    throws IOException
  {
    zziA(zziD(paramInt));
  }

  public void zziy(int paramInt)
    throws IOException
  {
    zzb((byte)paramInt);
  }

  public void zzv(byte[] paramArrayOfByte)
    throws IOException
  {
    zziA(paramArrayOfByte.length);
    zzx(paramArrayOfByte);
  }

  public int zzvJ()
  {
    return this.zzaHA.remaining();
  }

  public void zzvK()
  {
    if (zzvJ() != 0)
      throw new IllegalStateException("Did not write as much data as expected.");
  }

  public void zzx(byte[] paramArrayOfByte)
    throws IOException
  {
    zzc(paramArrayOfByte, 0, paramArrayOfByte.length);
  }

  public void zzy(int paramInt1, int paramInt2)
    throws IOException
  {
    zzC(paramInt1, 0);
    zziu(paramInt2);
  }

  public void zzz(int paramInt1, int paramInt2)
    throws IOException
  {
    zzC(paramInt1, 0);
    zziv(paramInt2);
  }

  public static class zza extends IOException
  {
    zza(int paramInt1, int paramInt2)
    {
      super();
    }
  }
}