package com.google.android.exoplayer.util;

import java.nio.ByteBuffer;

public final class ParsableByteArray
{
  public byte[] data;
  private int limit;
  private int position;

  public ParsableByteArray()
  {
  }

  public ParsableByteArray(int paramInt)
  {
    this.data = new byte[paramInt];
    this.limit = this.data.length;
  }

  public ParsableByteArray(byte[] paramArrayOfByte, int paramInt)
  {
    this.data = paramArrayOfByte;
    this.limit = paramInt;
  }

  private static int shiftIntoInt(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    int i = 0xFF & paramArrayOfByte[paramInt1];
    for (int j = paramInt1 + 1; j < paramInt1 + paramInt2; j++)
      i = i << 8 | 0xFF & paramArrayOfByte[j];
    return i;
  }

  private static long shiftIntoLong(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    long l = 0xFF & paramArrayOfByte[paramInt1];
    for (int i = paramInt1 + 1; i < paramInt1 + paramInt2; i++)
      l = l << 8 | 0xFF & paramArrayOfByte[i];
    return l;
  }

  public int bytesLeft()
  {
    return this.limit - this.position;
  }

  public int capacity()
  {
    if (this.data == null)
      return 0;
    return this.data.length;
  }

  public int getPosition()
  {
    return this.position;
  }

  public int limit()
  {
    return this.limit;
  }

  public void readBytes(ParsableBitArray paramParsableBitArray, int paramInt)
  {
    readBytes(paramParsableBitArray.getData(), 0, paramInt);
    paramParsableBitArray.setPosition(0);
  }

  public void readBytes(ByteBuffer paramByteBuffer, int paramInt)
  {
    paramByteBuffer.put(this.data, this.position, paramInt);
    this.position = (paramInt + this.position);
  }

  public void readBytes(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    System.arraycopy(this.data, this.position, paramArrayOfByte, paramInt1, paramInt2);
    this.position = (paramInt2 + this.position);
  }

  public int readInt()
  {
    int i = shiftIntoInt(this.data, this.position, 4);
    this.position = (4 + this.position);
    return i;
  }

  public long readLong()
  {
    long l = shiftIntoLong(this.data, this.position, 8);
    this.position = (8 + this.position);
    return l;
  }

  public int readSynchSafeInt()
  {
    int i = readUnsignedByte();
    int j = readUnsignedByte();
    int k = readUnsignedByte();
    return readUnsignedByte() | (i << 21 | j << 14 | k << 7);
  }

  public int readUnsignedByte()
  {
    int i = shiftIntoInt(this.data, this.position, 1);
    this.position = (1 + this.position);
    return i;
  }

  public int readUnsignedFixedPoint1616()
  {
    int i = shiftIntoInt(this.data, this.position, 2);
    this.position = (4 + this.position);
    return i;
  }

  public long readUnsignedInt()
  {
    long l = shiftIntoLong(this.data, this.position, 4);
    this.position = (4 + this.position);
    return l;
  }

  public int readUnsignedIntToInt()
  {
    int i = shiftIntoInt(this.data, this.position, 4);
    this.position = (4 + this.position);
    if (i < 0)
      throw new IllegalArgumentException("Top bit not zero: " + i);
    return i;
  }

  public long readUnsignedLongToLong()
  {
    long l = shiftIntoLong(this.data, this.position, 8);
    this.position = (8 + this.position);
    if (l < 0L)
      throw new IllegalArgumentException("Top bit not zero: " + l);
    return l;
  }

  public int readUnsignedShort()
  {
    int i = shiftIntoInt(this.data, this.position, 2);
    this.position = (2 + this.position);
    return i;
  }

  public void reset()
  {
    this.position = 0;
    this.limit = 0;
  }

  public void reset(byte[] paramArrayOfByte, int paramInt)
  {
    this.data = paramArrayOfByte;
    this.limit = paramInt;
    this.position = 0;
  }

  public void setLimit(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt <= this.data.length));
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkArgument(bool);
      this.limit = paramInt;
      return;
    }
  }

  public void setPosition(int paramInt)
  {
    if ((paramInt >= 0) && (paramInt <= this.limit));
    for (boolean bool = true; ; bool = false)
    {
      Assertions.checkArgument(bool);
      this.position = paramInt;
      return;
    }
  }

  public void skip(int paramInt)
  {
    setPosition(paramInt + this.position);
  }
}