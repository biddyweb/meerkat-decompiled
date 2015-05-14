package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes;

import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitReaderBuffer;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.mp4.objectdescriptors.BitWriterBuffer;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class EC3SpecificBox extends AbstractBox
{
  public static final String TYPE = "dec3";
  int dataRate;
  List<Entry> entries = new LinkedList();
  int numIndSub;

  public EC3SpecificBox()
  {
    super("dec3");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    BitReaderBuffer localBitReaderBuffer = new BitReaderBuffer(paramByteBuffer);
    this.dataRate = localBitReaderBuffer.readBits(13);
    this.numIndSub = (1 + localBitReaderBuffer.readBits(3));
    int i = 0;
    if (i < this.numIndSub)
    {
      Entry localEntry = new Entry();
      localEntry.fscod = localBitReaderBuffer.readBits(2);
      localEntry.bsid = localBitReaderBuffer.readBits(5);
      localEntry.bsmod = localBitReaderBuffer.readBits(5);
      localEntry.acmod = localBitReaderBuffer.readBits(3);
      localEntry.lfeon = localBitReaderBuffer.readBits(1);
      localEntry.reserved = localBitReaderBuffer.readBits(3);
      localEntry.num_dep_sub = localBitReaderBuffer.readBits(4);
      if (localEntry.num_dep_sub > 0)
        localEntry.chan_loc = localBitReaderBuffer.readBits(9);
      while (true)
      {
        this.entries.add(localEntry);
        i++;
        break;
        localEntry.reserved2 = localBitReaderBuffer.readBits(1);
      }
    }
  }

  public void addEntry(Entry paramEntry)
  {
    this.entries.add(paramEntry);
  }

  public void getContent(ByteBuffer paramByteBuffer)
  {
    BitWriterBuffer localBitWriterBuffer = new BitWriterBuffer(paramByteBuffer);
    localBitWriterBuffer.writeBits(this.dataRate, 13);
    localBitWriterBuffer.writeBits(-1 + this.entries.size(), 3);
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      localBitWriterBuffer.writeBits(localEntry.fscod, 2);
      localBitWriterBuffer.writeBits(localEntry.bsid, 5);
      localBitWriterBuffer.writeBits(localEntry.bsmod, 5);
      localBitWriterBuffer.writeBits(localEntry.acmod, 3);
      localBitWriterBuffer.writeBits(localEntry.lfeon, 1);
      localBitWriterBuffer.writeBits(localEntry.reserved, 3);
      localBitWriterBuffer.writeBits(localEntry.num_dep_sub, 4);
      if (localEntry.num_dep_sub > 0)
        localBitWriterBuffer.writeBits(localEntry.chan_loc, 9);
      else
        localBitWriterBuffer.writeBits(localEntry.reserved2, 1);
    }
  }

  public long getContentSize()
  {
    long l = 2L;
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
      if (((Entry)localIterator.next()).num_dep_sub > 0)
        l += 4L;
      else
        l += 3L;
    return l;
  }

  public int getDataRate()
  {
    return this.dataRate;
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public int getNumIndSub()
  {
    return this.numIndSub;
  }

  public void setDataRate(int paramInt)
  {
    this.dataRate = paramInt;
  }

  public void setEntries(List<Entry> paramList)
  {
    this.entries = paramList;
  }

  public void setNumIndSub(int paramInt)
  {
    this.numIndSub = paramInt;
  }

  public static class Entry
  {
    public int acmod;
    public int bsid;
    public int bsmod;
    public int chan_loc;
    public int fscod;
    public int lfeon;
    public int num_dep_sub;
    public int reserved;
    public int reserved2;

    public String toString()
    {
      return "Entry{fscod=" + this.fscod + ", bsid=" + this.bsid + ", bsmod=" + this.bsmod + ", acmod=" + this.acmod + ", lfeon=" + this.lfeon + ", reserved=" + this.reserved + ", num_dep_sub=" + this.num_dep_sub + ", chan_loc=" + this.chan_loc + ", reserved2=" + this.reserved2 + '}';
    }
  }
}