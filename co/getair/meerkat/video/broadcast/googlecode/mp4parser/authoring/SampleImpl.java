package co.getair.meerkat.video.broadcast.googlecode.mp4parser.authoring;

import co.getair.meerkat.video.broadcast.coremedia.iso.boxes.Container;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.WritableByteChannel;

public class SampleImpl
  implements Sample
{
  private ByteBuffer[] data;
  private final long offset;
  private final Container parent;
  private final long size;

  public SampleImpl(long paramLong1, long paramLong2, Container paramContainer)
  {
    this.offset = paramLong1;
    this.size = paramLong2;
    this.data = null;
    this.parent = paramContainer;
  }

  public SampleImpl(long paramLong1, long paramLong2, ByteBuffer paramByteBuffer)
  {
    this.offset = paramLong1;
    this.size = paramLong2;
    this.data = new ByteBuffer[] { paramByteBuffer };
    this.parent = null;
  }

  public SampleImpl(ByteBuffer paramByteBuffer)
  {
    this.offset = -1L;
    this.size = paramByteBuffer.limit();
    this.data = new ByteBuffer[] { paramByteBuffer };
    this.parent = null;
  }

  public SampleImpl(ByteBuffer[] paramArrayOfByteBuffer)
  {
    this.offset = -1L;
    int i = 0;
    int j = paramArrayOfByteBuffer.length;
    for (int k = 0; k < j; k++)
      i += paramArrayOfByteBuffer[k].remaining();
    this.size = i;
    this.data = paramArrayOfByteBuffer;
    this.parent = null;
  }

  public ByteBuffer asByteBuffer()
  {
    ensureData();
    ByteBuffer localByteBuffer = ByteBuffer.wrap(new byte[CastUtils.l2i(this.size)]);
    ByteBuffer[] arrayOfByteBuffer = this.data;
    int i = arrayOfByteBuffer.length;
    for (int j = 0; j < i; j++)
      localByteBuffer.put(arrayOfByteBuffer[j].duplicate());
    localByteBuffer.rewind();
    return localByteBuffer;
  }

  protected void ensureData()
  {
    if (this.data != null)
      return;
    if (this.parent == null)
      throw new RuntimeException("Missing parent container, can't read sample " + this);
    try
    {
      ByteBuffer[] arrayOfByteBuffer = new ByteBuffer[1];
      arrayOfByteBuffer[0] = this.parent.getByteBuffer(this.offset, this.size);
      this.data = arrayOfByteBuffer;
      return;
    }
    catch (IOException localIOException)
    {
      throw new RuntimeException("couldn't read sample " + this, localIOException);
    }
  }

  public long getSize()
  {
    return this.size;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("SampleImpl");
    localStringBuilder.append("{offset=").append(this.offset);
    localStringBuilder.append("{size=").append(this.size);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }

  public void writeTo(WritableByteChannel paramWritableByteChannel)
    throws IOException
  {
    ensureData();
    ByteBuffer[] arrayOfByteBuffer = this.data;
    int i = arrayOfByteBuffer.length;
    for (int j = 0; j < i; j++)
      paramWritableByteChannel.write(arrayOfByteBuffer[j].duplicate());
  }
}