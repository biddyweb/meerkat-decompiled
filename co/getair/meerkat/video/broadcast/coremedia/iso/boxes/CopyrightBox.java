package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class CopyrightBox extends AbstractFullBox
{
  public static final String TYPE = "cprt";
  private String copyright;
  private String language;

  public CopyrightBox()
  {
    super("cprt");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.copyright = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.copyright));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 7 + Utf8.utf8StringLengthInBytes(this.copyright);
  }

  public String getCopyright()
  {
    return this.copyright;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public void setCopyright(String paramString)
  {
    this.copyright = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public String toString()
  {
    return "CopyrightBox[language=" + getLanguage() + ";copyright=" + getCopyright() + "]";
  }
}