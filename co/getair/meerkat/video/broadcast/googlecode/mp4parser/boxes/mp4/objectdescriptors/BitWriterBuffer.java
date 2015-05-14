package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import java.nio.ByteBuffer;

public class BitWriterBuffer
{
  private ByteBuffer buffer;
  int initialPos;
  int position = 0;

  static
  {
    if (!BitWriterBuffer.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public BitWriterBuffer(ByteBuffer paramByteBuffer)
  {
    this.buffer = paramByteBuffer;
    this.initialPos = paramByteBuffer.position();
  }

  public void writeBits(int paramInt1, int paramInt2)
  {
    int i = 1;
    if ((!$assertionsDisabled) && (paramInt1 > -1 + (i << paramInt2)))
    {
      Object[] arrayOfObject = new Object[2];
      arrayOfObject[0] = Integer.valueOf(paramInt1);
      arrayOfObject[i] = Integer.valueOf(-1 + (i << paramInt2));
      throw new AssertionError(String.format("Trying to write a value bigger (%s) than the number bits (%s) allows. Please mask the value before writing it and make your code is really working as intended.", arrayOfObject));
    }
    int j = 8 - this.position % 8;
    ByteBuffer localByteBuffer1;
    int m;
    if (paramInt2 <= j)
    {
      int n = this.buffer.get(this.initialPos + this.position / 8);
      if (n < 0)
        n += 256;
      int i1 = n + (paramInt1 << j - paramInt2);
      ByteBuffer localByteBuffer2 = this.buffer;
      int i2 = this.initialPos + this.position / 8;
      if (i1 > 127)
        i1 -= 256;
      localByteBuffer2.put(i2, (byte)i1);
      this.position = (paramInt2 + this.position);
      localByteBuffer1 = this.buffer;
      m = this.initialPos + this.position / 8;
      if (this.position % 8 <= 0)
        break label247;
    }
    while (true)
    {
      localByteBuffer1.position(i + m);
      return;
      int k = paramInt2 - j;
      writeBits(paramInt1 >> k, j);
      writeBits(paramInt1 & -1 + (i << k), k);
      break;
      label247: i = 0;
    }
  }
}