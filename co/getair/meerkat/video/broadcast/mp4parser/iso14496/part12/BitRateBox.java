package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part12;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public final class BitRateBox extends AbstractBox
{
  public static final String TYPE = "btrt";
  private long avgBitrate;
  private long bufferSizeDb;
  private long maxBitrate;

  public BitRateBox()
  {
    super("btrt");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.bufferSizeDb = IsoTypeReader.readUInt32(paramByteBuffer);
    this.maxBitrate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.avgBitrate = IsoTypeReader.readUInt32(paramByteBuffer);
  }

  public long getAvgBitrate()
  {
    return this.avgBitrate;
  }

  public long getBufferSizeDb()
  {
    return this.bufferSizeDb;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.bufferSizeDb);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.maxBitrate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.avgBitrate);
  }

  protected long getContentSize()
  {
    return 12L;
  }

  public long getMaxBitrate()
  {
    return this.maxBitrate;
  }

  public void setAvgBitrate(long paramLong)
  {
    this.avgBitrate = paramLong;
  }

  public void setBufferSizeDb(long paramLong)
  {
    this.bufferSizeDb = paramLong;
  }

  public void setMaxBitrate(long paramLong)
  {
    this.maxBitrate = paramLong;
  }
}