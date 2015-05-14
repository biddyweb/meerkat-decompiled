package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class UnknownBox extends AbstractBox
{
  ByteBuffer data;

  public UnknownBox(String paramString)
  {
    super(paramString);
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.data = paramByteBuffer;
    paramByteBuffer.position(paramByteBuffer.position() + paramByteBuffer.remaining());
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    this.data.rewind();
    paramByteBuffer.put(this.data);
  }

  protected long getContentSize()
  {
    return this.data.limit();
  }

  public ByteBuffer getData()
  {
    return this.data;
  }

  public void setData(ByteBuffer paramByteBuffer)
  {
    this.data = paramByteBuffer;
  }
}