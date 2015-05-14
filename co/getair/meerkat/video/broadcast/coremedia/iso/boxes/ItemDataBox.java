package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class ItemDataBox extends AbstractBox
{
  public static final String TYPE = "idat";
  ByteBuffer data = ByteBuffer.allocate(0);

  public ItemDataBox()
  {
    super("idat");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.data = paramByteBuffer.slice();
    paramByteBuffer.position(paramByteBuffer.position() + paramByteBuffer.remaining());
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
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