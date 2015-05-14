package co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.write;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.h264.Debug;
import java.io.IOException;
import java.io.OutputStream;

public class BitstreamWriter
{
  private int curBit;
  private int[] curByte = new int[8];
  private final OutputStream os;

  public BitstreamWriter(OutputStream paramOutputStream)
  {
    this.os = paramOutputStream;
  }

  private void writeCurByte()
    throws IOException
  {
    int i = this.curByte[0] << 7 | this.curByte[1] << 6 | this.curByte[2] << 5 | this.curByte[3] << 4 | this.curByte[4] << 3 | this.curByte[5] << 2 | this.curByte[6] << 1 | this.curByte[7];
    this.os.write(i);
  }

  public void flush()
    throws IOException
  {
    for (int i = this.curBit; i < 8; i++)
      this.curByte[i] = 0;
    this.curBit = 0;
    writeCurByte();
  }

  public void write1Bit(int paramInt)
    throws IOException
  {
    Debug.print(paramInt);
    if (this.curBit == 8)
    {
      this.curBit = 0;
      writeCurByte();
    }
    int[] arrayOfInt = this.curByte;
    int i = this.curBit;
    this.curBit = (i + 1);
    arrayOfInt[i] = paramInt;
  }

  public void writeByte(int paramInt)
    throws IOException
  {
    this.os.write(paramInt);
  }

  public void writeNBit(long paramLong, int paramInt)
    throws IOException
  {
    for (int i = 0; i < paramInt; i++)
      write1Bit(0x1 & (int)(paramLong >> -1 + (paramInt - i)));
  }

  public void writeRemainingZero()
    throws IOException
  {
    writeNBit(0L, 8 - this.curBit);
  }
}