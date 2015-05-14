package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class MovieExtendsHeaderBox extends AbstractFullBox
{
  public static final String TYPE = "mehd";
  private long fragmentDuration;

  public MovieExtendsHeaderBox()
  {
    super("mehd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1);
    for (long l = IsoTypeReader.readUInt64(paramByteBuffer); ; l = IsoTypeReader.readUInt32(paramByteBuffer))
    {
      this.fragmentDuration = l;
      return;
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      IsoTypeWriter.writeUInt64(paramByteBuffer, this.fragmentDuration);
      return;
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.fragmentDuration);
  }

  protected long getContentSize()
  {
    if (getVersion() == 1)
      return 12L;
    return 8L;
  }

  public long getFragmentDuration()
  {
    return this.fragmentDuration;
  }

  public void setFragmentDuration(long paramLong)
  {
    this.fragmentDuration = paramLong;
  }
}