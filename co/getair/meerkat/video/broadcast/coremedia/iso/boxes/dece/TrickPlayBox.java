package co.getair.meerkat.video.broadcast.coremedia.iso.boxes.dece;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractFullBox;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TrickPlayBox extends AbstractFullBox
{
  public static final String TYPE = "trik";
  private List<Entry> entries = new ArrayList();

  public TrickPlayBox()
  {
    super("trik");
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
    localStringBuilder.append("TrickPlayBox");
    localStringBuilder.append("{entries=").append(this.entries);
    localStringBuilder.append('}');
    return localStringBuilder.toString();
  }

  public static class Entry
  {
    private int value;

    public Entry()
    {
    }

    public Entry(int paramInt)
    {
      this.value = paramInt;
    }

    public int getDependencyLevel()
    {
      return 0x3F & this.value;
    }

    public int getPicType()
    {
      return 0x3 & this.value >> 6;
    }

    public void setDependencyLevel(int paramInt)
    {
      this.value = (paramInt & 0x3F | this.value);
    }

    public void setPicType(int paramInt)
    {
      this.value = (0x1F & this.value);
      this.value = ((paramInt & 0x3) << 6 | this.value);
    }

    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder();
      localStringBuilder.append("Entry");
      localStringBuilder.append("{picType=").append(getPicType());
      localStringBuilder.append(",dependencyLevel=").append(getDependencyLevel());
      localStringBuilder.append('}');
      return localStringBuilder.toString();
    }
  }
}