package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.piff;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TfrfBox extends AbstractFullBox
{
  public List<Entry> entries = new ArrayList();

  public TfrfBox()
  {
    super("uuid");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    parseVersionAndFlags(paramByteBuffer);
    int i = IsoTypeReader.readUInt8(paramByteBuffer);
    int j = 0;
    if (j < i)
    {
      Entry localEntry = new Entry();
      if (getVersion() == 1)
        localEntry.fragmentAbsoluteTime = IsoTypeReader.readUInt64(paramByteBuffer);
      for (localEntry.fragmentAbsoluteDuration = IsoTypeReader.readUInt64(paramByteBuffer); ; localEntry.fragmentAbsoluteDuration = IsoTypeReader.readUInt32(paramByteBuffer))
      {
        this.entries.add(localEntry);
        j++;
        break;
        localEntry.fragmentAbsoluteTime = IsoTypeReader.readUInt32(paramByteBuffer);
      }
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    writeVersionAndFlags(paramByteBuffer);
    IsoTypeWriter.writeUInt8(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
    {
      Entry localEntry = (Entry)localIterator.next();
      if (getVersion() == 1)
      {
        IsoTypeWriter.writeUInt64(paramByteBuffer, localEntry.fragmentAbsoluteTime);
        IsoTypeWriter.writeUInt64(paramByteBuffer, localEntry.fragmentAbsoluteDuration);
      }
      else
      {
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.fragmentAbsoluteTime);
        IsoTypeWriter.writeUInt32(paramByteBuffer, localEntry.fragmentAbsoluteDuration);
      }
    }
  }

  protected long getContentSize()
  {
    int i = this.entries.size();
    if (getVersion() == 1);
    for (int j = 16; ; j = 8)
      return 5 + j * i;
  }

  public List<Entry> getEntries()
  {
    return this.entries;
  }

  public long getFragmentCount()
  {
    return this.entries.size();
  }

  public byte[] getUserType()
  {
    return new byte[] { -44, -128, 126, -14, -54, 57, 70, -107, -114, 84, 38, -53, -98, 70, -89, -97 };
  }

  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("TfrfBox");
    localStringBuilder.append("{entries=").append(this.entries);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }

  public class Entry
  {
    long fragmentAbsoluteDuration;
    long fragmentAbsoluteTime;

    public Entry()
    {
    }

    public long getFragmentAbsoluteDuration()
    {
      return this.fragmentAbsoluteDuration;
    }

    public long getFragmentAbsoluteTime()
    {
      return this.fragmentAbsoluteTime;
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("Entry");
      localStringBuilder.append("{fragmentAbsoluteTime=").append(this.fragmentAbsoluteTime);
      localStringBuilder.append(", fragmentAbsoluteDuration=").append(this.fragmentAbsoluteDuration);
      localStringBuilder.append('}');
      return localStringBuilder.toString();
    }
  }
}