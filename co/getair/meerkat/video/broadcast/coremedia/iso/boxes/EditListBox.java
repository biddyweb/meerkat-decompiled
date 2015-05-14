package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class EditListBox extends AbstractFullBox
{
  public static final String TYPE = "elst";
  private List<Entry> entries = new LinkedList();

  public EditListBox()
  {
    super("elst");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.entries = new LinkedList();
    for (int j = 0; j < i; j++)
      this.entries.add(new Entry(this, paramByteBuffer));
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
      ((Entry)localIterator.next()).getContent(paramByteBuffer);
  }

  protected long getContentSize()
  {
    if (getVersion() == 1)
      return 8L + 20 * this.entries.size();
    return 8L + 12 * this.entries.size();
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
    return "EditListBox{entries=" + this.entries + '}';
  }

  public static class Entry
  {
    EditListBox editListBox;
    private double mediaRate;
    private long mediaTime;
    private long segmentDuration;

    public Entry(EditListBox paramEditListBox, long paramLong1, long paramLong2, double paramDouble)
    {
      this.segmentDuration = paramLong1;
      this.mediaTime = paramLong2;
      this.mediaRate = paramDouble;
      this.editListBox = paramEditListBox;
    }

    public Entry(EditListBox paramEditListBox, ByteBuffer paramByteBuffer)
    {
      if (paramEditListBox.getVersion() == 1)
      {
        this.segmentDuration = IsoTypeReader.readUInt64(paramByteBuffer);
        this.mediaTime = paramByteBuffer.getLong();
      }
      for (this.mediaRate = IsoTypeReader.readFixedPoint1616(paramByteBuffer); ; this.mediaRate = IsoTypeReader.readFixedPoint1616(paramByteBuffer))
      {
        this.editListBox = paramEditListBox;
        return;
        this.segmentDuration = IsoTypeReader.readUInt32(paramByteBuffer);
        this.mediaTime = paramByteBuffer.getInt();
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
        if (this.mediaTime != localEntry.mediaTime)
          return false;
      }
      while (this.segmentDuration == localEntry.segmentDuration);
      return false;
    }

    public void getContent(ByteBuffer paramByteBuffer)
    {
      if (this.editListBox.getVersion() == 1)
      {
        IsoTypeWriter.writeUInt64(paramByteBuffer, this.segmentDuration);
        paramByteBuffer.putLong(this.mediaTime);
      }
      while (true)
      {
        IsoTypeWriter.writeFixedPoint1616(paramByteBuffer, this.mediaRate);
        return;
        IsoTypeWriter.writeUInt32(paramByteBuffer, CastUtils.l2i(this.segmentDuration));
        paramByteBuffer.putInt(CastUtils.l2i(this.mediaTime));
      }
    }

    public double getMediaRate()
    {
      return this.mediaRate;
    }

    public long getMediaTime()
    {
      return this.mediaTime;
    }

    public long getSegmentDuration()
    {
      return this.segmentDuration;
    }

    public int hashCode()
    {
      return 31 * (int)(this.segmentDuration ^ this.segmentDuration >>> 32) + (int)(this.mediaTime ^ this.mediaTime >>> 32);
    }

    public void setMediaRate(double paramDouble)
    {
      this.mediaRate = paramDouble;
    }

    public void setMediaTime(long paramLong)
    {
      this.mediaTime = paramLong;
    }

    public void setSegmentDuration(long paramLong)
    {
      this.segmentDuration = paramLong;
    }

    public String toString()
    {
      return "Entry{segmentDuration=" + this.segmentDuration + ", mediaTime=" + this.mediaTime + ", mediaRate=" + this.mediaRate + '}';
    }
  }
}