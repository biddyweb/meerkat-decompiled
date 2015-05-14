package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class FreeSpaceBox extends AbstractBox
{
  public static final String TYPE = "skip";
  byte[] data;

  public FreeSpaceBox()
  {
    super("skip");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.data = new byte[paramByteBuffer.remaining()];
    paramByteBuffer.get(this.data);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(this.data);
  }

  protected long getContentSize()
  {
    return this.data.length;
  }

  public byte[] getData()
  {
    return this.data;
  }

  public void setData(byte[] paramArrayOfByte)
  {
    this.data = paramArrayOfByte;
  }

  public String toString()
  {
    return "FreeSpaceBox[size=" + this.data.length + ";type=" + getType() + "]";
  }
}