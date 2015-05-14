package com.google.android.exoplayer.util;

public final class ParsableBitArray
{
  private int bitOffset;
  private int byteOffset;
  private byte[] data;

  public ParsableBitArray()
  {
  }

  public ParsableBitArray(byte[] paramArrayOfByte)
  {
    this.data = paramArrayOfByte;
  }

  private int getUnsignedByte(int paramInt)
  {
    return 0xFF & this.data[paramInt];
  }

  private int readExpGolombCodeNum()
  {
    for (int i = 0; !readBit(); i++);
    int j = -1 + (1 << i);
    if (i > 0);
    for (int k = readBits(i); ; k = 0)
      return k + j;
  }

  private int readUnsignedByte()
  {
    if (this.bitOffset != 0);
    for (int i = (0xFF & this.data[this.byteOffset]) << this.bitOffset | (0xFF & this.data[(1 + this.byteOffset)]) >>> 8 - this.bitOffset; ; i = this.data[this.byteOffset])
    {
      this.byteOffset = (1 + this.byteOffset);
      return i & 0xFF;
    }
  }

  public byte[] getData()
  {
    return this.data;
  }

  public int getPosition()
  {
    return 8 * this.byteOffset + this.bitOffset;
  }

  public boolean readBit()
  {
    return readBits(1) == 1;
  }

  public int readBits(int paramInt)
  {
    return (int)readBitsLong(paramInt);
  }

  public long readBitsLong(int paramInt)
  {
    long l1;
    if (paramInt == 0)
      l1 = 0L;
    do
    {
      return l1;
      for (l1 = 0L; paramInt >= 8; l1 |= readUnsignedByte() << paramInt)
        paramInt -= 8;
    }
    while (paramInt <= 0);
    int i = paramInt + this.bitOffset;
    int j = (byte)(255 >> 8 - paramInt);
    long l2;
    if (i > 8)
    {
      l2 = l1 | j & (getUnsignedByte(this.byteOffset) << i - 8 | getUnsignedByte(1 + this.byteOffset) >> 16 - i);
      this.byteOffset = (1 + this.byteOffset);
    }
    while (true)
    {
      this.bitOffset = (i % 8);
      return l2;
      l2 = l1 | j & getUnsignedByte(this.byteOffset) >> 8 - i;
      if (i == 8)
        this.byteOffset = (1 + this.byteOffset);
    }
  }

  public int readSignedExpGolombCodedInt()
  {
    int i = readExpGolombCodeNum();
    if (i % 2 == 0);
    for (int j = -1; ; j = 1)
      return j * ((i + 1) / 2);
  }

  public int readUnsignedExpGolombCodedInt()
  {
    return readExpGolombCodeNum();
  }

  public void reset(byte[] paramArrayOfByte)
  {
    this.data = paramArrayOfByte;
    this.byteOffset = 0;
    this.bitOffset = 0;
  }

  public void setPosition(int paramInt)
  {
    this.byteOffset = (paramInt / 8);
    this.bitOffset = (paramInt - 8 * this.byteOffset);
  }

  public void skipBits(int paramInt)
  {
    this.byteOffset += paramInt / 8;
    this.bitOffset += paramInt % 8;
    if (this.bitOffset > 7)
    {
      this.byteOffset = (1 + this.byteOffset);
      this.bitOffset = (-8 + this.bitOffset);
    }
  }
}