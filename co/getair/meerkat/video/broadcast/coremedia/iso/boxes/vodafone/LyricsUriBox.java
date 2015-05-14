package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.vodafone;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class LyricsUriBox extends AbstractFullBox
{
  public static final String TYPE = "lrcu";
  private String lyricsUri;

  public LyricsUriBox()
  {
    super("lrcu");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.lyricsUri = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(Utf8.convert(this.lyricsUri));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 5 + Utf8.utf8StringLengthInBytes(this.lyricsUri);
  }

  public String getLyricsUri()
  {
    return this.lyricsUri;
  }

  public void setLyricsUri(String paramString)
  {
    this.lyricsUri = paramString;
  }

  public String toString()
  {
    return "LyricsUriBox[lyricsUri=" + getLyricsUri() + "]";
  }
}