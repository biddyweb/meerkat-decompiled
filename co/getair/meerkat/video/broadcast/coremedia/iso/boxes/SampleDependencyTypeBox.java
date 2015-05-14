package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SampleDependencyTypeBox extends AbstractFullBox
{
  public static final String TYPE = "sdtp";
  private List<Entry> entries = new ArrayList();

  public SampleDependencyTypeBox()
  {
    super("sdtp");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    while (paramByteBuffer.remaining() > 0)
      this.entries.add(new Entry(IsoTypeReader.readUInt8(paramByteBuffer)));
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
      IsoTypeWriter.writeUInt8(paramByteBuffer, ((Entry)localIterator.next()).value);
  }

  protected long getContentSize()
  {
    return 4 + this.entries.size();
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("SampleDependencyTypeBox");
    localStringBuilder.append("{entries=").append(this.entries);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }

  public static class Entry
  {
    private int value;

    public Entry(int paramInt)
    {
      this.value = paramInt;
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
      }
      while (this.value == localEntry.value);
      return false;
    }

    public int getReserved()
    {
      return 0x3 & this.value >> 6;
    }

    public int getSampleDependsOn()
    {
      return 0x3 & this.value >> 4;
    }

    public int getSampleHasRedundancy()
    {
      return 0x3 & this.value;
    }

    public int getSampleIsDependentOn()
    {
      return 0x3 & this.value >> 2;
    }

    public int hashCode()
    {
      return this.value;
    }

    public void setReserved(int paramInt)
    {
      this.value = ((paramInt & 0x3) << 6 | 0x3F & this.value);
    }

    public void setSampleDependsOn(int paramInt)
    {
      this.value = ((paramInt & 0x3) << 4 | 0xCF & this.value);
    }

    public void setSampleHasRedundancy(int paramInt)
    {
      this.value = (paramInt & 0x3 | 0xFC & this.value);
    }

    public void setSampleIsDependentOn(int paramInt)
    {
      this.value = ((paramInt & 0x3) << 2 | 0xF3 & this.value);
    }

    public String toString()
    {
      return "Entry{reserved=" + getReserved() + ", sampleDependsOn=" + getSampleDependsOn() + ", sampleIsDependentOn=" + getSampleIsDependentOn() + ", sampleHasRedundancy=" + getSampleHasRedundancy() + '}';
    }
  }
}