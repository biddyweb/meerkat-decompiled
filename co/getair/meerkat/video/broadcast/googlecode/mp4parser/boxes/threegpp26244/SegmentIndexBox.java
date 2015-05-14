package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.threegpp26244;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitWriterBuffer;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SegmentIndexBox extends AbstractFullBox
{
  public static final String TYPE = "sidx";
  long earliestPresentationTime;
  List<Entry> entries = new ArrayList();
  long firstOffset;
  long referenceId;
  int reserved;
  long timeScale;

  public SegmentIndexBox()
  {
    super("sidx");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.referenceId = IsoTypeReader.readUInt32(paramByteBuffer);
    this.timeScale = IsoTypeReader.readUInt32(paramByteBuffer);
    if (getVersion() == 0)
      this.earliestPresentationTime = IsoTypeReader.readUInt32(paramByteBuffer);
    for (this.firstOffset = IsoTypeReader.readUInt32(paramByteBuffer); ; this.firstOffset = IsoTypeReader.readUInt64(paramByteBuffer))
    {
      this.reserved = IsoTypeReader.readUInt16(paramByteBuffer);
      int i = IsoTypeReader.readUInt16(paramByteBuffer);
      for (int j = 0; j < i; j++)
      {
        BitReaderBuffer localBitReaderBuffer1 = new BitReaderBuffer(paramByteBuffer);
        Entry localEntry = new Entry();
        localEntry.setReferenceType((byte)localBitReaderBuffer1.readBits(1));
        localEntry.setReferencedSize(localBitReaderBuffer1.readBits(31));
        localEntry.setSubsegmentDuration(IsoTypeReader.readUInt32(paramByteBuffer));
        BitReaderBuffer localBitReaderBuffer2 = new BitReaderBuffer(paramByteBuffer);
        localEntry.setStartsWithSap((byte)localBitReaderBuffer2.readBits(1));
        localEntry.setSapType((byte)localBitReaderBuffer2.readBits(3));
        localEntry.setSapDeltaTime(localBitReaderBuffer2.readBits(28));
        this.entries.add(localEntry);
      }
      this.earliestPresentationTime = IsoTypeReader.readUInt64(paramByteBuffer);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.referenceId);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.timeScale);
    if (getVersion() == 0)
    {
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.earliestPresentationTime);
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.firstOffset);
    }
    while (true)
    {
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.reserved);
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.entries.size());
      Iterator localIterator = this.entries.iterator();
      while (localIterator.hasNext())
      {
        Entry localEntry = (Entry)localIterator.next();
        BitWriterBuffer localBitWriterBuffer1 = new BitWriterBuffer(paramByteBuffer);
        localBitWriterBuffer1.writeBits(localEntry.getReferenceType(), 1);
        localBitWriterBuffer1.writeBits(localEntry.getReferencedSize(), 31);
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getSubsegmentDuration());
        BitWriterBuffer localBitWriterBuffer2 = new BitWriterBuffer(paramByteBuffer);
        localBitWriterBuffer2.writeBits(localEntry.getStartsWithSap(), 1);
        localBitWriterBuffer2.writeBits(localEntry.getSapType(), 3);
        localBitWriterBuffer2.writeBits(localEntry.getSapDeltaTime(), 28);
      }
      IsoTypeWriter.writeUInt64(paramByteBuffer, this.earliestPresentationTime);
      IsoTypeWriter.writeUInt64(paramByteBuffer, this.firstOffset);
    }
  }

  protected long getContentSize()
  {
    long l1 = 4L + (4L + 4L);
    if (getVersion() == 0);
    for (long l2 = 8L; ; l2 = 16L)
      return 2L + (2L + (l1 + l2)) + 12 * this.entries.size();
  }

  public long getEarliestPresentationTime()
  {
    return this.earliestPresentationTime;
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public long getFirstOffset()
  {
    return this.firstOffset;
  }

  public long getReferenceId()
  {
    return this.referenceId;
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public long getTimeScale()
  {
    return this.timeScale;
  }

  public void setEarliestPresentationTime(long paramLong)
  {
    this.earliestPresentationTime = paramLong;
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public void setFirstOffset(long paramLong)
  {
    this.firstOffset = paramLong;
  }

  public void setReferenceId(long paramLong)
  {
    this.referenceId = paramLong;
  }

  public void setReserved(int paramInt)
  {
    this.reserved = paramInt;
  }

  public void setTimeScale(long paramLong)
  {
    this.timeScale = paramLong;
  }

  public String toString()
  {
    return "SegmentIndexBox{entries=" + this.entries + ", referenceId=" + this.referenceId + ", timeScale=" + this.timeScale + ", earliestPresentationTime=" + this.earliestPresentationTime + ", firstOffset=" + this.firstOffset + ", reserved=" + this.reserved + '}';
  }

  public static class Entry
  {
    byte referenceType;
    int referencedSize;
    int sapDeltaTime;
    byte sapType;
    byte startsWithSap;
    long subsegmentDuration;

    public Entry()
    {
    }

    public Entry(int paramInt1, int paramInt2, long paramLong, boolean paramBoolean, int paramInt3, int paramInt4)
    {
      this.referenceType = ((byte)paramInt1);
      this.referencedSize = paramInt2;
      this.subsegmentDuration = paramLong;
      if (paramBoolean);
      for (int i = 1; ; i = 0)
      {
        this.startsWithSap = ((byte)i);
        this.sapType = ((byte)paramInt3);
        this.sapDeltaTime = paramInt4;
        return;
      }
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
        if (this.referenceType != localEntry.referenceType)
          return false;
        if (this.referencedSize != localEntry.referencedSize)
          return false;
        if (this.sapDeltaTime != localEntry.sapDeltaTime)
          return false;
        if (this.sapType != localEntry.sapType)
          return false;
        if (this.startsWithSap != localEntry.startsWithSap)
          return false;
      }
      while (this.subsegmentDuration == localEntry.subsegmentDuration);
      return false;
    }

    public byte getReferenceType()
    {
      return this.referenceType;
    }

    public int getReferencedSize()
    {
      return this.referencedSize;
    }

    public int getSapDeltaTime()
    {
      return this.sapDeltaTime;
    }

    public byte getSapType()
    {
      return this.sapType;
    }

    public byte getStartsWithSap()
    {
      return this.startsWithSap;
    }

    public long getSubsegmentDuration()
    {
      return this.subsegmentDuration;
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (31 * (31 * this.referenceType + this.referencedSize) + (int)(this.subsegmentDuration ^ this.subsegmentDuration >>> 32)) + this.startsWithSap) + this.sapType) + this.sapDeltaTime;
    }

    public void setReferenceType(byte paramByte)
    {
      this.referenceType = paramByte;
    }

    public void setReferencedSize(int paramInt)
    {
      this.referencedSize = paramInt;
    }

    public void setSapDeltaTime(int paramInt)
    {
      this.sapDeltaTime = paramInt;
    }

    public void setSapType(byte paramByte)
    {
      this.sapType = paramByte;
    }

    public void setStartsWithSap(byte paramByte)
    {
      this.startsWithSap = paramByte;
    }

    public void setSubsegmentDuration(long paramLong)
    {
      this.subsegmentDuration = paramLong;
    }

    public String toString()
    {
      return "Entry{referenceType=" + this.referenceType + ", referencedSize=" + this.referencedSize + ", subsegmentDuration=" + this.subsegmentDuration + ", startsWithSap=" + this.startsWithSap + ", sapType=" + this.sapType + ", sapDeltaTime=" + this.sapDeltaTime + '}';
    }
  }
}