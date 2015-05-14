package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class RateShareEntry extends GroupEntry
{
  public static final String TYPE = "rash";
  private short discardPriority;
  private List<Entry> entries = new LinkedList();
  private int maximumBitrate;
  private int minimumBitrate;
  private short operationPointCut;
  private short targetRateShare;

  public boolean equals(Object paramObject)
  {
    if (this == paramObject);
    RateShareEntry localRateShareEntry;
    do
    {
      return true;
      if ((paramObject == null) || (getClass() != paramObject.getClass()))
        return false;
      localRateShareEntry = (RateShareEntry)paramObject;
      if (this.discardPriority != localRateShareEntry.discardPriority)
        return false;
      if (this.maximumBitrate != localRateShareEntry.maximumBitrate)
        return false;
      if (this.minimumBitrate != localRateShareEntry.minimumBitrate)
        return false;
      if (this.operationPointCut != localRateShareEntry.operationPointCut)
        return false;
      if (this.targetRateShare != localRateShareEntry.targetRateShare)
        return false;
      if (this.entries == null)
        break;
    }
    while (this.entries.equals(localRateShareEntry.entries));
    while (true)
    {
      return false;
      if (localRateShareEntry.entries == null)
        break;
    }
  }

  public ByteBuffer get()
  {
    int i;
    ByteBuffer localByteBuffer;
    if (this.operationPointCut == 1)
    {
      i = 13;
      localByteBuffer = ByteBuffer.allocate(i);
      localByteBuffer.putShort(this.operationPointCut);
      if (this.operationPointCut != 1)
        break label89;
      localByteBuffer.putShort(this.targetRateShare);
    }
    while (true)
    {
      localByteBuffer.putInt(this.maximumBitrate);
      localByteBuffer.putInt(this.minimumBitrate);
      IsoTypeWriter.writeUInt8(localByteBuffer, this.discardPriority);
      localByteBuffer.rewind();
      return localByteBuffer;
      i = 11 + 6 * this.operationPointCut;
      break;
      label89: Iterator localIterator = this.entries.iterator();
      while (localIterator.hasNext())
      {
        Entry localEntry = (Entry)localIterator.next();
        localByteBuffer.putInt(localEntry.getAvailableBitrate());
        localByteBuffer.putShort(localEntry.getTargetRateShare());
      }
    }
  }

  public short getDiscardPriority()
  {
    return this.discardPriority;
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public int getMaximumBitrate()
  {
    return this.maximumBitrate;
  }

  public int getMinimumBitrate()
  {
    return this.minimumBitrate;
  }

  public short getOperationPointCut()
  {
    return this.operationPointCut;
  }

  public short getTargetRateShare()
  {
    return this.targetRateShare;
  }

  public String getType()
  {
    return "rash";
  }

  public int hashCode()
  {
    int i = 31 * (31 * this.operationPointCut + this.targetRateShare);
    if (this.entries != null);
    for (int j = this.entries.hashCode(); ; j = 0)
      return 31 * (31 * (31 * (i + j) + this.maximumBitrate) + this.minimumBitrate) + this.discardPriority;
  }

  public void parse(ByteBuffer paramByteBuffer)
  {
    this.operationPointCut = paramByteBuffer.getShort();
    if (this.operationPointCut == 1)
    {
      this.targetRateShare = paramByteBuffer.getShort();
      this.maximumBitrate = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
      this.minimumBitrate = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
      this.discardPriority = ((short)IsoTypeReader.readUInt8(paramByteBuffer));
      return;
    }
    int j;
    for (int i = this.operationPointCut; ; i = j)
    {
      j = i - 1;
      if (i <= 0)
        break;
      this.entries.add(new Entry(CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer)), paramByteBuffer.getShort()));
    }
  }

  public void setDiscardPriority(short paramShort)
  {
    this.discardPriority = paramShort;
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public void setMaximumBitrate(int paramInt)
  {
    this.maximumBitrate = paramInt;
  }

  public void setMinimumBitrate(int paramInt)
  {
    this.minimumBitrate = paramInt;
  }

  public void setOperationPointCut(short paramShort)
  {
    this.operationPointCut = paramShort;
  }

  public void setTargetRateShare(short paramShort)
  {
    this.targetRateShare = paramShort;
  }

  public static class Entry
  {
    int availableBitrate;
    short targetRateShare;

    public Entry(int paramInt, short paramShort)
    {
      this.availableBitrate = paramInt;
      this.targetRateShare = paramShort;
    }

    public boolean equals(Object paramObject)
    {
      if (this == paramObject);
      Entry localEntry;
      do
      {
        return true;
        if ((paramObject == null) || (getClass() != paramObject.getClass()))
          return false;
        localEntry = (Entry)paramObject;
        if (this.availableBitrate != localEntry.availableBitrate)
          return false;
      }
      while (this.targetRateShare == localEntry.targetRateShare);
      return false;
    }

    public int getAvailableBitrate()
    {
      return this.availableBitrate;
    }

    public short getTargetRateShare()
    {
      return this.targetRateShare;
    }

    public int hashCode()
    {
      return 31 * this.availableBitrate + this.targetRateShare;
    }

    public void setAvailableBitrate(int paramInt)
    {
      this.availableBitrate = paramInt;
    }

    public void setTargetRateShare(short paramShort)
    {
      this.targetRateShare = paramShort;
    }

    public String toString()
    {
      return "{availableBitrate=" + this.availableBitrate + ", targetRateShare=" + this.targetRateShare + '}';
    }
  }
}