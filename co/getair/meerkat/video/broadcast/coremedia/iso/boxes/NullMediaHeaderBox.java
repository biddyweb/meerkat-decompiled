package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import java.nio.ByteBuffer;

public class NullMediaHeaderBox extends AbstractMediaHeaderBox
{
  public static final String TYPE = "nmhd";

  public NullMediaHeaderBox()
  {
    super("nmhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
  }

  protected long getContentSize()
  {
    return 4L;
  }
}