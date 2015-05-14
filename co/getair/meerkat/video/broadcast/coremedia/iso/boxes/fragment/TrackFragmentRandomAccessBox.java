package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReaderVariable;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriterVariable;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class TrackFragmentRandomAccessBox extends AbstractFullBox
{
  public static final String TYPE = "tfra";
  private List<Entry> entries = Collections.emptyList();
  private int lengthSizeOfSampleNum = 2;
  private int lengthSizeOfTrafNum = 2;
  private int lengthSizeOfTrunNum = 2;
  private int reserved;
  private long trackId;

  public TrackFragmentRandomAccessBox()
  {
    super("tfra");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.trackId = IsoTypeReader.readUInt32(paramByteBuffer);
    long l1 = IsoTypeReader.readUInt32(paramByteBuffer);
    this.reserved = ((int)(l1 >> 6));
    this.lengthSizeOfTrafNum = (1 + ((int)(0x3F & l1) >> 4));
    this.lengthSizeOfTrunNum = (1 + ((int)(0xC & l1) >> 2));
    this.lengthSizeOfSampleNum = (1 + (int)(0x3 & l1));
    long l2 = IsoTypeReader.readUInt32(paramByteBuffer);
    this.entries = new ArrayList();
    int i = 0;
    if (i < l2)
    {
      Entry localEntry = new Entry();
      if (getVersion() == 1)
      {
        Entry.access$002(localEntry, IsoTypeReader.readUInt64(paramByteBuffer));
        Entry.access$102(localEntry, IsoTypeReader.readUInt64(paramByteBuffer));
      }
      while (true)
      {
        Entry.access$202(localEntry, IsoTypeReaderVariable.read(paramByteBuffer, this.lengthSizeOfTrafNum));
        Entry.access$302(localEntry, IsoTypeReaderVariable.read(paramByteBuffer, this.lengthSizeOfTrunNum));
        Entry.access$402(localEntry, IsoTypeReaderVariable.read(paramByteBuffer, this.lengthSizeOfSampleNum));
        this.entries.add(localEntry);
        i++;
        break;
        Entry.access$002(localEntry, IsoTypeReader.readUInt32(paramByteBuffer));
        Entry.access$102(localEntry, IsoTypeReader.readUInt32(paramByteBuffer));
      }
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.trackId);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.reserved << 6 | (0x3 & -1 + this.lengthSizeOfTrafNum) << 4 | (0x3 & -1 + this.lengthSizeOfTrunNum) << 2 | 0x3 & -1 + this.lengthSizeOfSampleNum);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    if (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      if (getVersion() == 1)
      {
        IsoTypeWriter.writeUInt64(paramByteBuffer, localEntry.time);
        IsoTypeWriter.writeUInt64(paramByteBuffer, localEntry.moofOffset);
      }
      while (true)
      {
        IsoTypeWriterVariable.write(localEntry.trafNumber, paramByteBuffer, this.lengthSizeOfTrafNum);
        IsoTypeWriterVariable.write(localEntry.trunNumber, paramByteBuffer, this.lengthSizeOfTrunNum);
        IsoTypeWriterVariable.write(localEntry.sampleNumber, paramByteBuffer, this.lengthSizeOfSampleNum);
        break;
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.time);
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.moofOffset);
      }
    }
  }

  protected long getContentSize()
  {
    long l1 = 4L + 12L;
    if (getVersion() == 1);
    for (long l2 = l1 + 16 * this.entries.size(); ; l2 = l1 + 8 * this.entries.size())
      return l2 + this.lengthSizeOfTrafNum * this.entries.size() + this.lengthSizeOfTrunNum * this.entries.size() + this.lengthSizeOfSampleNum * this.entries.size();
  }

  public List<Entry> getEntries()
  {
    return Collections.unmodifiableList(this.entries);
  }

  public int getLengthSizeOfSampleNum()
  {
    return this.lengthSizeOfSampleNum;
  }

  public int getLengthSizeOfTrafNum()
  {
    return this.lengthSizeOfTrafNum;
  }

  public int getLengthSizeOfTrunNum()
  {
    return this.lengthSizeOfTrunNum;
  }

  public long getNumberOfEntries()
  {
    return this.entries.size();
  }

  public int getReserved()
  {
    return this.reserved;
  }

  public long getTrackId()
  {
    return this.trackId;
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public void setLengthSizeOfSampleNum(int paramInt)
  {
    this.lengthSizeOfSampleNum = paramInt;
  }

  public void setLengthSizeOfTrafNum(int paramInt)
  {
    this.lengthSizeOfTrafNum = paramInt;
  }

  public void setLengthSizeOfTrunNum(int paramInt)
  {
    this.lengthSizeOfTrunNum = paramInt;
  }

  public void setTrackId(long paramLong)
  {
    this.trackId = paramLong;
  }

  public String toString()
  {
    return "TrackFragmentRandomAccessBox{trackId=" + this.trackId + ", entries=" + this.entries + '}';
  }

  public static class Entry
  {
    private long moofOffset;
    private long sampleNumber;
    private long time;
    private long trafNumber;
    private long trunNumber;

    public Entry()
    {
    }

    public Entry(long paramLong1, long paramLong2, long paramLong3, long paramLong4, long paramLong5)
    {
      this.moofOffset = paramLong2;
      this.sampleNumber = paramLong5;
      this.time = paramLong1;
      this.trafNumber = paramLong3;
      this.trunNumber = paramLong4;
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
        if (this.moofOffset != localEntry.moofOffset)
          return false;
        if (this.sampleNumber != localEntry.sampleNumber)
          return false;
        if (this.time != localEntry.time)
          return false;
        if (this.trafNumber != localEntry.trafNumber)
          return false;
      }
      while (this.trunNumber == localEntry.trunNumber);
      return false;
    }

    public long getMoofOffset()
    {
      return this.moofOffset;
    }

    public long getSampleNumber()
    {
      return this.sampleNumber;
    }

    public long getTime()
    {
      return this.time;
    }

    public long getTrafNumber()
    {
      return this.trafNumber;
    }

    public long getTrunNumber()
    {
      return this.trunNumber;
    }

    public int hashCode()
    {
      return 31 * (31 * (31 * (31 * (int)(this.time ^ this.time >>> 32) + (int)(this.moofOffset ^ this.moofOffset >>> 32)) + (int)(this.trafNumber ^ this.trafNumber >>> 32)) + (int)(this.trunNumber ^ this.trunNumber >>> 32)) + (int)(this.sampleNumber ^ this.sampleNumber >>> 32);
    }

    public void setMoofOffset(long paramLong)
    {
      this.moofOffset = paramLong;
    }

    public void setSampleNumber(long paramLong)
    {
      this.sampleNumber = paramLong;
    }

    public void setTime(long paramLong)
    {
      this.time = paramLong;
    }

    public void setTrafNumber(long paramLong)
    {
      this.trafNumber = paramLong;
    }

    public void setTrunNumber(long paramLong)
    {
      this.trunNumber = paramLong;
    }

    public String toString()
    {
      return "Entry{time=" + this.time + ", moofOffset=" + this.moofOffset + ", trafNumber=" + this.trafNumber + ", trunNumber=" + this.trunNumber + ", sampleNumber=" + this.sampleNumber + '}';
    }
  }
}