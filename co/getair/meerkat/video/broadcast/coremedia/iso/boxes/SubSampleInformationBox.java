package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class SubSampleInformationBox extends AbstractFullBox
{
  public static final String TYPE = "subs";
  private List<SubSampleEntry> entries = new ArrayList();

  public SubSampleInformationBox()
  {
    super("subs");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    long l1 = IsoTypeReader.readUInt32(paramByteBuffer);
    for (int i = 0; i < l1; i++)
    {
      SubSampleEntry localSubSampleEntry = new SubSampleEntry();
      localSubSampleEntry.setSampleDelta(IsoTypeReader.readUInt32(paramByteBuffer));
      int j = IsoTypeReader.readUInt16(paramByteBuffer);
      int k = 0;
      if (k < j)
      {
        SubSampleInformationBox.SubSampleEntry.SubsampleEntry localSubsampleEntry = new SubSampleInformationBox.SubSampleEntry.SubsampleEntry();
        if (getVersion() == 1);
        for (long l2 = IsoTypeReader.readUInt32(paramByteBuffer); ; l2 = IsoTypeReader.readUInt16(paramByteBuffer))
        {
          localSubsampleEntry.setSubsampleSize(l2);
          localSubsampleEntry.setSubsamplePriority(IsoTypeReader.readUInt8(paramByteBuffer));
          localSubsampleEntry.setDiscardable(IsoTypeReader.readUInt8(paramByteBuffer));
          localSubsampleEntry.setReserved(IsoTypeReader.readUInt32(paramByteBuffer));
          localSubSampleEntry.getSubsampleEntries().add(localSubsampleEntry);
          k++;
          break;
        }
      }
      this.entries.add(localSubSampleEntry);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    Iterator localIterator1 = this.entries.iterator();
    if (localIterator1.hasNext())
    {
      SubSampleEntry localSubSampleEntry = (SubSampleEntry)localIterator1.next();
      IsoTypeWriter.writeUInt32(paramByteBuffer, localSubSampleEntry.getSampleDelta());
      IsoTypeWriter.writeUInt16(paramByteBuffer, localSubSampleEntry.getSubsampleCount());
      Iterator localIterator2 = localSubSampleEntry.getSubsampleEntries().iterator();
      label75: SubSampleInformationBox.SubSampleEntry.SubsampleEntry localSubsampleEntry;
      if (localIterator2.hasNext())
      {
        localSubsampleEntry = (SubSampleInformationBox.SubSampleEntry.SubsampleEntry)localIterator2.next();
        if (getVersion() != 1)
          break label144;
        IsoTypeWriter.writeUInt32(paramByteBuffer, localSubsampleEntry.getSubsampleSize());
      }
      while (true)
      {
        IsoTypeWriter.writeUInt8(paramByteBuffer, localSubsampleEntry.getSubsamplePriority());
        IsoTypeWriter.writeUInt8(paramByteBuffer, localSubsampleEntry.getDiscardable());
        IsoTypeWriter.writeUInt32(paramByteBuffer, localSubsampleEntry.getReserved());
        break label75;
        break;
        label144: IsoTypeWriter.writeUInt16(paramByteBuffer, CastUtils.l2i(localSubsampleEntry.getSubsampleSize()));
      }
    }
  }

  protected long getContentSize()
  {
    long l1 = 8L;
    Iterator localIterator = this.entries.iterator();
    if (localIterator.hasNext())
    {
      SubSampleEntry localSubSampleEntry = (SubSampleEntry)localIterator.next();
      l1 = 2L + (l1 + 4L);
      int i = 0;
      label47: if (i < localSubSampleEntry.getSubsampleEntries().size())
        if (getVersion() != 1)
          break label94;
      label94: for (long l2 = l1 + 4L; ; l2 = l1 + 2L)
      {
        l1 = 4L + (l2 + 2L);
        i++;
        break label47;
        break;
      }
    }
    return l1;
  }

  public List<SubSampleEntry> getEntries()
  {
    return this.entries;
  }

  public void setEntries(List<SubSampleEntry> paramList)
  {
    this.entries = paramList;
  }

  public String toString()
  {
    return "SubSampleInformationBox{entryCount=" + this.entries.size() + ", entries=" + this.entries + '}';
  }

  public static class SubSampleEntry
  {
    private long sampleDelta;
    private List<SubsampleEntry> subsampleEntries = new ArrayList();

    public long getSampleDelta()
    {
      return this.sampleDelta;
    }

    public int getSubsampleCount()
    {
      return this.subsampleEntries.size();
    }

    public List<SubsampleEntry> getSubsampleEntries()
    {
      return this.subsampleEntries;
    }

    public void setSampleDelta(long paramLong)
    {
      this.sampleDelta = paramLong;
    }

    public String toString()
    {
      return "SampleEntry{sampleDelta=" + this.sampleDelta + ", subsampleCount=" + this.subsampleEntries.size() + ", subsampleEntries=" + this.subsampleEntries + '}';
    }

    public static class SubsampleEntry
    {
      private int discardable;
      private long reserved;
      private int subsamplePriority;
      private long subsampleSize;

      public int getDiscardable()
      {
        return this.discardable;
      }

      public long getReserved()
      {
        return this.reserved;
      }

      public int getSubsamplePriority()
      {
        return this.subsamplePriority;
      }

      public long getSubsampleSize()
      {
        return this.subsampleSize;
      }

      public void setDiscardable(int paramInt)
      {
        this.discardable = paramInt;
      }

      public void setReserved(long paramLong)
      {
        this.reserved = paramLong;
      }

      public void setSubsamplePriority(int paramInt)
      {
        this.subsamplePriority = paramInt;
      }

      public void setSubsampleSize(long paramLong)
      {
        this.subsampleSize = paramLong;
      }

      public String toString()
      {
        return "SubsampleEntry{subsampleSize=" + this.subsampleSize + ", subsamplePriority=" + this.subsamplePriority + ", discardable=" + this.discardable + ", reserved=" + this.reserved + '}';
      }
    }
  }
}