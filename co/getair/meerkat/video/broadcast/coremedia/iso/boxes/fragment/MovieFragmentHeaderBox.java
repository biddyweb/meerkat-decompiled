package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class MovieFragmentHeaderBox extends AbstractFullBox
{
  public static final String TYPE = "mfhd";
  private long sequenceNumber;

  public MovieFragmentHeaderBox()
  {
    super("mfhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.sequenceNumber = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.sequenceNumber);
  }

  protected long getContentSize()
  {
    return 8L;
  }

  public long getSequenceNumber()
  {
    return this.sequenceNumber;
  }

  public void setSequenceNumber(long paramLong)
  {
    this.sequenceNumber = paramLong;
  }

  public String toString()
  {
    return "MovieFragmentHeaderBox{sequenceNumber=" + this.sequenceNumber + '}';
  }
}