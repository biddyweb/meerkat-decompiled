package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.apple;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;

public final class AppleLosslessSpecificBox extends AbstractFullBox
{
  public static final String TYPE = "alac";
  private long bitRate;
  private int channels;
  private int historyMult;
  private int initialHistory;
  private int kModifier;
  private long maxCodedFrameSize;
  private long maxSamplePerFrame;
  private long sampleRate;
  private int sampleSize;
  private int unknown1;
  private int unknown2;

  public AppleLosslessSpecificBox()
  {
    super("alac");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.maxSamplePerFrame = IsoTypeReader.readUInt32(paramByteBuffer);
    this.unknown1 = IsoTypeReader.readUInt8(paramByteBuffer);
    this.sampleSize = IsoTypeReader.readUInt8(paramByteBuffer);
    this.historyMult = IsoTypeReader.readUInt8(paramByteBuffer);
    this.initialHistory = IsoTypeReader.readUInt8(paramByteBuffer);
    this.kModifier = IsoTypeReader.readUInt8(paramByteBuffer);
    this.channels = IsoTypeReader.readUInt8(paramByteBuffer);
    this.unknown2 = IsoTypeReader.readUInt16(paramByteBuffer);
    this.maxCodedFrameSize = IsoTypeReader.readUInt32(paramByteBuffer);
    this.bitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.sampleRate = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  public long getBitRate()
  {
    return this.bitRate;
  }

  public int getChannels()
  {
    return this.channels;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.maxSamplePerFrame);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.unknown1);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.sampleSize);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.historyMult);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.initialHistory);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.kModifier);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.channels);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.unknown2);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.maxCodedFrameSize);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.bitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.sampleRate);
  }

  protected long getContentSize()
  {
    return 28L;
  }

  public int getHistoryMult()
  {
    return this.historyMult;
  }

  public int getInitialHistory()
  {
    return this.initialHistory;
  }

  public int getKModifier()
  {
    return this.kModifier;
  }

  public long getMaxCodedFrameSize()
  {
    return this.maxCodedFrameSize;
  }

  public long getMaxSamplePerFrame()
  {
    return this.maxSamplePerFrame;
  }

  public long getSampleRate()
  {
    return this.sampleRate;
  }

  public int getSampleSize()
  {
    return this.sampleSize;
  }

  public int getUnknown1()
  {
    return this.unknown1;
  }

  public int getUnknown2()
  {
    return this.unknown2;
  }

  public void setBitRate(int paramInt)
  {
    this.bitRate = paramInt;
  }

  public void setChannels(int paramInt)
  {
    this.channels = paramInt;
  }

  public void setHistoryMult(int paramInt)
  {
    this.historyMult = paramInt;
  }

  public void setInitialHistory(int paramInt)
  {
    this.initialHistory = paramInt;
  }

  public void setKModifier(int paramInt)
  {
    this.kModifier = paramInt;
  }

  public void setMaxCodedFrameSize(int paramInt)
  {
    this.maxCodedFrameSize = paramInt;
  }

  public void setMaxSamplePerFrame(int paramInt)
  {
    this.maxSamplePerFrame = paramInt;
  }

  public void setSampleRate(int paramInt)
  {
    this.sampleRate = paramInt;
  }

  public void setSampleSize(int paramInt)
  {
    this.sampleSize = paramInt;
  }

  public void setUnknown1(int paramInt)
  {
    this.unknown1 = paramInt;
  }

  public void setUnknown2(int paramInt)
  {
    this.unknown2 = paramInt;
  }
}