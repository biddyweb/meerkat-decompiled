package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import java.nio.ByteBuffer;

public class HintMediaHeaderBox extends AbstractMediaHeaderBox
{
  public static final String TYPE = "hmhd";
  private long avgBitrate;
  private int avgPduSize;
  private long maxBitrate;
  private int maxPduSize;

  public HintMediaHeaderBox()
  {
    super("hmhd");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.maxPduSize = IsoTypeReader.readUInt16(paramByteBuffer);
    this.avgPduSize = IsoTypeReader.readUInt16(paramByteBuffer);
    this.maxBitrate = IsoTypeReader.readUInt32(paramByteBuffer);
    this.avgBitrate = IsoTypeReader.readUInt32(paramByteBuffer);
    IsoTypeReader.readUInt32(paramByteBuffer);
  }

  public long getAvgBitrate()
  {
    return this.avgBitrate;
  }

  public int getAvgPduSize()
  {
    return this.avgPduSize;
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.maxPduSize);
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.avgPduSize);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.maxBitrate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.avgBitrate);
    IsoTypeWriter.writeUInt32(paramByteBuffer, 0L);
  }

  protected long getContentSize()
  {
    return 20L;
  }

  public long getMaxBitrate()
  {
    return this.maxBitrate;
  }

  public int getMaxPduSize()
  {
    return this.maxPduSize;
  }

  public String toString()
  {
    return "HintMediaHeaderBox{maxPduSize=" + this.maxPduSize + ", avgPduSize=" + this.avgPduSize + ", maxBitrate=" + this.maxBitrate + ", avgBitrate=" + this.avgBitrate + '}';
  }
}