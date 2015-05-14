package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part30;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class WebVTTConfigurationBox extends AbstractBox
{
  public static final String TYPE = "vttC";
  String config;

  public WebVTTConfigurationBox()
  {
    super("vttC");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.config = IsoTypeReader.readString(paramByteBuffer, paramByteBuffer.remaining());
  }

  public String getConfig()
  {
    return this.config;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(Utf8.convert(this.config));
  }

  protected long getContentSize()
  {
    return Utf8.utf8StringLengthInBytes(this.config);
  }

  public void setConfig(String paramString)
  {
    this.config = paramString;
  }
}