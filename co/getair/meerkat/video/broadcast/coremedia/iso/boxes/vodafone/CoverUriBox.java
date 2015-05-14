package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.vodafone;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class CoverUriBox extends AbstractFullBox
{
  public static final String TYPE = "cvru";
  private String coverUri;

  public CoverUriBox()
  {
    super("cvru");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.coverUri = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(Utf8.convert(this.coverUri));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 5 + Utf8.utf8StringLengthInBytes(this.coverUri);
  }

  public String getCoverUri()
  {
    return this.coverUri;
  }

  public void setCoverUri(String paramString)
  {
    this.coverUri = paramString;
  }

  public String toString()
  {
    return "CoverUriBox[coverUri=" + getCoverUri() + "]";
  }
}