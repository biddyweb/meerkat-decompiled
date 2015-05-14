package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.fragment;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TrackRunBox extends AbstractFullBox
{
  public static final String TYPE = "trun";
  private int dataOffset;
  private List<Entry> entries = new ArrayList();
  private SampleFlags firstSampleFlags;

  public TrackRunBox()
  {
    super("trun");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    long l = IsoTypeReader.readUInt32(paramByteBuffer);
    if ((0x1 & getFlags()) == 1);
    for (this.dataOffset = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer)); ; this.dataOffset = -1)
    {
      if ((0x4 & getFlags()) == 4)
        this.firstSampleFlags = new SampleFlags(paramByteBuffer);
      for (int i = 0; i < l; i++)
      {
        Entry localEntry = new Entry();
        if ((0x100 & getFlags()) == 256)
          Entry.access$002(localEntry, IsoTypeReader.readUInt32(paramByteBuffer));
        if ((0x200 & getFlags()) == 512)
          Entry.access$102(localEntry, IsoTypeReader.readUInt32(paramByteBuffer));
        if ((0x400 & getFlags()) == 1024)
          Entry.access$202(localEntry, new SampleFlags(paramByteBuffer));
        if ((0x800 & getFlags()) == 2048)
          Entry.access$302(localEntry, paramByteBuffer.getInt());
        this.entries.add(localEntry);
      }
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    int i = getFlags();
    if ((i & 0x1) == 1)
      IsoTypeWriter.writeUInt32(paramByteBuffer, this.dataOffset);
    if ((i & 0x4) == 4)
      this.firstSampleFlags.getContent(paramByteBuffer);
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      if ((i & 0x100) == 256)
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.sampleDuration);
      if ((i & 0x200) == 512)
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.sampleSize);
      if ((i & 0x400) == 1024)
        localEntry.sampleFlags.getContent(paramByteBuffer);
      if ((i & 0x800) == 2048)
        if (getVersion() == 0)
          IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.sampleCompositionTimeOffset);
        else
          paramByteBuffer.putInt((int)localEntry.sampleCompositionTimeOffset);
    }
  }

  protected long getContentSize()
  {
    long l1 = 8L;
    int i = getFlags();
    if ((i & 0x1) == 1)
      l1 += 4L;
    if ((i & 0x4) == 4)
      l1 += 4L;
    long l2 = 0L;
    if ((i & 0x100) == 256)
      l2 += 4L;
    if ((i & 0x200) == 512)
      l2 += 4L;
    if ((i & 0x400) == 1024)
      l2 += 4L;
    if ((i & 0x800) == 2048)
      l2 += 4L;
    return l1 + l2 * this.entries.size();
  }

  public int getDataOffset()
  {
    return this.dataOffset;
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public SampleFlags getFirstSampleFlags()
  {
    return this.firstSampleFlags;
  }

  public long[] getSampleCompositionTimeOffsets()
  {
    if (isSampleCompositionTimeOffsetPresent())
    {
      arrayOfLong = new long[this.entries.size()];
      for (int i = 0; i < arrayOfLong.length; i++)
        arrayOfLong[i] = ((Entry)this.entries.get(i)).getSampleCompositionTimeOffset();
    }
    long[] arrayOfLong = null;
    return arrayOfLong;
  }

  public long getSampleCount()
  {
    return this.entries.size();
  }

  public boolean isDataOffsetPresent()
  {
    return (0x1 & getFlags()) == 1;
  }

  public boolean isFirstSampleFlagsPresent()
  {
    return (0x4 & getFlags()) == 4;
  }

  public boolean isSampleCompositionTimeOffsetPresent()
  {
    return (0x800 & getFlags()) == 2048;
  }

  public boolean isSampleDurationPresent()
  {
    return (0x100 & getFlags()) == 256;
  }

  public boolean isSampleFlagsPresent()
  {
    return (0x400 & getFlags()) == 1024;
  }

  public boolean isSampleSizePresent()
  {
    return (0x200 & getFlags()) == 512;
  }

  public void setDataOffset(int paramInt)
  {
    if (paramInt == -1)
      setFlags(0xFFFFFE & getFlags());
    while (true)
    {
      this.dataOffset = paramInt;
      return;
      setFlags(0x1 | getFlags());
    }
  }

  public void setDataOffsetPresent(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x1 | getFlags());
      return;
    }
    setFlags(0xFFFFFE & getFlags());
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public void setFirstSampleFlags(SampleFlags paramSampleFlags)
  {
    if (paramSampleFlags == null)
      setFlags(0xFFFFFB & getFlags());
    while (true)
    {
      this.firstSampleFlags = paramSampleFlags;
      return;
      setFlags(0x4 | getFlags());
    }
  }

  public void setSampleCompositionTimeOffsetPresent(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x800 | getFlags());
      return;
    }
    setFlags(0xFFF7FF & getFlags());
  }

  public void setSampleDurationPresent(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x100 | getFlags());
      return;
    }
    setFlags(0xFFFEFF & getFlags());
  }

  public void setSampleFlagsPresent(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x400 | getFlags());
      return;
    }
    setFlags(0xFFFBFF & getFlags());
  }

  public void setSampleSizePresent(boolean paramBoolean)
  {
    if (paramBoolean)
    {
      setFlags(0x200 | getFlags());
      return;
    }
    setFlags(0xFFFDFF & getFlags());
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("TrackRunBox");
    localStringBuilder.append("{sampleCount=").append(this.entries.size());
    localStringBuilder.append(", dataOffset=").append(this.dataOffset);
    localStringBuilder.append(", dataOffsetPresent=").append(isDataOffsetPresent());
    localStringBuilder.append(", sampleSizePresent=").append(isSampleSizePresent());
    localStringBuilder.append(", sampleDurationPresent=").append(isSampleDurationPresent());
    localStringBuilder.append(", sampleFlagsPresentPresent=").append(isSampleFlagsPresent());
    localStringBuilder.append(", sampleCompositionTimeOffsetPresent=").append(isSampleCompositionTimeOffsetPresent());
    localStringBuilder.append(", firstSampleFlags=").append(this.firstSampleFlags);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }

  public static class Entry
  {
    private long sampleCompositionTimeOffset;
    private long sampleDuration;
    private SampleFlags sampleFlags;
    private long sampleSize;

    public Entry()
    {
    }

    public Entry(long paramLong1, long paramLong2, SampleFlags paramSampleFlags, int paramInt)
    {
      this.sampleDuration = paramLong1;
      this.sampleSize = paramLong2;
      this.sampleFlags = paramSampleFlags;
      this.sampleCompositionTimeOffset = paramInt;
    }

    public long getSampleCompositionTimeOffset()
    {
      return this.sampleCompositionTimeOffset;
    }

    public long getSampleDuration()
    {
      return this.sampleDuration;
    }

    public SampleFlags getSampleFlags()
    {
      return this.sampleFlags;
    }

    public long getSampleSize()
    {
      return this.sampleSize;
    }

    public void setSampleCompositionTimeOffset(int paramInt)
    {
      this.sampleCompositionTimeOffset = paramInt;
    }

    public void setSampleDuration(long paramLong)
    {
      this.sampleDuration = paramLong;
    }

    public void setSampleFlags(SampleFlags paramSampleFlags)
    {
      this.sampleFlags = paramSampleFlags;
    }

    public void setSampleSize(long paramLong)
    {
      this.sampleSize = paramLong;
    }

    public String toString()
    {
      return "Entry{duration=" + this.sampleDuration + ", size=" + this.sampleSize + ", dlags=" + this.sampleFlags + ", compTimeOffset=" + this.sampleCompositionTimeOffset + '}';
    }
  }
}