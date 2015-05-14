package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class TierBitRateBox extends AbstractBox
{
  public static final String TYPE = "tibr";
  long avgBitRate;
  long baseBitRate;
  long maxBitRate;
  long tierAvgBitRate;
  long tierBaseBitRate;
  long tierMaxBitRate;

  public TierBitRateBox()
  {
    super("tibr");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.baseBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.maxBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.avgBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.tierBaseBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.tierMaxBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.tierAvgBitRate = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  public long getAvgBitRate()
  {
    return this.avgBitRate;
  }

  public long getBaseBitRate()
  {
    return this.baseBitRate;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.baseBitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.maxBitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.avgBitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.tierBaseBitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.tierMaxBitRate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.tierAvgBitRate);
  }

  protected long getContentSize()
  {
    return 24L;
  }

  public long getMaxBitRate()
  {
    return this.maxBitRate;
  }

  public long getTierAvgBitRate()
  {
    return this.tierAvgBitRate;
  }

  public long getTierBaseBitRate()
  {
    return this.tierBaseBitRate;
  }

  public long getTierMaxBitRate()
  {
    return this.tierMaxBitRate;
  }

  public void setAvgBitRate(long paramLong)
  {
    this.avgBitRate = paramLong;
  }

  public void setBaseBitRate(long paramLong)
  {
    this.baseBitRate = paramLong;
  }

  public void setMaxBitRate(long paramLong)
  {
    this.maxBitRate = paramLong;
  }

  public void setTierAvgBitRate(long paramLong)
  {
    this.tierAvgBitRate = paramLong;
  }

  public void setTierBaseBitRate(long paramLong)
  {
    this.tierBaseBitRate = paramLong;
  }

  public void setTierMaxBitRate(long paramLong)
  {
    this.tierMaxBitRate = paramLong;
  }
}