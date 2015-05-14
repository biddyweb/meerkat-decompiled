package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part30;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class WebVTTSourceLabelBox extends AbstractBox
{
  public static final String TYPE = "vlab";
  String sourceLabel;

  public WebVTTSourceLabelBox()
  {
    super("vlab");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.sourceLabel = IsoTypeReader.readString(paramByteBuffer, paramByteBuffer.remaining());
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(Utf8.convert(this.sourceLabel));
  }

  protected long getContentSize()
  {
    return Utf8.utf8StringLengthInBytes(this.sourceLabel);
  }

  public String getSourceLabel()
  {
    return this.sourceLabel;
  }

  public void setSourceLabel(String paramString)
  {
    this.sourceLabel = paramString;
  }
}