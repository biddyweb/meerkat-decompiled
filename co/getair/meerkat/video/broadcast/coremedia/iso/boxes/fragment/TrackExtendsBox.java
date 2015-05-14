package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class TrackExtendsBox extends AbstractFullBox
{
  public static final String TYPE = "trex";
  private long defaultSampleDescriptionIndex;
  private long defaultSampleDuration;
  private SampleFlags defaultSampleFlags;
  private long defaultSampleSize;
  private long trackId;

  public TrackExtendsBox()
  {
    super("trex");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.trackId = IsoTypeReader.readUInt32(paramByteBuffer);
    this.defaultSampleDescriptionIndex = IsoTypeReader.readUInt32(paramByteBuffer);
    this.defaultSampleDuration = IsoTypeReader.readUInt32(paramByteBuffer);
    this.defaultSampleSize = IsoTypeReader.readUInt32(paramByteBuffer);
    this.defaultSampleFlags = new SampleFlags(paramByteBuffer);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.trackId);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.defaultSampleDescriptionIndex);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.defaultSampleDuration);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.defaultSampleSize);
    this.defaultSampleFlags.getContent(paramByteBuffer);
  }

  protected long getContentSize()
  {
    return 24L;
  }

  public long getDefaultSampleDescriptionIndex()
  {
    return this.defaultSampleDescriptionIndex;
  }

  public long getDefaultSampleDuration()
  {
    return this.defaultSampleDuration;
  }

  public SampleFlags getDefaultSampleFlags()
  {
    return this.defaultSampleFlags;
  }

  public String getDefaultSampleFlagsStr()
  {
    return this.defaultSampleFlags.toString();
  }

  public long getDefaultSampleSize()
  {
    return this.defaultSampleSize;
  }

  public long getTrackId()
  {
    return this.trackId;
  }

  public void setDefaultSampleDescriptionIndex(long paramLong)
  {
    this.defaultSampleDescriptionIndex = paramLong;
  }

  public void setDefaultSampleDuration(long paramLong)
  {
    this.defaultSampleDuration = paramLong;
  }

  public void setDefaultSampleFlags(SampleFlags paramSampleFlags)
  {
    this.defaultSampleFlags = paramSampleFlags;
  }

  public void setDefaultSampleSize(long paramLong)
  {
    this.defaultSampleSize = paramLong;
  }

  public void setTrackId(long paramLong)
  {
    this.trackId = paramLong;
  }
}