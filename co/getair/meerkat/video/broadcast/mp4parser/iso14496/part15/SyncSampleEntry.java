package co.getair.meerkat.video.broadcast.mp4parser.iso14496.part15;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping.GroupEntry;
import java.nio.ByteBuffer;

public class SyncSampleEntry extends GroupEntry
{
  public static final String TYPE = "sync";
  int nalUnitType;
  int reserved;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    SyncSampleEntry localSyncSampleEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localSyncSampleEntry = (SyncSampleEntry)paramObject;
      if (this.nalUnitType != localSyncSampleEntry.nalUnitType)
        return false;
    }
    while (this.reserved == localSyncSampleEntry.reserved);
    return false;
  }

  public ByteBuffer get()
  {
    ByteBuffer localByteBuffer = ByteBuffer.allocate(1);
    IsoTypeWriter.writeUInt8(localByteBuffer, this.nalUnitType + (this.reserved << 6));
    return (ByteBuffer)localByteBuffer.rewind();
  }

  public int getNalUnitType()
  {
    return this.nalUnitType;
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public String getType()
  {
    return "sync";
  }

  public int hashCode()
  {
    return 31 * this.reserved + this.nalUnitType;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    this.reserved = ((i & 0xC0) >> 6);
    this.nalUnitType = (i & 0x3F);
  }

  public void setNalUnitType(int paramInt)
  {
    this.nalUnitType = paramInt;
  }

  public void setReserved(int paramInt)
  {
    this.reserved = paramInt;
  }

  public String toString()
  {
    return "SyncSampleEntry{reserved=" + this.reserved + ", nalUnitType=" + this.nalUnitType + '}';
  }
}