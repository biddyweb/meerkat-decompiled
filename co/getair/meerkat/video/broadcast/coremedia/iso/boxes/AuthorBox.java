package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class AuthorBox extends AbstractFullBox
{
  public static final String TYPE = "auth";
  private String author;
  private String language;

  public AuthorBox()
  {
    super("auth");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.author = IsoTypeReader.readString(paramByteBuffer);
  }

  public String getAuthor()
  {
    return this.author;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.author));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 7 + Utf8.utf8StringLengthInBytes(this.author);
  }

  public String getLanguage()
  {
    return this.language;
  }

  public void setAuthor(String paramString)
  {
    this.author = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public String toString()
  {
    return "AuthorBox[language=" + getLanguage() + ";author=" + getAuthor() + "]";
  }
}