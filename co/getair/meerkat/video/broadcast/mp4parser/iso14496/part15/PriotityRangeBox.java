package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;

public class PriotityRangeBox extends AbstractBox
{
  public static final String TYPE = "svpr";
  int max_priorityId;
  int min_priorityId;
  int reserved1 = 0;
  int reserved2 = 0;

  public PriotityRangeBox()
  {
    super("svpr");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    this.min_priorityId = IsoTypeReader.readUInt8(paramByteBuffer);
    this.reserved1 = ((0xC0 & this.min_priorityId) >> 6);
    this.min_priorityId = (0x3F & this.min_priorityId);
    this.max_priorityId = IsoTypeReader.readUInt8(paramByteBuffer);
    this.reserved2 = ((0xC0 & this.max_priorityId) >> 6);
    this.max_priorityId = (0x3F & this.max_priorityId);
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt8(paramByteBuffer, (this.reserved1 << 6) + this.min_priorityId);
    IsoTypeWriter.writeUInt8(paramByteBuffer, (this.reserved2 << 6) + this.max_priorityId);
  }

  protected long getContentSize()
  {
    return 2L;
  }

  public int getMax_priorityId()
  {
    return this.max_priorityId;
  }

  public int getMin_priorityId()
  {
    return this.min_priorityId;
  }

  public int getReserved1()
  {
    return this.reserved1;
  }

  public int getReserved2()
  {
    return this.reserved2;
  }

  public void setMax_priorityId(int paramInt)
  {
    this.max_priorityId = paramInt;
  }

  public void setMin_priorityId(int paramInt)
  {
    this.min_priorityId = paramInt;
  }

  public void setReserved1(int paramInt)
  {
    this.reserved1 = paramInt;
  }

  public void setReserved2(int paramInt)
  {
    this.reserved2 = paramInt;
  }
}