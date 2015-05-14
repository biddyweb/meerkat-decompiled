package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.samplegrouping;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class SampleToGroupBox extends AbstractFullBox
{
  public static final String TYPE = "sbgp";
  List<Entry> entries = new LinkedList();
  private String groupingType;
  private String groupingTypeParameter;

  public SampleToGroupBox()
  {
    super("sbgp");
  }

  protected void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.groupingType = IsoTypeReader.read4cc(paramByteBuffer);
    if (getVersion() == 1)
      this.groupingTypeParameter = IsoTypeReader.read4cc(paramByteBuffer);
    long l2;
    for (long l1 = IsoTypeReader.readUInt32(paramByteBuffer); ; l1 = l2)
    {
      l2 = l1 - 1L;
      if (l1 <= 0L)
        break;
      this.entries.add(new Entry(CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer)), CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer))));
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    paramByteBuffer.put(this.groupingType.getBytes());
    if (getVersion() == 1)
      paramByteBuffer.put(this.groupingTypeParameter.getBytes());
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getSampleCount());
      IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getGroupDescriptionIndex());
    }
  }

  protected long getContentSize()
  {
    if (getVersion() == 1)
      return 16 + 8 * this.entries.size();
    return 12 + 8 * this.entries.size();
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public String getGroupingType()
  {
    return this.groupingType;
  }

  public String getGroupingTypeParameter()
  {
    return this.groupingTypeParameter;
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public void setGroupingType(String paramString)
  {
    this.groupingType = paramString;
  }

  public void setGroupingTypeParameter(String paramString)
  {
    this.groupingTypeParameter = paramString;
  }

  public static class Entry
  {
    private int groupDescriptionIndex;
    private long sampleCount;

    public Entry(long paramLong, int paramInt)
    {
      this.sampleCount = paramLong;
      this.groupDescriptionIndex = paramInt;
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
        if (this.groupDescriptionIndex != localEntry.groupDescriptionIndex)
          return false;
      }
      while (this.sampleCount == localEntry.sampleCount);
      return false;
    }

    public int getGroupDescriptionIndex()
    {
      return this.groupDescriptionIndex;
    }

    public long getSampleCount()
    {
      return this.sampleCount;
    }

    public int hashCode()
    {
      return 31 * (int)(this.sampleCount ^ this.sampleCount >>> 32) + this.groupDescriptionIndex;
    }

    public void setGroupDescriptionIndex(int paramInt)
    {
      this.groupDescriptionIndex = paramInt;
    }

    public void setSampleCount(long paramLong)
    {
      this.sampleCount = paramLong;
    }

    public String toString()
    {
      return "Entry{sampleCount=" + this.sampleCount + ", groupDescriptionIndex=" + this.groupDescriptionIndex + '}';
    }
  }
}