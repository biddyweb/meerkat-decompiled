package co.getair.meerkat.video.broadcast.mp4writer;

import android.media.MediaCodec.BufferInfo;
import java.nio.ByteBuffer;

public class MediaSample
{
  public ByteBuffer buffer;
  private byte[] data;
  public int duration = 0;
  public MediaCodec.BufferInfo info;

  public MediaSample(MediaCodec.BufferInfo paramBufferInfo)
  {
    this.info = paramBufferInfo;
  }

  public ByteBuffer getData()
  {
    return this.buffer;
  }

  public int getType()
  {
    if ((this.buffer.get(0) != 0) || (this.buffer.get(1) != 0) || (this.buffer.get(2) != 0) || (this.buffer.get(3) != 1))
      return 0;
    return 0x1F & this.buffer.get(4);
  }

  public void setBuffer(ByteBuffer paramByteBuffer)
  {
    this.buffer = paramByteBuffer;
  }
}