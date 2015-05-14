package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoFile;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class OriginalFormatBox extends AbstractBox
{
  public static final String TYPE = "frma";
  private String dataFormat = "    ";

  static
  {
    if (!OriginalFormatBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public OriginalFormatBox()
  {
    super("frma");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.dataFormat = IsoTypeReader.read4cc(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(IsoFile.fourCCtoBytes(this.dataFormat));
  }

  protected long getContentSize()
  {
    return 4L;
  }

  public String getDataFormat()
  {
    return this.dataFormat;
  }

  public void setDataFormat(String paramString)
  {
    assert (paramString.length() == 4);
    this.dataFormat = paramString;
  }

  public String toString()
  {
    return "OriginalFormatBox[dataFormat=" + getDataFormat() + "]";
  }
}