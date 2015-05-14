package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class GenreBox extends AbstractFullBox
{
  public static final String TYPE = "gnre";
  private String genre;
  private String language;

  public GenreBox()
  {
    super("gnre");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.genre = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.genre));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 7 + Utf8.utf8StringLengthInBytes(this.genre);
  }

  public String getGenre()
  {
    return this.genre;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public void setGenre(String paramString)
  {
    this.genre = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public String toString()
  {
    return "GenreBox[language=" + getLanguage() + ";genre=" + getGenre() + "]";
  }
}