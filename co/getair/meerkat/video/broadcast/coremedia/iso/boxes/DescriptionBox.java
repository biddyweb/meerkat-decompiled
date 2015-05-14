package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class DescriptionBox extends AbstractFullBox
{
  public static final String TYPE = "dscp";
  private String description;
  private String language;

  public DescriptionBox()
  {
    super("dscp");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.description = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.description));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 7 + Utf8.utf8StringLengthInBytes(this.description);
  }

  public String getDescription()
  {
    return this.description;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public void setDescription(String paramString)
  {
    this.description = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public String toString()
  {
    return "DescriptionBox[language=" + getLanguage() + ";description=" + getDescription() + "]";
  }
}