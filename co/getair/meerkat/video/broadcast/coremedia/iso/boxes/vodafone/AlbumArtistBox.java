package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.vodafone;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class AlbumArtistBox extends AbstractFullBox
{
  public static final String TYPE = "albr";
  private String albumArtist;
  private String language;

  public AlbumArtistBox()
  {
    super("albr");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.albumArtist = IsoTypeReader.readString(paramByteBuffer);
  }

  public String getAlbumArtist()
  {
    return this.albumArtist;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.albumArtist));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 1 + (6 + Utf8.utf8StringLengthInBytes(this.albumArtist));
  }

  public String getLanguage()
  {
    return this.language;
  }

  public void setAlbumArtist(String paramString)
  {
    this.albumArtist = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public String toString()
  {
    return "AlbumArtistBox[language=" + getLanguage() + ";albumArtist=" + getAlbumArtist() + "]";
  }
}