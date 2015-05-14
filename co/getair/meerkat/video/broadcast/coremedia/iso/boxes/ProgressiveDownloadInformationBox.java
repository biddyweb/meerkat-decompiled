package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class ProgressiveDownloadInformationBox extends AbstractFullBox
{
  public static final String TYPE = "pdin";
  List<Entry> entries = Collections.emptyList();

  public ProgressiveDownloadInformationBox()
  {
    super("pdin");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    this.entries = new LinkedList();
    while (paramByteBuffer.remaining() >= 8)
    {
      Entry localEntry = new Entry(IsoTypeReader.readUInt32(paramByteBuffer), IsoTypeReader.readUInt32(paramByteBuffer));
      this.entries.add(localEntry);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getRate());
      IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getInitialDelay());
    }
  }

  protected long getContentSize()
  {
    return 4 + 8 * this.entries.size();
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
    return "ProgressiveDownloadInfoBox{entries=" + this.entries + '}';
  }

  public static class Entry
  {
    long initialDelay;
    long rate;

    public Entry(long paramLong1, long paramLong2)
    {
      this.rate = paramLong1;
      this.initialDelay = paramLong2;
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
        if (this.initialDelay != localEntry.initialDelay)
          return false;
      }
      while (this.rate == localEntry.rate);
      return false;
    }

    public long getInitialDelay()
    {
      return this.initialDelay;
    }

    public long getRate()
    {
      return this.rate;
    }

    public int hashCode()
    {
      return 31 * (int)(this.rate ^ this.rate >>> 32) + (int)(this.initialDelay ^ this.initialDelay >>> 32);
    }

    public void setInitialDelay(long paramLong)
    {
      this.initialDelay = paramLong;
    }

    public void setRate(long paramLong)
    {
      this.rate = paramLong;
    }

    public String toString()
    {
      return "Entry{rate=" + this.rate + ", initialDelay=" + this.initialDelay + '}';
    }
  }
}