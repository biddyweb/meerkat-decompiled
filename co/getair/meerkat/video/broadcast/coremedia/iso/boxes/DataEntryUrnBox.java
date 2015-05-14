package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class DataEntryUrnBox extends AbstractFullBox
{
  public static final String TYPE = "urn ";
  private String location;
  private String name;

  public DataEntryUrnBox()
  {
    super("urn ");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.name = IsoTypeReader.readString(paramByteBuffer);
    this.location = IsoTypeReader.readString(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    paramByteBuffer.put(Utf8.convert(this.name));
    paramByteBuffer.put((byte)0);
    paramByteBuffer.put(Utf8.convert(this.location));
    paramByteBuffer.put((byte)0);
  }

  protected long getContentSize()
  {
    return 1 + (1 + Utf8.utf8StringLengthInBytes(this.name) + Utf8.utf8StringLengthInBytes(this.location));
  }

  public String getLocation()
  {
    return this.location;
  }

  public String getName()
  {
    return this.name;
  }

  public String toString()
  {
    return "DataEntryUrlBox[name=" + getName() + ";location=" + getLocation() + "]";
  }
}