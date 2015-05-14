package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import java.nio.ByteBuffer;

public class BitReaderBuffer
{
  private ByteBuffer buffer;
  int initialPos;
  int position;

  public BitReaderBuffer(ByteBuffer paramByteBuffer)
  {
    this.buffer = paramByteBuffer;
    this.initialPos = paramByteBuffer.position();
  }

  public int byteSync()
  {
    int i = 8 - this.position % 8;
    if (i == 8)
      i = 0;
    readBits(i);
    return i;
  }

  public int getPosition()
  {
    return this.position;
  }

  public int readBits(int paramInt)
  {
    int i = this.buffer.get(this.initialPos + this.position / 8);
    int j;
    int k;
    int n;
    if (i < 0)
    {
      j = i + 256;
      k = 8 - this.position % 8;
      if (paramInt > k)
        break label120;
      n = (0xFF & j << this.position % 8) >> this.position % 8 + (k - paramInt);
      this.position = (paramInt + this.position);
    }
    while (true)
    {
      this.buffer.position(this.initialPos + (int)Math.ceil(this.position / 8.0D));
      return n;
      j = i;
      break;
      label120: int m = paramInt - k;
      n = (readBits(k) << m) + readBits(m);
    }
  }

  public boolean readBool()
  {
    return readBits(1) == 1;
  }

  public int remainingBits()
  {
    return 8 * this.buffer.limit() - this.position;
  }
}