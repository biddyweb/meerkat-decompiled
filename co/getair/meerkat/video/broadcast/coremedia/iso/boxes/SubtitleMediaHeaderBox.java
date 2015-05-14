package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import java.nio.ByteBuffer;

public class SubtitleMediaHeaderBox extends AbstractMediaHeaderBox
{
  public static final String TYPE = "sthd";

  public SubtitleMediaHeaderBox()
  {
    super("sthd");
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
    return "SubtitleMediaHeaderBox";
  }
}