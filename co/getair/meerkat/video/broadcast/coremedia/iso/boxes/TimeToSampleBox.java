package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.lang.ref.SoftReference;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

public class TimeToSampleBox extends AbstractFullBox
{
  public static final String TYPE = "stts";
  static Map<List<Entry>, SoftReference<long[]>> cache;
  List<Entry> entries = Collections.emptyList();

  static
  {
    if (!TimeToSampleBox.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      cache = new WeakHashMap();
      return;
    }
  }

  public TimeToSampleBox()
  {
    super("stts");
  }

  public static long[] blowupTimeToSamples(List<Entry> paramList)
  {
    Object localObject2;
    long l;
    try
    {
      SoftReference localSoftReference = (SoftReference)cache.get(paramList);
      if (localSoftReference != null)
      {
        localObject2 = (long[])localSoftReference.get();
        if (localObject2 != null)
          return localObject2;
      }
      l = 0L;
      Iterator localIterator1 = paramList.iterator();
      while (localIterator1.hasNext())
        l += ((Entry)localIterator1.next()).getCount();
      if ((!$assertionsDisabled) && (l > 2147483647L))
        throw new AssertionError();
    }
    finally
    {
    }
    int i = (int)l;
    long[] arrayOfLong = new long[i];
    int j = 0;
    Iterator localIterator2 = paramList.iterator();
    while (true)
    {
      int m;
      if (localIterator2.hasNext())
      {
        Entry localEntry = (Entry)localIterator2.next();
        int k = 0;
        int n;
        for (m = j; k < localEntry.getCount(); m = n)
        {
          n = m + 1;
          arrayOfLong[m] = localEntry.getDelta();
          k++;
        }
      }
      cache.put(paramList, new SoftReference(arrayOfLong));
      localObject2 = arrayOfLong;
      break;
      j = m;
    }
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.entries = new ArrayList(i);
    for (int j = 0; j < i; j++)
      this.entries.add(new Entry(IsoTypeReader.readUInt32(paramByteBuffer), IsoTypeReader.readUInt32(paramByteBuffer)));
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt32(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getCount());
      IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.getDelta());
    }
  }

  protected long getContentSize()
  {
    return 8 + 8 * this.entries.size();
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
    return "TimeToSampleBox[entryCount=" + this.entries.size() + "]";
  }

  public static class Entry
  {
    long count;
    long delta;

    public Entry(long paramLong1, long paramLong2)
    {
      this.count = paramLong1;
      this.delta = paramLong2;
    }

    public long getCount()
    {
      return this.count;
    }

    public long getDelta()
    {
      return this.delta;
    }

    public void setCount(long paramLong)
    {
      this.count = paramLong;
    }

    public void setDelta(long paramLong)
    {
      this.delta = paramLong;
    }

    public String toString()
    {
      return "Entry{count=" + this.count + ", delta=" + this.delta + '}';
    }
  }
}