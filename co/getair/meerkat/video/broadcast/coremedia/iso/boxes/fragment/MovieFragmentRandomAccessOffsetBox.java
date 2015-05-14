package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class MovieFragmentRandomAccessOffsetBox extends AbstractFullBox
{
  public static final String TYPE = "mfro";
  private long mfraSize;

  public MovieFragmentRandomAccessOffsetBox()
  {
    super("mfro");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.mfraSize = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.mfraSize);
  }

  protected long getContentSize()
  {
    return 8L;
  }

  public long getMfraSize()
  {
    return this.mfraSize;
  }

  public void setMfraSize(long paramLong)
  {
    this.mfraSize = paramLong;
  }
}