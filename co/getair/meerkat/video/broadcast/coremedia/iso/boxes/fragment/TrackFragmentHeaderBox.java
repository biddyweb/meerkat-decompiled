package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public class TrackFragmentHeaderBox extends AbstractFullBox
{
  public static final String TYPE = "tfhd";
  private long baseDataOffset = -1L;
  private boolean defaultBaseIsMoof;
  private long defaultSampleDuration = -1L;
  private SampleFlags defaultSampleFlags;
  private long defaultSampleSize = -1L;
  private boolean durationIsEmpty;
  private long sampleDescriptionIndex;
  private long trackId;

  public TrackFragmentHeaderBox()
  {
    super("tfhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.trackId = IsoTypeReader.readUInt32(paramByteBuffer);
    if ((0x1 & getFlags()) == 1)
      this.baseDataOffset = IsoTypeReader.readUInt64(paramByteBuffer);
    if ((0x2 & getFlags()) == 2)
      this.sampleDescriptionIndex = IsoTypeReader.readUInt32(paramByteBuffer);
    if ((0x8 & getFlags()) == 8)
      this.defaultSampleDuration = IsoTypeReader.readUInt32(paramByteBuffer);
    if ((0x10 & getFlags()) == 16)
      this.defaultSampleSize = IsoTypeReader.readUInt32(paramByteBuffer);
    if ((0x20 & getFlags()) == 32)
      this.defaultSampleFlags = new SampleFlags(paramByteBuffer);
    if ((0x10000 & getFlags()) == 65536)
      this.durationIsEmpty = true;
    if ((0x20000 & getFlags()) == 131072)
      this.defaultBaseIsMoof = true;
  }

  public long getBaseDataOffset()
  {
    return this.baseDataOffset;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.trackId);
    if ((0x1 & getFlags()) == 1)
      IsoTypeWriter.writeUInt64(paramByteBuffer, getBaseDataOffset());
    if ((0x2 & getFlags()) == 2)
      IsoTypeWriter.writeUInt32(paramByteBuffer, getSampleDescriptionIndex());
    if ((0x8 & getFlags()) == 8)
      IsoTypeWriter.writeUInt32(paramByteBuffer, getDefaultSampleDuration());
    if ((0x10 & getFlags()) == 16)
      IsoTypeWriter.writeUInt32(paramByteBuffer, getDefaultSampleSize());
    if ((0x20 & getFlags()) == 32)
      this.defaultSampleFlags.getContent(paramByteBuffer);
  }

  protected long getContentSize()
  {
    long l = 8L;
    int i = getFlags();
    if ((i & 0x1) == 1)
      l += 8L;
    if ((i & 0x2) == 2)
      l += 4L;
    if ((i & 0x8) == 8)
      l += 4L;
    if ((i & 0x10) == 16)
      l += 4L;
    if ((i & 0x20) == 32)
      l += 4L;
    return l;
  }

  public long getDefaultSampleDuration()
  {
    return this.defaultSampleDuration;
  }

  public SampleFlags getDefaultSampleFlags()
  {
    return this.defaultSampleFlags;
  }

  public long getDefaultSampleSize()
  {
    return this.defaultSampleSize;
  }

  public long getSampleDescriptionIndex()
  {
    return this.sampleDescriptionIndex;
  }

  public long getTrackId()
  {
    return this.trackId;
  }

  public boolean hasBaseDataOffset()
  {
    return (0x1 & getFlags()) != 0;
  }

  public boolean hasDefaultSampleDuration()
  {
    return (0x8 & getFlags()) != 0;
  }

  public boolean hasDefaultSampleFlags()
  {
    return (0x20 & getFlags()) != 0;
  }

  public boolean hasDefaultSampleSize()
  {
    return (0x10 & getFlags()) != 0;
  }

  public boolean hasSampleDescriptionIndex()
  {
    return (0x2 & getFlags()) != 0;
  }

  public boolean isDefaultBaseIsMoof()
  {
    return this.defaultBaseIsMoof;
  }

  public boolean isDurationIsEmpty()
  {
    return this.durationIsEmpty;
  }

  public void setBaseDataOffset(long paramLong)
  {
    if (paramLong == -1L)
      setFlags(0x7FFFFFFE & getFlags());
    while (true)
    {
      this.baseDataOffset = paramLong;
      return;
      setFlags(0x1 | getFlags());
    }
  }

  public void setDefaultBaseIsMoof(boolean paramBoolean)
  {
    setFlags(0x20000 | getFlags());
    this.defaultBaseIsMoof = paramBoolean;
  }

  public void setDefaultSampleDuration(long paramLong)
  {
    setFlags(0x8 | getFlags());
    this.defaultSampleDuration = paramLong;
  }

  public void setDefaultSampleFlags(SampleFlags paramSampleFlags)
  {
    setFlags(0x20 | getFlags());
    this.defaultSampleFlags = paramSampleFlags;
  }

  public void setDefaultSampleSize(long paramLong)
  {
    setFlags(0x10 | getFlags());
    this.defaultSampleSize = paramLong;
  }

  public void setDurationIsEmpty(boolean paramBoolean)
  {
    setFlags(0x10000 | getFlags());
    this.durationIsEmpty = paramBoolean;
  }

  public void setSampleDescriptionIndex(long paramLong)
  {
    if (paramLong == -1L)
      setFlags(0x7FFFFFFD & getFlags());
    while (true)
    {
      this.sampleDescriptionIndex = paramLong;
      return;
      setFlags(0x2 | getFlags());
    }
  }

  public void setTrackId(long paramLong)
  {
    this.trackId = paramLong;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("TrackFragmentHeaderBox");
    localStringBuilder.append("{trackId=").append(this.trackId);
    localStringBuilder.append(", baseDataOffset=").append(this.baseDataOffset);
    localStringBuilder.append(", sampleDescriptionIndex=").append(this.sampleDescriptionIndex);
    localStringBuilder.append(", defaultSampleDuration=").append(this.defaultSampleDuration);
    localStringBuilder.append(", defaultSampleSize=").append(this.defaultSampleSize);
    localStringBuilder.append(", defaultSampleFlags=").append(this.defaultSampleFlags);
    localStringBuilder.append(", durationIsEmpty=").append(this.durationIsEmpty);
    localStringBuilder.append(", defaultBaseIsMoof=").append(this.defaultBaseIsMoof);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }
}