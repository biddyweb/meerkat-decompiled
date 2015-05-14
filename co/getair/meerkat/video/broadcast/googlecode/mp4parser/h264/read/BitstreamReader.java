package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.read;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.CharCache;
import java.io.IOException;
import java.io.InputStream;

public class BitstreamReader
{
  protected static int bitsRead;
  private int curByte;
  protected CharCache debugBits = new CharCache(50);
  private InputStream is;
  int nBit;
  private int nextByte;

  public BitstreamReader(InputStream paramInputStream)
    throws IOException
  {
    this.is = paramInputStream;
    this.curByte = paramInputStream.read();
    this.nextByte = paramInputStream.read();
  }

  private void advance()
    throws IOException
  {
    this.curByte = this.nextByte;
    this.nextByte = this.is.read();
    this.nBit = 0;
  }

  public void close()
    throws IOException
  {
  }

  public long getBitPosition()
  {
    return 8 * bitsRead + this.nBit % 8;
  }

  public int getCurBit()
  {
    return this.nBit;
  }

  public boolean isByteAligned()
  {
    return this.nBit % 8 == 0;
  }

  public boolean moreRBSPData()
    throws IOException
  {
    if (this.nBit == 8)
      advance();
    int i = 1 << -1 + (8 - this.nBit);
    if ((-1 + (i << 1) & this.curByte) == i);
    for (int j = 1; (this.curByte != -1) && ((this.nextByte != -1) || (j == 0)); j = 0)
      return true;
    return false;
  }

  public int peakNextBits(int paramInt)
    throws IOException
  {
    int i = -1;
    if (paramInt > 8)
      throw new IllegalArgumentException("N should be less then 8");
    if (this.nBit == 8)
    {
      advance();
      if (this.curByte != i);
    }
    while (true)
    {
      return i;
      int[] arrayOfInt = new int[16 - this.nBit];
      int j = this.nBit;
      int i2;
      for (int k = 0; j < 8; k = i2)
      {
        i2 = k + 1;
        arrayOfInt[k] = (0x1 & this.curByte >> 7 - j);
        j++;
      }
      int m = 0;
      while (m < 8)
      {
        int i1 = k + 1;
        arrayOfInt[k] = (0x1 & this.nextByte >> 7 - m);
        m++;
        k = i1;
      }
      i = 0;
      for (int n = 0; n < paramInt; n++)
        i = i << 1 | arrayOfInt[n];
    }
  }

  public int read1Bit()
    throws IOException
  {
    if (this.nBit == 8)
    {
      advance();
      if (this.curByte == -1)
        return -1;
    }
    int i = 0x1 & this.curByte >> 7 - this.nBit;
    this.nBit = (1 + this.nBit);
    CharCache localCharCache = this.debugBits;
    if (i == 0);
    for (char c = '0'; ; c = '1')
    {
      localCharCache.append(c);
      bitsRead = 1 + bitsRead;
      return i;
    }
  }

  public boolean readBool()
    throws IOException
  {
    return read1Bit() == 1;
  }

  public int readByte()
    throws IOException
  {
    if (this.nBit > 0)
      advance();
    int i = this.curByte;
    advance();
    return i;
  }

  public long readNBit(int paramInt)
    throws IOException
  {
    if (paramInt > 64)
      throw new IllegalArgumentException("Can not readByte more then 64 bit");
    long l = 0L;
    for (int i = 0; i < paramInt; i++)
      l = l << 1 | read1Bit();
    return l;
  }

  public long readRemainingByte()
    throws IOException
  {
    return readNBit(8 - this.nBit);
  }
}