package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class AlbumBox extends AbstractFullBox
{
  public static final String TYPE = "albm";
  private String albumTitle;
  private String language;
  private int trackNumber;

  public AlbumBox()
  {
    super("albm");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.albumTitle = IsoTypeReader.readString(paramByteBuffer);
    if (paramByteBuffer.remaining() > 0)
    {
      this.trackNumber = IsoTypeReader.readUInt8(paramByteBuffer);
      return;
    }
    this.trackNumber = -1;
  }

  public String getAlbumTitle()
  {
    return this.albumTitle;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.albumTitle));
    paramByteBuffer.put((byte)0);
    if (this.trackNumber != -1)
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.trackNumber);
  }

  protected long getContentSize()
  {
    int i = 1 + (6 + Utf8.utf8StringLengthInBytes(this.albumTitle));
    if (this.trackNumber == -1);
    for (int j = 0; ; j = 1)
      return j + i;
  }

  public String getLanguage()
  {
    return this.language;
  }

  public int getTrackNumber()
  {
    return this.trackNumber;
  }

  public void setAlbumTitle(String paramString)
  {
    this.albumTitle = paramString;
  }

  public void setLanguage(String paramString)
  {
    this.language = paramString;
  }

  public void setTrackNumber(int paramInt)
  {
    this.trackNumber = paramInt;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("AlbumBox[language=").append(getLanguage()).append(";");
    localStringBuilder.append("albumTitle=").append(getAlbumTitle());
    if (this.trackNumber >= 0)
      localStringBuilder.append(";trackNumber=").append(getTrackNumber());
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}