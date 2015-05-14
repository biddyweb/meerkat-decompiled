package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.vodafone;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class ContentDistributorIdBox extends AbstractFullBox
{
  public static final String TYPE = "cdis";
  private String contentDistributorId;
  private String language;

  public ContentDistributorIdBox()
  {
    super("cdis");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.language = IsoTypeReader.readIso639(paramByteBuffer);
    this.contentDistributorId = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeIso639(paramByteBuffer, this.language);
    paramByteBuffer.put(Utf8.convert(this.contentDistributorId));
    paramByteBuffer.put((byte)0);
  }

  public String getContentDistributorId()
  {
    return this.contentDistributorId;
  }

  protected long getContentSize()
  {
    return 5 + (2 + Utf8.utf8StringLengthInBytes(this.contentDistributorId));
  }

  public String getLanguage()
  {
    return this.language;
  }

  public String toString()
  {
    return "ContentDistributorIdBox[language=" + getLanguage() + ";contentDistributorId=" + getContentDistributorId() + "]";
  }
}