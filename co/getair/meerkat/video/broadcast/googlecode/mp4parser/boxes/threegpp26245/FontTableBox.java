package co.getair.meerkat.video.broadcast.googlecode.mp4parser.boxes.threegpp26245;

import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeReader;
import co.getair.meerkat.video.broadcast.coremedia.iso.IsoTypeWriter;
import co.getair.meerkat.video.broadcast.coremedia.iso.Utf8;
import co.getair.meerkat.video.broadcast.googlecode.mp4parser.AbstractBox;
import java.nio.ByteBuffer;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class FontTableBox extends AbstractBox
{
  public static final String TYPE = "ftab";
  List<FontRecord> entries = new LinkedList();

  public FontTableBox()
  {
    super("ftab");
  }

  public void _parseDetails(ByteBuffer paramByteBuffer)
  {
    int i = IsoTypeReader.readUInt16(paramByteBuffer);
    for (int j = 0; j < i; j++)
    {
      FontRecord localFontRecord = new FontRecord();
      localFontRecord.parse(paramByteBuffer);
      this.entries.add(localFontRecord);
    }
  }

  protected void getContent(ByteBuffer paramByteBuffer)
  {
    IsoTypeWriter.writeUInt16(paramByteBuffer, this.entries.size());
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
      ((FontRecord)localIterator.next()).getContent(paramByteBuffer);
  }

  protected long getContentSize()
  {
    int i = 2;
    Iterator localIterator = this.entries.iterator();
    while (localIterator.hasNext())
      i += ((FontRecord)localIterator.next()).getSize();
    return i;
  }

  public List<FontRecord> getEntries()
  {
    return this.entries;
  }

  public void setEntries(List<FontRecord> paramList)
  {
    this.entries = paramList;
  }

  public static class FontRecord
  {
    int fontId;
    String fontname;

    public FontRecord()
    {
    }

    public FontRecord(int paramInt, String paramString)
    {
      this.fontId = paramInt;
      this.fontname = paramString;
    }

    public void getContent(ByteBuffer paramByteBuffer)
    {
      IsoTypeWriter.writeUInt16(paramByteBuffer, this.fontId);
      IsoTypeWriter.writeUInt8(paramByteBuffer, this.fontname.length());
      paramByteBuffer.put(Utf8.convert(this.fontname));
    }

    public int getSize()
    {
      return 3 + Utf8.utf8StringLengthInBytes(this.fontname);
    }

    public void parse(ByteBuffer paramByteBuffer)
    {
      this.fontId = IsoTypeReader.readUInt16(paramByteBuffer);
      this.fontname = IsoTypeReader.readString(paramByteBuffer, IsoTypeReader.readUInt8(paramByteBuffer));
    }

    public String toString()
    {
      return "FontRecord{fontId=" + this.fontId + ", fontname='" + this.fontname + '\'' + '}';
    }
  }
}