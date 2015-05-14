package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class TitleBox extends AbstractFullBox
{
  public static final String TYPE = "titl";
  private String language;
  private String title;

  public TitleBox()
  {
    super("titl");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.title = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.title));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 7 + Utf8.utf8StringLengthInBytes(this.title);
  }

  public String getLanguage()
  {
    return this.language;
  }

  public String getTitle()
  {
    return this.title;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public void setTitle(String paramString)
  {
    this.title = paramString;
  }

  public String toString()
  {
    return "TitleBox[language=" + getLanguage() + ";title=" + getTitle() + "]";
  }
}