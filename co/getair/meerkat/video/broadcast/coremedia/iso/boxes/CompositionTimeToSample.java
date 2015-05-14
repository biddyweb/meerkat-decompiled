package co.getair.meerkat.video.broadcast.coremedia.iso.boxes;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.util.CastUtils;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

public class CompositionTimeToSample extends AbstractFullBox
{
  public static final String TYPE = "ctts";
  List<Entry> entries = Collections.emptyList();

  static
  {
    if (!CompositionTimeToSample.class.desiredAssertionStatus());
    for (boolean bool = true; ; bool = false)
    {
      $assertionsDisabled = bool;
      return;
    }
  }

  public CompositionTimeToSample()
  {
    super("ctts");
  }

  public static int[] blowupCompositionTimes(List<Entry> paramList)
  {
    long l = 0L;
    Iterator localIterator1 = paramList.iterator();
    while (localIterator1.hasNext())
      l += ((Entry)localIterator1.next()).getCount();
    assert (l <= 2147483647L);
    int[] arrayOfInt = new int[(int)l];
    int i = 0;
    Iterator localIterator2 = paramList.iterator();
    while (localIterator2.hasNext())
    {
      Entry localEntry = (Entry)localIterator2.next();
      int j = 0;
      while (j < localEntry.getCount())
      {
        int k = i + 1;
        arrayOfInt[i] = localEntry.getOffset();
        j++;
        i = k;
      }
    }
    return arrayOfInt;
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer));
    this.entries = new ArrayList(i);
    for (int j = 0; j < i; j++)
    {
      Entry localEntry = new Entry(CastUtils.l2i(IsoTypeReader.readUInt32(paramByteBuffer)), paramByteBuffer.getInt());
      this.entries.add(localEntry);
    }
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
      paramByteBuffer.putInt(localEntry.getOffset());
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

  public static class Entry
  {
    int count;
    int offset;

    public Entry(int paramInt1, int paramInt2)
    {
      this.count = paramInt1;
      this.offset = paramInt2;
    }

    public int getCount()
    {
      return this.count;
    }

    public int getOffset()
    {
      return this.offset;
    }

    public void setCount(int paramInt)
    {
      this.count = paramInt;
    }

    public void setOffset(int paramInt)
    {
      this.offset = paramInt;
    }

    public String toString()
    {
      return "Entry{count=" + this.count + ", offset=" + this.offset + '}';
    }
  }
}