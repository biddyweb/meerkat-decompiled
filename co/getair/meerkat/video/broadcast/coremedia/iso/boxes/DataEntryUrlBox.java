package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class DataEntryUrlBox extends AbstractFullBox
{
  public static final String TYPE = "url ";

  public DataEntryUrlBox()
  {
    super("url ");
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

  public String toString()
  {
    return "DataEntryUrlBox[]";
  }
}