package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class TrackFragmentBaseMediaDecodeTimeBox extends AbstractFullBox
{
  public static final String TYPE = "tfdt";
  private long baseMediaDecodeTime;

  public TrackFragmentBaseMediaDecodeTimeBox()
  {
    super("tfdt");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      this.baseMediaDecodeTime = IsoTypeReader.readUInt64(paramByteBuffer);
      return;
    }
    this.baseMediaDecodeTime = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  public long getBaseMediaDecodeTime()
  {
    return this.baseMediaDecodeTime;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    if (getVersion() == 1)
    {
      IsoTypeWriter.writeUInt64(paramByteBuffer, this.baseMediaDecodeTime);
      return;
    }
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.baseMediaDecodeTime);
  }

  protected long getContentSize()
  {
    if (getVersion() == 0)
      return 8L;
    return 12L;
  }

  public void setBaseMediaDecodeTime(long paramLong)
  {
    this.baseMediaDecodeTime = paramLong;
  }

  public String toString()
  {
    return "TrackFragmentBaseMediaDecodeTimeBox{baseMediaDecodeTime=" + this.baseMediaDecodeTime + '}';
  }
}